import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_example/app/features/main/data/entity/message_entity.dart';
import 'package:flutter_application_example/app/features/main/pages/home/todo_detail_screen.dart';
import 'package:flutter_application_example/app/features/main/pages/settings/settings_page.dart';
import 'package:flutter_application_example/app/widgets/status/button_loading.dart';
import 'package:flutter_application_example/app/widgets/status/error_widget.dart';
import 'package:flutter_application_example/app/widgets/status/loading_widget.dart';
import 'package:flutter_application_example/app/features/main/data/entity/todo_entity.dart';
import 'package:flutter_application_example/app/features/main/data/repository/todo_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_hook_extensions/riverpod_hook_extensions.dart';
import 'package:riverpod_hook_mutation/riverpod_hook_mutation.dart';

part 'home_page.g.dart';

@riverpod
class Home extends _$Home {
  TodoRepository get _repository => ref.read(todoRepositoryProvider);

  @override
  Future<List<TodoEntity>> build() {
    return _repository.get();
  }

  Future<MessageEntity> delete(int id) async {
    final response = await _repository.delete(id);
    await refreshSelf();
    return response;
  }
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

  final TodoEntity item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final favoriteMutation = useMutation<bool>(data: item.favorite);
    final favoriteMutation = useMutation<bool>(data: Random().nextBool());
    final deleteMutation = useMutation<MessageEntity>();
    final notifier = ref.read(homeProvider.notifier);

    return Dismissible(
      key: ValueKey(item.id),
      confirmDismiss: (direction) async {
        return deleteMutation.future<bool>(
          notifier.delete(item.id),
          data: (data) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(data.message),
              ),
            );
            return true;
          },
          error: (error, stackTrace) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: $error'),
              ),
            );
            return false;
          },
        );
      },
      child: ListTile(
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
      ),
    );
  }
}
