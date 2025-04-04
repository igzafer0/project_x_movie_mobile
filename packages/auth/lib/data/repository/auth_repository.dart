import 'package:auth/data/model/login_model.dart';
import 'package:core/network/dto/response_model.dart';

abstract class AuthRepository {
  Future<ResponseModel> login(LoginModel model);
}
