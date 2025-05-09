// ignore_for_file: library_private_types_in_public_api

import 'package:core/presentation/core_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:onboarding/data/usercase/onboarding_usecase.dart';
import 'package:project_x_movie_mobile/util/constant/navigation_constant.dart';
part 'splash_viewmodel.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, CoreViewModel {
  final onboardingUseCase = GetIt.I<OnboardingUseCase>();

  @override
  void init() {
    _getMe();
  }

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  Future<void> _getMe() async {
    var result = await onboardingUseCase.me();
    if (result.status) {
      navigator.navigateToPageClear(path: NavigationConstant.HOME);
    }
  }
}
