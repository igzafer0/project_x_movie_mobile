import 'package:core/presentation/core_view.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/page/splash/view_model/splash_viewmodel.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return CoreView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (context, value) => const SizedBox.shrink(),
    );
  }
}
