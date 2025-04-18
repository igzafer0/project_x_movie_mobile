import 'package:auth/page/login/view/login_view.dart';
import 'package:dashboard/page/orchestrator/view/orchestrator_page_view.dart';
import 'package:flutter/material.dart';
import 'package:movie/page/movie_detail/view/movie_detail_page_view.dart';
import 'package:onboarding/page/splash/view/splash_view.dart';
import 'package:project_x_movie_mobile/util/constant/navigation_constant.dart';
import 'package:search/presentation/search_dashboard/view/search_dashboard_page_view.dart';

class NavigationRoute {
  Route<dynamic> generateRoute(RouteSettings args) {
    return switch (args.name) {
      NavigationConstant.DEFAULT => normalNavigate(const SplashView(), NavigationConstant.DEFAULT),
      NavigationConstant.HOME => normalNavigate(const OrchestratorPageView(), NavigationConstant.HOME),
      NavigationConstant.MOVIE_DETAIL => normalNavigate(MovieDetailPageView(args.arguments as int), NavigationConstant.MOVIE_DETAIL),
      NavigationConstant.LOGIN => normalNavigate(LoginView(), NavigationConstant.LOGIN),
      NavigationConstant.SEARCH => normalNavigate(SearchDashboardPageView(), NavigationConstant.SEARCH),
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
