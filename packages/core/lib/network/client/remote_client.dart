import 'package:dio/dio.dart';

class RemoteClient {
  late Dio client;
  RemoteClient._internal(this.client);

  factory RemoteClient() {
    final client = Dio(
      BaseOptions(
        validateStatus: (status) => status == 200 || status == 204,
        connectTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        baseUrl: "https://movie.zafercetin.dev",
      ),
    );
    return RemoteClient._internal(client);
  }
}
