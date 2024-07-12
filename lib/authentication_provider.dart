import 'package:flutter_application_example/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

class LoginResponse {
  final String message;
  final String token;

  const LoginResponse(
    this.message,
    this.token,
  );
}

@riverpod
class Authentication extends _$Authentication {
  // provider
  @override
  String? build() {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);

    return sharedPreferences.getString(Preferences.token);
  }

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    final result = await Future.delayed(
      const Duration(seconds: 2),
      () => const LoginResponse(
        'Login successful',
        'token',
      ),
    );

    final sharedPreferences = ref.read(sharedPreferencesProvider);

    await sharedPreferences.setString(Preferences.token, result.token);

    state = result.token;

    return result;
  }

  // mutation
  Future<void> logout() async {
    // if error occurred, the blew code will not be executed
    await Future.delayed(const Duration(seconds: 2));

    final sharedPreferences = ref.read(sharedPreferencesProvider);

    await sharedPreferences.remove(Preferences.token);

    state = null;
  }
}
