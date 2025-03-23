import 'package:project_x_movie_mobile/config/model/response_model.dart';
import 'package:project_x_movie_mobile/domain/repository/movie/movie_repository.dart';
import 'package:project_x_movie_mobile/injection_container.dart';

class MovieUseCase {
  Future<ResponseModel> movies({List<int>? genres}) {
    genres = genres ?? [];
    return locator<MovieRepository>().movies(genres);
  }

  Future<ResponseModel> random({int? limit, List<int>? genres}) {
    limit = limit ?? 1;
    genres = genres ?? [];

    return locator<MovieRepository>().random(limit, genres);
  }
}
