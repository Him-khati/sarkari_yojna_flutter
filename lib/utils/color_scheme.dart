import 'package:flutter/material.dart';

extension ColorSchemeExtensions on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}
