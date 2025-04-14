import 'package:core/network/dto/response_model.dart';
import 'package:core/network/dto/token_model.dart';
import 'package:core/network/manager/authentication_manager.dart';
import 'package:core/network/manager/shared_manager.dart';
import 'package:core/util/enum/preference_key_enum.dart';
import 'package:core/util/resource/authentication_source.dart';
import 'package:dio/dio.dart';

class AuthenticationMiddleware implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.uri.path == "/auth/me" || !options.uri.path.startsWith("/auth")) {
      AuthenticationManager().validateRequest(options, handler);
    } else {
      handler.next(options);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.realUri.path.startsWith("/auth") && response.realUri.path != "/auth/me") {
      final auth = AuthenticationSource();
      final parsed = ResponseModel<TokenModel>.fromJson(response.data, (data) => TokenModel.fromJson(data as Map<String, dynamic>));
      auth.setToken(parsed.data!);
      SharedManager().setStringValue(PreferenceKey.REFRESH_TOKEN, parsed.data!.refresh!);
    }
    handler.next(response);
  }
}
