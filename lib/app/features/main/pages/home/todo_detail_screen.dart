import 'package:flutter/material.dart';
import 'package:flutter_application_example/app/features/main/data/entity/todo_entity.dart';
import 'package:flutter_application_example/app/features/main/data/repository/todo_repository.dart';
import 'package:flutter_application_example/app/features/main/pages/home/update_todo_screen.dart';
import 'package:flutter_application_example/app/widgets/status/loading_widget.dart';
import 'package:flutter_application_example/data/api/todo/todo_update.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_hook_mutation/riverpod_hook_mutation.dart';

part 'todo_detail_screen.g.dart';

@riverpod
class Todo extends _$Todo {
  TodoRepository get _repository => ref.read(todoRepositoryProvider);
  @override
  Future<TodoEntity> build(int id) {
    return _repository.getDetail(id);
  }

  Future<bool> toggleStatus(int id) async {
    final response = await _repository.toggle(id);
    ref.invalidateSelf();
    await future;
    return response;
  }

  Future<TodoEntity> updateTodo(
    int id,
    TodoUpdate todo,
  ) async {
    final response = await ref.read(todoRepositoryProvider).update(
          id,
          todo,
        );
    ref.invalidateSelf();
    await future;
    return response;
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
                  completed(notifier.toggleStatus(data.id));
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
