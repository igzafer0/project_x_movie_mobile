// ignore_for_file: library_private_types_in_public_api

import 'package:auth/data/model/login_model.dart';
import 'package:auth/data/usecase/auth_usecase.dart';
import 'package:core/constant/color_constant.dart';
import 'package:core/presentation/core_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'login_viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, CoreViewModel {
  final authUseCase = GetIt.I<AuthUseCase>();
  @override
  void init() {}

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  Future<void> doLogin() async {
    var result = await authUseCase.login(login: LoginModel(email: "zaferkurumsal@gmail.com", password: "08460846"));
    Fluttertoast.showToast(
      msg: result.error ?? "Get an error",
      toastLength: Toast.LENGTH_SHORT, // ya da Toast.LENGTH_LONG
      gravity: ToastGravity.TOP, // TOP, CENTER, BOTTOM
      timeInSecForIosWeb: 1,
      backgroundColor: ColorConstant.SECONDARY_COLOR,
      textColor: ColorConstant.PRIMARY_TEXT_COLOR,
      fontSize: 16.0,
    );
  }
}
