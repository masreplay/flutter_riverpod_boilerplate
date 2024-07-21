import 'package:flutter/material.dart';
import 'package:flutter_application_example/app/features/main/data/entity/todo_entity.dart';
import 'package:flutter_application_example/app/features/main/data/repository/todo_repository.dart';
import 'package:flutter_application_example/app/features/main/presentation/home/update_todo_screen.dart';
import 'package:flutter_application_example/app/widgets/status/loading_widget.dart';
import 'package:flutter_application_example/data/api/todo/todo_update.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_hook_mutation/riverpod_hook_mutation.dart';

part 'todo_detail_screen.g.dart';

@riverpod
class Todo extends _$Todo {
  @override
  Future<TodoEntity> build(int id) {
    return ref.read(todoRepositoryProvider).getDetails(id);
  }

  Future<bool> toggleStatus() async {
    // final response = await ref.read(todoClientProvider).toggle(id);
    // ref.invalidateSelf();
    // return response;

    // fake
    return Future.delayed(const Duration(seconds: 1), () {
      return state.maybeWhen(
        data: (data) {
          state = AsyncData(data.copyWith(completed: !data.completed));
          return !data.completed;
        },
        orElse: () => false,
      );
    });
  }

  Future<TodoEntity> updateTodo(TodoUpdate todo) async {
    // fake
    return Future.delayed(const Duration(seconds: 1), () {
      return state.maybeWhen(
        data: (data) {
          final newData =
              data.copyWith(title: todo.title, completed: todo.completed);
          state = AsyncData(newData);
          return newData;
        },
        orElse: () {
          throw Exception('Error');
        },
      );
    });
  }
}

class TodoDetailScreen extends HookConsumerWidget {
  const TodoDetailScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = todoProvider(id);
    final state = ref.watch(provider);

    final notifier = ref.watch(todoProvider(id).notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Detail'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return UpdateTodoScreen(id: id);
                  },
                ),
              );
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: state.when(
        data: (data) {
          final completed = useMutation<bool>(data: data.completed);
          return Column(
            children: [
              Text(data.title),
              Text(data.completed.toString()),
              FilledButton(
                onPressed: () {
                  completed(notifier.toggleStatus());
                },
                child: const Text('Toggle Status'),
              ),
            ],
          );
        },
        loading: () {
          return const AppLoadingWidget();
        },
        error: (error, stackTrace) {
          return const Center(
            child: Text('Error'),
          );
        },
      ),
    );
  }
}
