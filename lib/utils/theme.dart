import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {

  /// Light Theme
  ThemeData lightTheme(BuildContext context) => FlexColorScheme.light(
      scheme: FlexScheme.blueM3
  ).toTheme;

  /// Dark Theme
  ThemeData darkTheme(BuildContext context) => FlexColorScheme.dark(
      scheme: FlexScheme.blueM3
  ).toTheme;
}
