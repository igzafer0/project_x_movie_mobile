import 'package:core/network/dto/response_model.dart';
import 'package:core/network/dto/token_model.dart';
import 'package:core/network/manager/shared_manager.dart';
import 'package:core/util/enum/preference_key_enum.dart';
import 'package:core/util/resource/authentication_source.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:project_x_movie_mobile/config/navigation/navigation_service.dart';
import 'package:project_x_movie_mobile/util/constant/navigation_constant.dart';

class AuthenticationManager {
  List<Map<RequestInterceptorHandler, RequestOptions>> tail = [];
  bool tailMode = false;
  final navigator = GetIt.I<NavigationService>();
  Future<void> validateRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final auth = AuthenticationSource();
    if (auth.isTokenStillValid()) {
      tail.add({handler: options});
      if (!tailMode) {
        _refreshTokenRequest(options, handler);
      }
    } else {
      options.headers.addAll({"Authorization": "Bearer ${auth.getToken()?.access}"});
      handler.next(options);
    }
  }

  Future<void> _refreshTokenRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    tailMode = true;

    final networkManager = Dio(
      BaseOptions(
        headers: {"Authorization": "Bearer ${SharedManager().getStringValue(PreferenceKey.REFRESH_TOKEN)}"},
        baseUrl: "https://movie.zafercetin.dev",
      ),
    );
    try {
      var token = await SharedManager().getStringValue(PreferenceKey.REFRESH_TOKEN);
      var result = await networkManager.post("/auth/refresh", options: Options(headers: {"Authorization": "Bearer $token"}));

      final parsed = ResponseModel<TokenModel>.fromJson(result.data, (data) => TokenModel.fromJson(data as Map<String, dynamic>));
      final auth = AuthenticationSource();
      auth.setToken(parsed.data!);

      options.headers.addAll({"Authorization": "Bearer ${auth.getToken()?.access}"});
      _runTail();
    } on DioException catch (_) {
      navigator.navigateToPageClear(path: NavigationConstant.LOGIN);
    }
    tail.clear();
    tailMode = false;
  }

  _runTail() {
    for (var element in tail) {
      element.forEach((key, value) {
        key.next(value);
      });
    }
  }
}
