import 'package:core/network/client/remote_client.dart';
import 'package:core/network/dto/response_model.dart';
import 'package:movie/data/model/movie/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<ResponseModel<List<MovieModel>>> movies(List<int> genres);
  Future<ResponseModel<List<MovieModel>>> random(int limit, List<int> genres);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final RemoteClient remote;

  MovieRemoteDataSourceImpl({required this.remote});
  @override
  Future<ResponseModel<List<MovieModel>>> movies(List<int> genres) async {
    var result = await remote.client
        .get("/movie", queryParameters: {"genre": genres.join(",")});
    final response = ResponseModel<List<MovieModel>>.fromJson(
        result.data,
        (data) => (data as List<dynamic>)
            .map((item) => MovieModel.fromJson(item as Map<String, dynamic>))
            .toList());
    return response;
  }

  @override
  Future<ResponseModel<List<MovieModel>>> random(
      int limit, List<int> genres) async {
    var result = await remote.client.get("/movie/random",
        queryParameters: {"limit": limit, "genre": genres.join(",")});
    final response = ResponseModel<List<MovieModel>>.fromJson(
        result.data,
        (data) => (data as List<dynamic>)
            .map((item) => MovieModel.fromJson(item as Map<String, dynamic>))
            .toList());
    return response;
  }
}
