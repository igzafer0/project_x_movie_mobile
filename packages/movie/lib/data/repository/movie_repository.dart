import 'package:core/core.dart';
import 'package:movie/data/model/movie/movie_model.dart'; // artık response modelini alırsın

abstract class MovieRepository {
  Future<ResponseModel<List<MovieModel>>> movies(List<int> genres);
  Future<ResponseModel<List<MovieModel>>> random(int limit, List<int> genres);
}
