import 'package:core/network/dto/response_model.dart';
import 'package:genre/genre.dart';

abstract class GenreRepository {
  Future<ResponseModel<List<GenreModel>>> genres();
}
