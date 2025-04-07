import 'package:core/network/middleware/authentication_middleware.dart';
import 'package:core/util/resource/authentication_source.dart';
import 'package:dio/dio.dart';

class RemoteClient {
  late Dio client;
  RemoteClient._internal(this.client);

  factory RemoteClient() {
    final auth = AuthenticationSource();

    final client = Dio(
      BaseOptions(
        validateStatus: (status) => status == 200 || status == 204,
        connectTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        baseUrl: "https://movie.zafercetin.dev",
        headers: {"Authorization": "Bearer ${auth.getToken()?.access}"},
      ),
    )..interceptors.add(AuthenticationMiddleware());
    return RemoteClient._internal(client);
  }
}
