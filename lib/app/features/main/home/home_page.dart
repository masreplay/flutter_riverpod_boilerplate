import 'package:flutter/material.dart';
import 'package:flutter_application_example/app/features/main/settings/settings_page.dart';
import 'package:flutter_application_example/app/widgets/status/error_widget.dart';
import 'package:flutter_application_example/app/widgets/status/loading_widget.dart';
import 'package:flutter_application_example/data/api/todo/todo_client.dart';
import 'package:flutter_application_example/data/api/todo/todo_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page.g.dart';

@riverpod
Future<List<TodoResponse>> home(HomeRef ref) {
  return ref.read(todoClientProvider).getTodos();
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
      body: state.when(
        data: (data) {
          return RefreshIndicator(
            onRefresh: () => ref.refresh(homeProvider.future),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ListTile(
                  title: Text(item.title),
                  leading: item.completed
                      ? const Icon(Icons.check)
                      : const Icon(Icons.close),
                );
              },
            ),
          );
        },
        error: (error, stackTrace) {
          return const AppErrorWidget();
        },
        loading: () {
          // replace shimmer effect
          return const AppLoadingWidget();
        },
      ),
    );
  }
}
