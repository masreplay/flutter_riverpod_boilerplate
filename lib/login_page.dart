import 'package:flutter/material.dart';
import 'package:flutter_application_example/gap.dart';
import 'package:flutter_application_example/l10n/l10n.dart';

import 'create_account_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                    controller: emailController,
                  ),
                  const Gap(12),
                  _LoginPasswordFormField(
                    controller: passwordController,
                  ),
                  const _LoginForgotPasswordButton(),
                  FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final String email = emailController.text;
                        final String password = passwordController.text;
                        print('Email: $email, Password: $password');
                      }
                    },
                    child: const Text('Login'),
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
