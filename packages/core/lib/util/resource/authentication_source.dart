import 'package:core/network/dto/token_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthenticationSource {
  static final AuthenticationSource _instance = AuthenticationSource._privateConstructor();

  AuthenticationSource._privateConstructor();

  factory AuthenticationSource() => _instance;

  TokenModel? _tokenModel;

  String resetPasswordToken = "";

  TokenModel? getToken() => _tokenModel;

  void setToken(TokenModel token) {
    _tokenModel = token;
  }

  void clearAccessToken() {
    _tokenModel = null;
  }

  bool isTokenStillValid() {
    final token = _tokenModel?.access;
    return token == null || !JwtDecoder.isExpired(token);
  }
}
