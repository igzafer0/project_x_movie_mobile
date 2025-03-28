import 'package:flutter/material.dart';
import 'package:project_x_movie_mobile/util/constant/navigation_constant.dart';

abstract class INavigationService {
  Future<void> pop();
  Future<void> maybePop();
  Future<void> navigateToPage({required String path, Object? data});
  Future<void> navigateToPagePop({required String path, Object? data});
  Future<void> navigateToPageClear({required String path, Object? data});
}

class NavigationService implements INavigationService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  String currentPage = NavigationConstant.DEFAULT;

  // Esnek route temizleme
  bool removeAllOldRoutes(Route<dynamic> route) {
    return route.settings.name != currentPage;
  }

  @override
  Future<void> navigateToPage({required String path, Object? data}) async {
    currentPage = path;
    if (navigatorKey.currentState != null) {
      await navigatorKey.currentState!.pushNamed(path, arguments: data);
    } else {
      //TODO Handle null navigatorState (e.g., show error message or log it)
    }
  }

  @override
  Future<void> navigateToPageClear({required String path, Object? data}) async {
    currentPage = path;
    if (navigatorKey.currentState != null) {
      await navigatorKey.currentState!.pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
    }
  }

  @override
  Future<void> navigateToPagePop({required String path, Object? data}) async {
    currentPage = path;
    if (navigatorKey.currentState != null) {
      await navigatorKey.currentState!.popAndPushNamed(path, arguments: data);
    }
  }

  @override
  Future<void> pop({Object? data}) async {
    if (navigatorKey.currentState != null) {
      navigatorKey.currentState!.pop(data);
    }
  }

  @override
  Future<void> maybePop() async {
    if (navigatorKey.currentState != null) {
      navigatorKey.currentState!.maybePop();
    }
  }

  // Sayfa durumu kontrolü
  String getCurrentPage() {
    return currentPage;
  }
}
