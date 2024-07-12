import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_example/gap.dart';

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
                    "Login",
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
                  LoginEmailFormField(
                    controller: emailController,
                  ),
                  const Gap(12),
                  LoginPasswordFormField(
                    controller: passwordController,
                  ),
                  const LoginForgotPasswordButton(),
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
                  const LoginCreateAccountButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginCreateAccountButton extends StatelessWidget {
  const LoginCreateAccountButton({
    super.key,
  });

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
          onPressed: () {},
          child: const Text('Register'),
        ),
      ],
    );
  }
}

class LoginForgotPasswordButton extends StatelessWidget {
  const LoginForgotPasswordButton({
    super.key,
  });

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

class LoginEmailFormField extends StatelessWidget {
  const LoginEmailFormField({
    super.key,
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

class LoginPasswordFormField extends StatelessWidget {
  const LoginPasswordFormField({
    super.key,
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
