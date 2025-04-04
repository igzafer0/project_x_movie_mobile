import 'package:auth/data/model/login_model.dart';
import 'package:auth/data/repository/auth_repository.dart';
import 'package:auth/data/source/auth_remote_data_source.dart';
import 'package:core/network/dto/response_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<ResponseModel> login(LoginModel model) {
    return remote.login(model);
  }
}
