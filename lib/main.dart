import 'package:flutter/material.dart';
import 'package:flutter_application_example/app/features/main/data/repositories/fake_todo_repository.dart';
import 'package:flutter_application_example/app/features/main/data/repositories/todo_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'riverpod/shared_preferences.dart';

Future<void> main() async {
  // widgets
  WidgetsFlutterBinding.ensureInitialized();

  // edgar loading
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        todoRepositoryProvider.overrideWithValue(FakeTodoRepository()),
      ],
      child: const MainApp(),
    ),
  );
}
