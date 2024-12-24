import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sarkari_yojna_flutter/utils/screen_size_util.dart';

extension TextThemeExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Returns base text Theme
  TextTheme get defaultTextTheme => _buildTheme(
        this,
        GoogleFonts.notoSansHanunoo(),
      );

  /// returns the highlighted text theme
  TextTheme get highlightTextTheme => _buildTheme(
        this,
        GoogleFonts.playfairDisplay(),
      );

  TextTheme _buildTheme(
    BuildContext context,
    TextStyle textStyle,
  ) {
    bool isLargeScreen = ScreenSizeUtil.isLargeScreen(context);
    bool isMediumScreen = ScreenSizeUtil.isMediumScreen(context);
    bool _ = ScreenSizeUtil.isSmallScreen(context);

    return TextTheme(
      displayLarge: textStyle.copyWith(
        fontSize: isLargeScreen ? 57 : (isMediumScreen ? 48 : 40),
        fontWeight: FontWeight.normal,
      ),
      displayMedium: textStyle.copyWith(
        fontSize: isLargeScreen ? 45 : (isMediumScreen ? 38 : 32),
        fontWeight: FontWeight.normal,
      ),
      displaySmall: textStyle.copyWith(
        fontSize: isLargeScreen ? 36 : (isMediumScreen ? 30 : 28),
        fontWeight: FontWeight.normal,
      ),
      headlineLarge: textStyle.copyWith(
        fontSize: isLargeScreen ? 42 : (isMediumScreen ? 35 : 28),
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: textStyle.copyWith(
        fontSize: isLargeScreen ? 28 : (isMediumScreen ? 24 : 22),
        fontWeight: FontWeight.w900,
      ),
      headlineSmall: textStyle.copyWith(
        fontSize: isLargeScreen ? 24 : (isMediumScreen ? 20 : 18),
        fontWeight: FontWeight.w500,
      ),
      titleLarge: textStyle.copyWith(
        fontSize: isLargeScreen ? 22 : (isMediumScreen ? 20 : 18),
        fontWeight: FontWeight.w700,
      ),
      titleMedium: textStyle.copyWith(
        fontSize: isLargeScreen ? 16 : (isMediumScreen ? 15 : 14),
        fontWeight: FontWeight.w600,
      ),
      titleSmall: textStyle.copyWith(
        fontSize: isLargeScreen ? 14 : (isMediumScreen ? 13 : 12),
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: textStyle.copyWith(
        fontSize: isLargeScreen ? 16 : (isMediumScreen ? 15 : 14),
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: textStyle.copyWith(
        fontSize: isLargeScreen ? 14 : (isMediumScreen ? 13 : 12),
        fontWeight: FontWeight.normal,
      ),
      bodySmall: textStyle.copyWith(
        fontSize: isLargeScreen ? 12 : (isMediumScreen ? 11 : 10),
        fontWeight: FontWeight.normal,
      ),
      labelLarge: textStyle.copyWith(
        fontSize: isLargeScreen ? 16 : (isMediumScreen ? 15 : 14),
        fontWeight: FontWeight.w600,
      ),
      labelMedium: textStyle.copyWith(
        fontSize: isLargeScreen ? 14 : (isMediumScreen ? 13 : 12),
        fontWeight: FontWeight.w600,
      ),
      labelSmall: textStyle.copyWith(
        fontSize: isLargeScreen ? 11 : (isMediumScreen ? 10 : 9),
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
