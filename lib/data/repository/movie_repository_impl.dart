import 'package:project_x_movie_mobile/config/model/response_model.dart';
import 'package:project_x_movie_mobile/data/source/remote/movie/movie_remote_data_source.dart';
import 'package:project_x_movie_mobile/domain/repository/movie/movie_repository.dart';
import 'package:project_x_movie_mobile/injection_container.dart';

class MovieRepositoryImpl implements MovieRepository {
  @override
  Future<ResponseModel> movies(List<int> genres) async {
    return locator<MovieRemoteDataSource>().movies(genres);
  }

  @override
  Future<ResponseModel> random(int limit, List<int> genres) {
    return locator<MovieRemoteDataSource>().random(limit, genres);
  }
}
