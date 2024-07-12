import 'package:flutter/material.dart';
import 'package:flutter_application_example/app/features/authentication/authentication_provider.dart';
import 'package:flutter_application_example/app/widgets/status/button_loading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_hook_mutation/riverpod_hook_mutation.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logoutMutation = useMutation();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            logoutMutation.future(
              ref.read(authenticationProvider.notifier).logout(),
              data: (data) {
                Navigator.of(context).pop();
              },
            );
          },
          child: logoutMutation.isLoading
              ? const ButtonLoading()
              : const Text('Logout'),
        ),
      ),
    );
  }
}
