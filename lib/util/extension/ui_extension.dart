// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:project_x_movie_mobile/provider/theme_provider.dart';
import 'package:project_x_movie_mobile/util/enum/text_size.dart';
import 'package:provider/provider.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => watch<ThemeNotifier>().currentTheme;
  ColorScheme get colors => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
}

extension TextStyleExtension on BuildContext {
  TextStyle styler(TextSize textSize) {
    return switch (textSize) {
      TextSize.EXTREME_BIG => textTheme.headlineLarge!,
      TextSize.BIG_THIN => textTheme.displayLarge!,
      TextSize.BIG_TITLE => textTheme.titleLarge!,
      TextSize.TITLE => textTheme.titleMedium!,
      TextSize.SMALL_TITLE => textTheme.titleSmall!,
      TextSize.BIG_SUBTITLE => textTheme.bodyLarge!,
      TextSize.SUBTITLE => textTheme.bodyMedium!,
      TextSize.SMALL_SUBTITLE => textTheme.bodyLarge!,
      TextSize.BIG_PARAGRAPH => textTheme.labelLarge!,
      TextSize.PARAGRAPH => textTheme.labelMedium!,
      TextSize.SMALL_PARAGRAPH => textTheme.labelSmall!
    };
  }
}

extension MarginPaddingExtension on BuildContext {
  EdgeInsets get MidVerticalSpacer => const EdgeInsets.symmetric(vertical: 10);

  EdgeInsets get MidHorizontalSpacer =>
      const EdgeInsets.symmetric(horizontal: 10);

  EdgeInsets get MidRightSpacer => const EdgeInsets.only(right: 10);
}

extension ScreenSizeExtension on BuildContext {
  double get ScreenHeight => MediaQuery.of(this).size.height;
  double get ScreenWidth => MediaQuery.of(this).size.width;
}

extension SpacerSizeExtension on BuildContext {
  double get DoubleLargeSpacer => LargeSpacer * 2;
  double get LargeSpacer => 20;
  double get MidSpacer => 10;
  double get SmallSpacer => 5;
}

extension RadiusExtension on BuildContext {
  BorderRadius get MidRadius => const BorderRadius.all(Radius.circular(10));
}
