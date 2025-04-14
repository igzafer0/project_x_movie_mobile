import 'package:core/network/dto/response_model.dart';
import 'package:movie/data/model/credit/credit_model.dart';
import 'package:movie/data/model/movie/movie_model.dart';
import 'package:movie/data/repository/movie_repository.dart';

class MovieUseCase {
  final MovieRepository repository;

  MovieUseCase(this.repository);
  Future<ResponseModel<List<MovieModel>>> random({int? limit, List<int>? genres}) async {
    limit = limit ?? 1;
    genres = genres ?? [];
    var result = await repository.random(limit, genres);
    if (result.status) {
      return result as ResponseModel<List<MovieModel>>;
    }
    return ResponseModel(status: result.status, message: result.message);
  }

  Future<ResponseModel<MovieModel>> detail(int movieID) async {
    var result = await repository.detail(movieID);
    if (result.status) {
      return result as ResponseModel<MovieModel>;
    }
    return ResponseModel(status: result.status, message: result.message);
  }

  Future<ResponseModel<List<CreditModel>>> credit(int movieID) async {
    var result = await repository.credit(movieID);
    if (result.status) {
      return result as ResponseModel<List<CreditModel>>;
    }
    return ResponseModel(status: result.status, message: result.message);
  }

  Future<ResponseModel<List<MovieModel>>> similar({required int movieID, int? limit}) async {
    limit = limit ?? 1;
    var result = await repository.similar(movieID, limit);
    if (result.status) {
      return result as ResponseModel<List<MovieModel>>;
    }
    return ResponseModel(status: result.status, message: result.message);
  }
}
