import 'package:dashboard/page/explorer/view/explorer_view.dart';
import 'package:flutter/material.dart';
import 'package:project_x_movie_mobile/util/constant/navigation_constant.dart';

class NavigationRoute {
  var isTeacher = false;
  Route<dynamic> generateRoute(RouteSettings args) {
    return switch (args.name) {
      NavigationConstant.DEFAULT => normalNavigate(const ExplorerView(), NavigationConstant.DEFAULT),
      _ => MaterialPageRoute(builder: (context) => const SizedBox())
    };
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName),
    );
  }
}
