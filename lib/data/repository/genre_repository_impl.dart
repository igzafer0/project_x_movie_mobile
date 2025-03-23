import 'package:project_x_movie_mobile/config/model/response_model.dart';
import 'package:project_x_movie_mobile/data/source/remote/genre/genre_remote_data_soruce.dart';
import 'package:project_x_movie_mobile/domain/repository/genre/genre_repository.dart';
import 'package:project_x_movie_mobile/injection_container.dart';

class GenreRepositoryImpl implements GenreRepository {
  @override
  Future<ResponseModel> genres() async {
    return locator<GenreRemoteDataSource>().genres();
  }
}
