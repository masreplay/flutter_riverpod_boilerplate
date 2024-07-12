import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_example/app/features/main/home/todo_detail_screen.dart';
import 'package:flutter_application_example/app/features/main/settings/settings_page.dart';
import 'package:flutter_application_example/app/widgets/status/button_loading.dart';
import 'package:flutter_application_example/app/widgets/status/error_widget.dart';
import 'package:flutter_application_example/app/widgets/status/loading_widget.dart';
import 'package:flutter_application_example/data/api/todo/todo_client.dart';
import 'package:flutter_application_example/data/api/todo/todo_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_hook_mutation/riverpod_hook_mutation.dart';

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
                return TodoListTile(item: item);
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

class TodoListTile extends HookConsumerWidget {
  const TodoListTile({
    super.key,
    required this.item,
  });

  final TodoResponse item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final favoriteMutation = useMutation<bool>(data: item.favorite);
    final favoriteMutation = useMutation<bool>(data: Random().nextBool());

    return ListTile(
      title: Text(item.title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return TodoDetailScreen(id: item.id);
            },
          ),
        );
      },
      leading: item.completed
          ? Icon(
              Icons.check,
              color: Theme.of(context).colorScheme.primary,
            )
          : Icon(
              Icons.close,
              color: Theme.of(context).colorScheme.error,
            ),
      trailing: favoriteMutation.maybeWhen(
        loading: () => const SizedBox.square(
          dimension: 48.0,
          child: ButtonLoading(),
        ),
        orElse: () {
          final isFavorite = favoriteMutation.data ?? false;
          return IconButton(
            onPressed: () {
              favoriteMutation.future(
                Future.delayed(const Duration(seconds: 1), () => !isFavorite),
                data: (data) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        data ? 'Added to favorite' : 'Removed from favorite',
                      ),
                    ),
                  );
                },
                error: (error, stackTrace) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error: $error'),
                    ),
                  );
                },
              );
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
          );
        },
      ),
    );
  }
}
