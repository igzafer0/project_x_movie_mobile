import 'package:core/network/dto/response_model.dart';
import 'package:movie/data/model/movie/movie_model.dart';
import 'package:movie/data/repository/movie_repository.dart';

class MovieUseCase {
  final MovieRepository repository;

  MovieUseCase(this.repository);
  Future<ResponseModel<List<MovieModel>>> random({int? limit, List<int>? genres}) async {
    limit = limit ?? 1;
    genres = genres ?? [];
    return await repository.random(limit, genres) as ResponseModel<List<MovieModel>>;
  }
}
