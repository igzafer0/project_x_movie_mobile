import 'package:flutter/material.dart';
import 'package:project_x_movie_mobile/config/navigation/navigation_service.dart';
import 'package:project_x_movie_mobile/injection_container.dart';

mixin CoreViewModel {
  late BuildContext viewModelContext;
  void setContext(BuildContext context);
  void init();

  NavigationService navigation = locator.get<NavigationService>();
}
