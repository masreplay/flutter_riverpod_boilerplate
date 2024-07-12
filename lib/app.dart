import 'package:flutter/material.dart';
import 'package:flutter_application_example/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = MainTheme();
    return MaterialApp(
      theme: theme.light(),
      darkTheme: theme.dark(),
      home: const LoginPage(),
    );
  }
}

class MainTheme {
  ThemeData light() {
    var theme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: _inputDecorationTheme(),
    );

    // static code
    theme =
        theme.copyWith(textTheme: GoogleFonts.cairoTextTheme(theme.textTheme));

    return theme;
  }

  ThemeData dark() {
    return ThemeData(
      inputDecorationTheme: _inputDecorationTheme(),
    );
  }

  InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
