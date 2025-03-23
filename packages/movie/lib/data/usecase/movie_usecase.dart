import 'package:core/network/dto/response_model.dart';
import 'package:movie/data/model/movie/movie_model.dart';
import 'package:movie/data/repository/movie_repository.dart';

class MovieUseCase {
  final MovieRepository repository;

  MovieUseCase(this.repository);
  Future<ResponseModel<List<MovieModel>>> movies({List<int>? genres}) {
    genres = genres ?? [];
    return repository.movies(genres);
  }

  Future<ResponseModel<List<MovieModel>>> random(
      {int? limit, List<int>? genres}) {
    limit = limit ?? 1;
    genres = genres ?? [];
    return repository.random(limit, genres);
  }
}
