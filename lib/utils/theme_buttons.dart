import 'package:flutter/material.dart';
import 'package:sarkari_yojna_flutter/utils/color_scheme.dart';
import 'package:sarkari_yojna_flutter/utils/text_themes.dart';

ElevatedButtonThemeData getElevatedButtonThemeData(
  BuildContext context,
) => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: context.textTheme.labelLarge,
        backgroundColor: context.colors.primary,
        foregroundColor: context.colors.onPrimary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(36),
          ),
        ),
      ),
);
