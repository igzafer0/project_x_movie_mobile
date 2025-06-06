// ignore_for_file: non_constant_identifier_names

import 'package:core/enum/text_size.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
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
  EdgeInsets get LargeRightSpacer => const EdgeInsets.only(right: 15);

  EdgeInsets get XLargeAllSpacer => const EdgeInsets.all(30);
  EdgeInsets get LargeAllSpacer => const EdgeInsets.all(20);

  EdgeInsets get MidVerticalSpacer => const EdgeInsets.symmetric(vertical: 10);

  EdgeInsets get MidHorizontalSpacer => const EdgeInsets.symmetric(horizontal: 10);

  EdgeInsets get MidRightSpacer => const EdgeInsets.only(right: 10);
  EdgeInsets get MidAllSpacer => const EdgeInsets.all(10);
  EdgeInsets get SmallAllSpacer => const EdgeInsets.all(5);
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
  BorderRadius get SmallRadius => const BorderRadius.all(Radius.circular(5));
}
