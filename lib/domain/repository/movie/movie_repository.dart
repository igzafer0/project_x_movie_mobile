import 'package:project_x_movie_mobile/config/model/response_model.dart';

abstract class MovieRepository {
  Future<ResponseModel> movies(List<int> genres);
  Future<ResponseModel> random(int limit, List<int> genres);
}
