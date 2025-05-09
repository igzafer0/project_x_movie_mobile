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
        connectTimeout: const Duration(minutes: 1),
        sendTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
        baseUrl: "https://movie.zafercetin.dev",
        headers: {"Authorization": "Bearer ${auth.getToken()?.access}"},
      ),
    )..interceptors.add(AuthenticationMiddleware());
    return RemoteClient._internal(client);
  }
}
