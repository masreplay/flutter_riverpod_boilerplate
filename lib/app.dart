import 'package:flutter/material.dart';
import 'package:flutter_application_example/app/features/authentication/authentication_provider.dart';
import 'package:flutter_application_example/app/features/authentication/login/login_page.dart';
import 'package:flutter_application_example/app/features/main/presentation/home/home_page.dart';
import 'package:flutter_application_example/main_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainApp extends HookConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(authenticationProvider);

    final theme = MainTheme();
    return MaterialApp(
      // Change using state management
      themeMode: ThemeMode.dark,
      theme: theme.light(),
      darkTheme: theme.dark(),

      // Change using state management
      locale: const Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      home: token == null ? const LoginPage() : const HomePage(),
    );
  }
}
