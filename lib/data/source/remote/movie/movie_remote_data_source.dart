import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:project_x_movie_mobile/config/data/remote_manager.dart';
import 'package:project_x_movie_mobile/config/model/response_model.dart';
import 'package:project_x_movie_mobile/data/dto/movie/movie_model.dart';
import 'package:project_x_movie_mobile/injection_container.dart';

abstract class MovieRemoteDataSource {
  Future<ResponseModel> movies(List<int> genres);
  Future<ResponseModel> random(int limit, List<int> genres);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  @override
  Future<ResponseModel> movies(List<int> genres) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get("/movie", queryParameters: {"genre": genres.join(",")});
      final response = ResponseModel<List<MovieModel>>.fromJson(
          result.data,
          (data) => (data as List<dynamic>)
              .map((item) => MovieModel.fromJson(item as Map<String, dynamic>))
              .toList());
      return response;
    } on DioException catch (e) {
      var eresult =
          ResponseModel<void>.fromJson(jsonDecode(e.response?.data), (_) => {});
      return eresult;
    }
  }

  @override
  Future<ResponseModel> random(int limit, List<int> genres) async {
    try {
      var result = await locator<RemoteManager>().networkManager.get(
          "/movie/random",
          queryParameters: {"limit": limit, "genre": genres.join(",")});
      final response = ResponseModel<List<MovieModel>>.fromJson(
          result.data,
          (data) => (data as List<dynamic>)
              .map((item) => MovieModel.fromJson(item as Map<String, dynamic>))
              .toList());
      return response;
    } on DioException catch (e) {
      var eresult =
          ResponseModel<void>.fromJson(jsonDecode(e.response?.data), (_) => {});
      return eresult;
    }
  }
}
