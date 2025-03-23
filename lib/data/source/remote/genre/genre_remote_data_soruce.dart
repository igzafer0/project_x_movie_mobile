import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:project_x_movie_mobile/config/data/remote_manager.dart';
import 'package:project_x_movie_mobile/config/model/response_model.dart';
import 'package:project_x_movie_mobile/data/dto/genre/genre_model.dart';
import 'package:project_x_movie_mobile/injection_container.dart';

abstract class GenreRemoteDataSource {
  Future<ResponseModel> genres();
}

class GenreRemoteDataSourceImpl extends GenreRemoteDataSource {
  @override
  Future<ResponseModel> genres() async {
    try {
      var result = await locator<RemoteManager>().networkManager.get("/genre");
      final response = ResponseModel<List<GenreModel>>.fromJson(
          result.data,
          (data) => (data as List<dynamic>)
              .map((item) => GenreModel.fromJson(item as Map<String, dynamic>))
              .toList());

      return response;
    } on DioException catch (e) {
      var eresult =
          ResponseModel<void>.fromJson(jsonDecode(e.response?.data), (_) => {});
      return eresult;
    }
  }
}
