import 'package:project_x_movie_mobile/config/model/response_model.dart';

abstract class GenreRepository {
  Future<ResponseModel> genres();
}
