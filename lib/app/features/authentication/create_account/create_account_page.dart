import 'package:flutter/material.dart';
import 'package:flutter_application_example/app/widgets/fields/email_form_field.dart';
import 'package:flutter_application_example/app/widgets/gap.dart';
import 'package:flutter_application_example/app/features/authentication/login/login_page.dart';
import 'package:flutter_application_example/app/widgets/fields/password_form_field.dart';

/// TODO(mohammed.falih): use hook instead (شغل السيارة)
class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  late final TextEditingController confirmPasswordController =
      TextEditingController();

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
                    "Sign up",
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(12),
                  Text(
                    "Create an account to get started",
                    style: textTheme.titleMedium,
                  ),
                  const Gap(24),
                  _CreateAccountEmailFormField(
                    controller: emailController,
                  ),
                  const Gap(12),
                  _CreateAccountPasswordFormField(
                    controller: passwordController,
                  ),
                  const Gap(12),
                  ValueListenableBuilder(
                    valueListenable: passwordController,
                    builder: (context, value, child) {
                      return _CreateAccountConfirmPasswordFormField(
                        controller: confirmPasswordController,
                        otherPassword: value.text,
                      );
                    },
                  ),
                  const _CreateAccountForgotPasswordButton(),
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
                  const _CreateSignInAccountButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CreateSignInAccountButton extends StatelessWidget {
  const _CreateSignInAccountButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account?'),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          },
          child: const Text('Sign in'),
        ),
      ],
    );
  }
}

class _CreateAccountForgotPasswordButton extends StatelessWidget {
  const _CreateAccountForgotPasswordButton();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
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

class _CreateAccountEmailFormField extends StatelessWidget {
  const _CreateAccountEmailFormField({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return EmailFormField(controller: controller);
  }
}

class _CreateAccountPasswordFormField extends StatelessWidget {
  const _CreateAccountPasswordFormField({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PasswordFormField(
      controller: controller,
      label: 'Password',
    );
  }
}

class _CreateAccountConfirmPasswordFormField extends StatelessWidget {
  const _CreateAccountConfirmPasswordFormField({
    required this.controller,
    required this.otherPassword,
  });

  final TextEditingController controller;
  final String otherPassword;

  @override
  Widget build(BuildContext context) {
    return PasswordFormField(
      controller: controller,
      otherPassword: otherPassword,
      label: 'Confirm password',
    );
  }
}
