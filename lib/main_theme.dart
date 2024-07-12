import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTheme {
  ThemeData base(ColorScheme colorScheme) {
    var theme = ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      inputDecorationTheme: _inputDecorationTheme(),
      filledButtonTheme: _filledButtonTheme(),
    );

    // static code
    theme = theme.copyWith(
      textTheme: GoogleFonts.cairoTextTheme(theme.textTheme),
    );

    return theme;
  }

  ThemeData light() {
    return base(
      const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff543CF7),
        onPrimary: Colors.white,
        error: Color(0xffFF5252),
        onError: Colors.white,
        secondary: Color(0xFF1852F2),
        onSecondary: Colors.white,
        surface: Colors.white,
        onSurface: Color(0xff333333),
      ),
    );
  }

  ThemeData dark() {
    return base(
      const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xff543CF7),
        onPrimary: Colors.white,
        error: Color(0xffFF5252),
        onError: Colors.white,
        secondary: Color(0xFF1852F2),
        onSecondary: Colors.white,
        surface: Color(0xFF141414),
        onSurface: Color(0xFFE8E8E8),
      ),
    );
  }

  InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }

  FilledButtonThemeData _filledButtonTheme() {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
