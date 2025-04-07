import 'package:core/network/client/remote_client.dart';
import 'package:core/network/dto/response_model.dart';
import 'package:dio/dio.dart';

abstract class OnboardingRemoteDataSource {
  Future<ResponseModel> me();
}

class OnboardingRemoteDataSourceImpl extends OnboardingRemoteDataSource {
  final RemoteClient remote;

  OnboardingRemoteDataSourceImpl({required this.remote});

  @override
  Future<ResponseModel> me() async {
    try {
      await remote.client.get("/auth/me");
      return ResponseModel(status: true, message: "succ");
    } on DioException catch (e) {
      var eresult = ResponseModel<void>.fromJson(e.response?.data, (_) => {});
      return eresult;
    } catch (_) {
      return ResponseModel(status: false, message: "there is an error");
    }
  }
}
