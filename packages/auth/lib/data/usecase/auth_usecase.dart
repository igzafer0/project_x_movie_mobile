import 'package:auth/data/model/login_model.dart';
import 'package:auth/data/repository/auth_repository.dart';
import 'package:core/network/dto/response_model.dart';

class AuthUseCase {
  final AuthRepository repository;

  AuthUseCase(this.repository);
  Future<ResponseModel> login({required LoginModel login}) async {
    var result = await repository.login(login);
    return result;
  }
}
