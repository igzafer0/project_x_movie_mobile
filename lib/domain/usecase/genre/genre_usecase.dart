import 'package:project_x_movie_mobile/config/model/response_model.dart';
import 'package:project_x_movie_mobile/domain/repository/genre/genre_repository.dart';
import 'package:project_x_movie_mobile/injection_container.dart';

class GenreUseCase {
  Future<ResponseModel> genres() {
    return locator<GenreRepository>().genres();
  }
}
