import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_example/gap.dart';
import 'package:flutter_application_example/l10n/l10n.dart';
import 'package:flutter_application_example/use_form_key.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod_hook_mutation/riverpod_hook_mutation.dart';

import 'create_account_page.dart';

class LoginResponse {
  final String message;
  final String token;

  const LoginResponse(
    this.message,
    this.token,
  );
}

Future<LoginResponse> login(String email, String password) {
  if (Random().nextBool()) {
    return Future.delayed(
      const Duration(seconds: 2),
      () => const LoginResponse(
        'Login successful',
        'token',
      ),
    );
  } else {
    return Future.delayed(
      const Duration(seconds: 2),
      () => throw Exception('Login failed'),
    );
  }
}

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;

    final formKey = useFormKey();
    final email = useTextEditingController(text: "test@gmail.com");
    final password = useTextEditingController(text: "test@gmail.com");

    final loginMutation = useMutation<LoginResponse>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Show in dev mode only
                  if (kDebugMode)
                    loginMutation.when(
                      idle: () => const Text('Idle'),
                      data: (data) => Text(data.message),
                      error: (error, stackTrace) => Text(error.toString()),
                      loading: () => const ButtonLoading(),
                    ),
                  Text(
                    l10n.loginPageTitle,
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(12),
                  Text(
                    "Welcome back, please login to your account",
                    style: textTheme.titleMedium,
                  ),
                  const Gap(24),
                  _LoginEmailFormField(
                    controller: email,
                  ),
                  const Gap(12),
                  _LoginPasswordFormField(
                    controller: password,
                  ),
                  const _LoginForgotPasswordButton(),
                  FilledButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        loginMutation.future(
                          login(email.text, password.text),
                          data: (data) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(data.message),
                              ),
                            );

                            
                          },
                          error: (error, stackTrace) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(error.toString()),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: loginMutation.isLoading
                        ? const ButtonLoading()
                        : const Text('Login'),
                  ),
                  const _LoginCreateAccountButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonLoading extends StatelessWidget {
  const ButtonLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: 18.0,
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}

class _LoginCreateAccountButton extends StatelessWidget {
  const _LoginCreateAccountButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an account? '),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CreateAccountPage(),
              ),
            );
          },
          child: const Text('Register'),
        ),
      ],
    );
  }
}

class _LoginForgotPasswordButton extends StatelessWidget {
  const _LoginForgotPasswordButton();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Navigate to the registration page
        },
        child: const Text(
          'Forgot password?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _LoginEmailFormField extends StatelessWidget {
  const _LoginEmailFormField({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        // regex for email validation
        final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!emailRegex.hasMatch(value)) {
          return 'Please enter a valid email';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email_outlined),
      ),
    );
  }
}

class _LoginPasswordFormField extends StatelessWidget {
  const _LoginPasswordFormField({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock_outline),
      ),
    );
  }
}
