import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_x_movie_mobile/config/navigation/navigation_route.dart';
import 'package:project_x_movie_mobile/config/navigation/navigation_service.dart';
import 'package:project_x_movie_mobile/injection_container.dart';
import 'package:project_x_movie_mobile/provider/provider_manager.dart';
import 'package:project_x_movie_mobile/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(
    MultiProvider(
      providers: [
        ...ProviderManager.instance.dependItems,
      ],
      child: const ProjectXMovie(),
    ),
  );
}

class ProjectXMovie extends StatelessWidget {
  const ProjectXMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (c, x) {
        return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.noScaling),
            child: x!);
      },
      debugShowCheckedModeBanner: false,
      onGenerateRoute: locator.get<NavigationRoute>().generateRoute,
      navigatorKey: locator.get<NavigationService>().navigatorKey,
      theme: context.watch<ThemeNotifier>().currentTheme,
    );
  }
}
