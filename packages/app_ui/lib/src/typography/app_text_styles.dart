import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// Content Text Style Definitions
abstract class UITextStyle {
  static const _baseTextStyle = TextStyle(
    package: 'app_ui',
    fontWeight: AppFontWeight.medium,
    fontFamily: 'Inter',
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );

  /// Display 1 Text Style
  static final TextStyle display1 = _baseTextStyle.copyWith(
    fontSize: 64,
    fontWeight: AppFontWeight.bold,
    height: 1.18,
    letterSpacing: -0.5,
  );

  /// Display 2 Text Style
  static final TextStyle display2 = _baseTextStyle.copyWith(
    fontSize: 57,
    fontWeight: AppFontWeight.bold,
    height: 1.12,
    letterSpacing: -0.25,
  );

  /// Display 3 Text Style
  static final TextStyle display3 = _baseTextStyle.copyWith(
    fontSize: 45,
    fontWeight: AppFontWeight.bold,
    height: 1.15,
  );

  /// Headline 1 Text Style
  static final TextStyle headline1 = _baseTextStyle.copyWith(
    fontSize: 57,
    fontWeight: AppFontWeight.semiBold,
    height: 1.22,
  );

  /// Headline 2 Text Style
  static final TextStyle headline2 = _baseTextStyle.copyWith(
    fontSize: 45,
    fontWeight: AppFontWeight.medium,
    height: 1.25,
  );

  /// Headline 3 Text Style
  static final TextStyle headline3 = _baseTextStyle.copyWith(
    fontSize: 36,
    fontWeight: AppFontWeight.medium,
    height: 1.28,
  );

  /// Headline 4 Text Style
  static final TextStyle headline4 = _baseTextStyle.copyWith(
    fontSize: 32,
    fontWeight: AppFontWeight.semiBold,
    height: 1.33,
  );

  /// Headline 5 Text Style
  static final TextStyle headline5 = _baseTextStyle.copyWith(
    fontSize: 28,
    fontWeight: AppFontWeight.semiBold,
    height: 1.33,
  );

  /// Headline 6 Text Style
  static final TextStyle headline6 = _baseTextStyle.copyWith(
    fontFamily: 'Inter',
    fontSize: 24,
    height: 1.27,
    fontWeight: AppFontWeight.bold,
  );

  /// Headline 7 Text Style
  static final TextStyle headline7 = _baseTextStyle.copyWith(
    fontSize: 22,
    fontWeight: AppFontWeight.semiBold,
    height: 1.33,
  );

  /// Subtitle 1 Text Style
  static final TextStyle subtitle1 = _baseTextStyle.copyWith(
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.1,
  );

  /// Subtitle 2 Text Style
  static final TextStyle subtitle2 = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: AppFontWeight.medium,
    height: 1.42,
    letterSpacing: 0.1,
  );

  /// Body Text 1 Text Style
  static final TextStyle bodyText1 = _baseTextStyle.copyWith(
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.5,
  );

  /// Body Text 2 Text Style (the default)
  static final TextStyle bodyText2 = _baseTextStyle.copyWith(
    fontSize: 14,
    height: 1.42,
    letterSpacing: 0.25,
  );

  /// Button Text Style
  static final TextStyle button = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: AppFontWeight.bold,
    height: 1.42,
    letterSpacing: 0.1,
  );

  /// Caption Text Style
  static final TextStyle caption = _baseTextStyle.copyWith(
    fontSize: 12,
    height: 1.33,
    letterSpacing: 0.4,
  );

  /// OverLine Text Style
  static final TextStyle overLine = _baseTextStyle.copyWith(
    fontWeight: AppFontWeight.semiBold,
    fontSize: 12,
    height: 1.33,
    letterSpacing: 0.5,
  );

  /// Label Small Text Style
  static final TextStyle labelSmall = _baseTextStyle.copyWith(
    fontSize: 11,
    height: 1.45,
    letterSpacing: 0.5,
  );
}
