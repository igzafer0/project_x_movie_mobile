import 'package:core/network/dto/response_model.dart';
import 'package:genre/data/model/genre/genre_model.dart';
import 'package:genre/data/repository/genre_repository.dart';

class GenreUseCase {
  final GenreRepository repository;

  GenreUseCase(this.repository);
  Future<ResponseModel<List<GenreModel>>> genres({List<int>? genres}) {
    return repository.genres();
  }
}
