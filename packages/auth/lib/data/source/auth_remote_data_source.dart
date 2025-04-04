import 'package:auth/data/model/login_model.dart';
import 'package:core/network/client/remote_client.dart';
import 'package:core/network/dto/response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class AuthRemoteDataSource {
  Future<ResponseModel> login(LoginModel model);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final RemoteClient remote;

  AuthRemoteDataSourceImpl({required this.remote});

  @override
  Future<ResponseModel> login(LoginModel model) async {
    try {
      await remote.client.post("/auth/login", data: model.toJson());
      return ResponseModel(status: true, message: "Proses successful");
    } on DioException catch (e) {
      var eresult = ResponseModel.fromJson(e.response?.data, (e) => {e});

      return eresult;
    } catch (_) {
      debugPrint("catch");
      return ResponseModel(status: false, message: "there is an error");
    }
  }
}
