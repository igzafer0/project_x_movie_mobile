import 'package:core/network/dto/response_model.dart';
import 'package:movie/data/repository/movie_repository.dart';
import 'package:movie/data/source/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remote;

  MovieRepositoryImpl(this.remote);

  @override
  Future<ResponseModel> random(int limit, List<int> genres) {
    return remote.random(limit, genres);
  }

  @override
  Future<ResponseModel> detail(int movieID) {
    return remote.detail(movieID);
  }
}
