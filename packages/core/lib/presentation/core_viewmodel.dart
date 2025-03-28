import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_x_movie_mobile/config/navigation/navigation_service.dart';

mixin CoreViewModel {
  late BuildContext viewModelContext;
  void setContext(BuildContext context);
  void init();
  final navigator = GetIt.I<NavigationService>();
}
