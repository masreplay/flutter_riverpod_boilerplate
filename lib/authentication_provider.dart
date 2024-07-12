import 'package:flutter_application_example/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
String? token(TokenRef ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);

  return sharedPreferences.getString('token');
}
