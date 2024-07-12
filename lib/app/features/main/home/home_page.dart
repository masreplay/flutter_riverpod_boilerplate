import 'package:flutter/material.dart';
import 'package:flutter_application_example/app/features/main/settings/settings_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page.g.dart';

class HomeResponse {
  final String message;
  final String username;
  final List<String> items;

  const HomeResponse(
    this.message,
    this.username,
    this.items,
  );
}

@riverpod
Future<HomeResponse> home(HomeRef ref) {
  return Future.delayed(
    const Duration(seconds: 2),
    () => const HomeResponse(
      'Welcome',
      'username',
      ['item1', 'item2', 'item3'],
    ),
  );
}

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SettingsPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(homeProvider.future),
        child: state.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data.items[index]),
                );
              },
            );
          },
          error: (Object error, StackTrace stackTrace) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: $error'),
                  ElevatedButton(
                    onPressed: () {
                      ref.invalidate(homeProvider);
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
