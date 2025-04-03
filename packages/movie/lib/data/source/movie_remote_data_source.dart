import 'package:core/network/client/remote_client.dart';
import 'package:core/network/dto/response_model.dart';
import 'package:dio/dio.dart';
import 'package:movie/data/model/movie/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<ResponseModel> random(int limit, List<int> genres);
  Future<ResponseModel> detail(int movieID);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final RemoteClient remote;

  MovieRemoteDataSourceImpl({required this.remote});

  @override
  Future<ResponseModel> random(int limit, List<int> genres) async {
    try {
      var result = await remote.client.get("/movie/random", queryParameters: {"limit": limit, "genre": genres.join(",")});
      final response = ResponseModel<List<MovieModel>>.fromJson(
        result.data,
        (data) => (data as List<dynamic>)
            .map(
              (item) => MovieModel.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
      );
      return response;
    } on DioException catch (e) {
      var eresult = ResponseModel<void>.fromJson(e.response?.data, (_) => {});
      return eresult;
    }
  }

  @override
  Future<ResponseModel> detail(int movieID) async {
    try {
      var result = await remote.client.get("/movie/$movieID");
      final response = ResponseModel<MovieModel>.fromJson(result.data, (data) => MovieModel.fromJson(data as Map<String, dynamic>));
      return response;
    } on DioException catch (e) {
      var eresult = ResponseModel<void>.fromJson(e.response?.data, (_) => {});
      return eresult;
    }
  }
}
