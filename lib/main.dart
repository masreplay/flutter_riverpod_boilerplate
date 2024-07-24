import 'package:flutter/material.dart';
import 'package:flutter_application_example/data/supabase/supabase_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'riverpod/shared_preferences.dart';

Future<void> main() async {
  // widgets
  WidgetsFlutterBinding.ensureInitialized();

  // load .env file
  await dotenv.load(fileName: ".env");

  // initialize supabase
  await SupabaseService.initialize();

  // edgar loading
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        // todoRepositoryProvider.overrideWithValue(FakeTodoRepository()),
      ],
      child: const MainApp(),
    ),
  );
}
