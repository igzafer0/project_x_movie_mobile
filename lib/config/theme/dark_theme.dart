import 'package:flutter/material.dart';
import 'package:project_x_movie_mobile/config/theme/theme_manager.dart';
import 'package:core/constant/color_constant.dart';
import 'package:core/constant/common_constant.dart';

class DarkTheme extends ThemeManager {
  static DarkTheme? _instance;
  static DarkTheme get instance {
    _instance ??= DarkTheme._init();
    return _instance!;
  }

  DarkTheme._init();

  @override
  ThemeData get theme => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: ColorConstant.PRIMARY_COLOR,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              fontFamily: CommonConstant.FONT_FAMILY),

          displayLarge: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              fontFamily: CommonConstant.FONT_FAMILY),

          //  Title
          titleLarge: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: CommonConstant.FONT_FAMILY),
          titleMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: CommonConstant.FONT_FAMILY),
          titleSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: CommonConstant.FONT_FAMILY),

          //Body
          bodyMedium: TextStyle(fontFamily: CommonConstant.FONT_FAMILY),

          bodyLarge: TextStyle(fontFamily: CommonConstant.FONT_FAMILY),

          // Label
          labelLarge: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              fontFamily: CommonConstant.FONT_FAMILY),

          labelMedium: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              fontFamily: CommonConstant.FONT_FAMILY),

          labelSmall: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              fontFamily: CommonConstant.FONT_FAMILY),
        ),
        buttonTheme: const ButtonThemeData(
            colorScheme: ColorScheme(
          surface: ColorConstant.PRIMARY_COLOR,
          brightness: Brightness.light,
          error: Colors.red,
          onSurface: Colors.black54,
          onError: Colors.red,
          onPrimary: Colors.black54,
          onSecondary: Colors.black54,
          primary: Colors.black54,
          secondary: Colors.black54,
        )),
      );
}
