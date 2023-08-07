import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultThemeGetter {
  static ThemeData get() {
    const primary = Color(0xFFEC7C26);
    const secondary = Color(0xFF1E213D);
    const onBackground = Colors.black;
    const background = Colors.white;

    return ThemeData(
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder()},
      ),
      primaryColor: primary,
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.robotoSlab(
          fontWeight: FontWeight.w700,
          fontSize: 50.0,
          height: 1.1,
          color: primary,
        ),
        headlineMedium: GoogleFonts.robotoSlab(
          fontWeight: FontWeight.w700,
          fontSize: 40.0,
          height: 1.1,
          color: primary,
        ),
        displayLarge: GoogleFonts.robotoSlab(
          fontWeight: FontWeight.w700,
          fontSize: 150.0,
          height: 1.1,
          color: primary,
        ),
        displaySmall: GoogleFonts.robotoSlab(
          fontWeight: FontWeight.w400,
          // fontSize: 10.0,
          height: 1.1,
          color: primary,
        ),
        displayMedium: GoogleFonts.robotoSlab(
          fontWeight: FontWeight.w700,
          fontSize: 35,
          height: 1.1,
          color: secondary,
        ),
        labelMedium: GoogleFonts.robotoSlab(
          fontWeight: FontWeight.w700,
          fontSize: 30,
          height: 1.1,
          color: onBackground,
        ),
        labelSmall: GoogleFonts.robotoSlab(
          fontWeight: FontWeight.w400,
          fontSize: 20.0,
          height: 1.0,
          color: Colors.red,
        ),
      ),
      colorScheme: const ColorScheme(
        primary: primary,
        secondary: secondary,
        surface: Color(0xFF1f252a),
        onSurface: Colors.white,
        background: background,
        secondaryContainer: Colors.white,
        onBackground: onBackground,
        error: Colors.white,
        onError: Colors.white,
        brightness: Brightness.light,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
      ),
    );
  }
}
