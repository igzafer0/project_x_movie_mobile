import 'package:core/core.dart';

abstract class MovieRepository {
  Future<ResponseModel> random(int limit, List<int> genres);
  Future<ResponseModel> detail(int movieID);
  Future<ResponseModel> credit(int movieID);
  Future<ResponseModel> similar(int movieID, int limit);
}
