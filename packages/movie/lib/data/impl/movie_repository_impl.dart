import 'package:core/network/dto/response_model.dart';
import 'package:movie/data/model/movie/movie_model.dart';
import 'package:movie/data/repository/movie_repository.dart';
import 'package:movie/data/source/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remote;

  MovieRepositoryImpl(this.remote);
  @override
  Future<ResponseModel<List<MovieModel>>> movies(List<int> genres) async {
    return remote.movies(genres);
  }

  @override
  Future<ResponseModel<List<MovieModel>>> random(int limit, List<int> genres) {
    return remote.random(limit, genres);
  }
}
