import 'package:core/network/client/remote_client.dart';
import 'package:core/network/dto/response_model.dart';
import 'package:genre/data/model/genre/genre_model.dart';

abstract class GenreRemoteDataSource {
  Future<ResponseModel<List<GenreModel>>> genres();
}

class GenreRemoteDataSourceImpl extends GenreRemoteDataSource {
  final RemoteClient remote;

  GenreRemoteDataSourceImpl({required this.remote});

  @override
  Future<ResponseModel<List<GenreModel>>> genres() async {
    var result = await remote.client.get("/genre");
    final response = ResponseModel<List<GenreModel>>.fromJson(
        result.data,
        (data) => (data as List<dynamic>)
            .map((item) => GenreModel.fromJson(item as Map<String, dynamic>))
            .toList());
    return response;
  }
}
