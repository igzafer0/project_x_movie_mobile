import 'package:core/network/dto/response_model.dart';
import 'package:genre/data/model/genre/genre_model.dart';
import 'package:genre/data/repository/genre_repository.dart';
import 'package:genre/data/source/genre_remote_data_source.dart';

class GenreRepositoryImpl implements GenreRepository {
  final GenreRemoteDataSource remote;

  GenreRepositoryImpl(this.remote);

  @override
  Future<ResponseModel<List<GenreModel>>> genres() {
    return remote.genres();
  }
}
