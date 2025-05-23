import 'package:core/network/client/remote_client.dart';
import 'package:core/network/dto/response_model.dart';
import 'package:dio/dio.dart';
import 'package:movie/data/model/credit/credit_model.dart';
import 'package:movie/data/model/movie/movie_model.dart';
import 'package:movie/data/model/rate/rate_model.dart';

abstract class MovieRemoteDataSource {
  Future<ResponseModel> random(int limit, List<int> genres);
  Future<ResponseModel> detail(int movieID);
  Future<ResponseModel> credit(int movieID);
  Future<ResponseModel> similar(int movieID, int limit);
  Future<ResponseModel> getRate(int movieID);
  Future<ResponseModel> setRate(int movieID, double rate);
  Future<ResponseModel> recomendation(int limit);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final RemoteClient remote;

  MovieRemoteDataSourceImpl({required this.remote});

  @override
  Future<ResponseModel> random(int limit, List<int> genres) async {
    try {
      var result = await remote.client.get("/movie/random", queryParameters: {"limit": limit, "genre": genres.join(",")});
      final response = ResponseModel<List<MovieModel>>.fromJson(
        result.data,
        (data) => (data as List<dynamic>)
            .map(
              (item) => MovieModel.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
      );
      return response;
    } on DioException catch (e) {
      var eresult = ResponseModel<void>.fromJson(e.response?.data, (_) => {});
      return eresult;
    } catch (_) {
      return ResponseModel(status: false, message: "there is an error");
    }
  }

  @override
  Future<ResponseModel> detail(int movieID) async {
    try {
      var result = await remote.client.get("/movie/$movieID");
      final response = ResponseModel<MovieModel>.fromJson(result.data, (data) => MovieModel.fromJson(data as Map<String, dynamic>));
      return response;
    } on DioException catch (e) {
      var eresult = ResponseModel<void>.fromJson(e.response?.data, (_) => {});
      return eresult;
    } catch (_) {
      return ResponseModel(status: false, message: "there is an error");
    }
  }

  @override
  Future<ResponseModel> credit(int movieID) async {
    try {
      var result = await remote.client.get("/movie/$movieID/credit");
      final response = ResponseModel<List<CreditModel>>.fromJson(
        result.data,
        (data) => (data as List<dynamic>)
            .map(
              (item) => CreditModel.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
      );
      return response;
    } on DioException catch (e) {
      var eresult = ResponseModel<void>.fromJson(e.response?.data, (_) => {});
      return eresult;
    } catch (_) {
      return ResponseModel(status: false, message: "there is an error");
    }
  }

  @override
  Future<ResponseModel> similar(int movieID, int limit) async {
    try {
      var result = await remote.client.get("/movie/$movieID/similar", queryParameters: {"limit": limit});
      final response = ResponseModel<List<MovieModel>>.fromJson(
        result.data,
        (data) => (data as List<dynamic>)
            .map(
              (item) => MovieModel.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
      );
      return response;
    } on DioException catch (e) {
      var eresult = ResponseModel<void>.fromJson(e.response?.data, (_) => {});
      return eresult;
    } catch (_) {
      return ResponseModel(status: false, message: "there is an error");
    }
  }

  @override
  Future<ResponseModel> getRate(int movieID) async {
    try {
      var result = await remote.client.get("/movie/$movieID/rate");
      final response = ResponseModel<RateModel>.fromJson(result.data, (data) => RateModel.fromJson(data as Map<String, dynamic>));
      return response;
    } on DioException catch (e) {
      var eresult = ResponseModel<void>.fromJson(e.response?.data, (_) => {});
      return eresult;
    } catch (_) {
      return ResponseModel(status: false, message: "there is an error");
    }
  }

  @override
  Future<ResponseModel> setRate(int movieID, double rate) async {
    try {
      await remote.client.post("/movie/$movieID/rate", queryParameters: {"rate": rate});
      return ResponseModel(status: true, message: "The transaction was completed successfully.");
    } on DioException catch (e) {
      var eresult = ResponseModel<void>.fromJson(e.response?.data, (_) => {});
      return eresult;
    } catch (_) {
      return ResponseModel(status: false, message: "there is an error");
    }
  }

  @override
  Future<ResponseModel> recomendation(int limit) async {
    try {
      var result = await remote.client.get("/movie/recomendation", queryParameters: {"limit": limit});
      final response = ResponseModel<List<MovieModel>>.fromJson(
        result.data,
        (data) => (data as List<dynamic>)
            .map(
              (item) => MovieModel.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
      );
      return response;
    } on DioException catch (e) {
      var eresult = ResponseModel<void>.fromJson(e.response?.data, (_) => {});
      return eresult;
    } catch (_) {
      return ResponseModel(status: false, message: "there is an error");
    }
  }
}
