import 'package:flutter_application_example/app/features/main/data/data_source/todo_local_data_source.dart';
import 'package:flutter_application_example/app/features/main/data/data_source/todo_remote_data_source.dart';
import 'package:flutter_application_example/app/features/main/data/entity/message_entity.dart';
import 'package:flutter_application_example/app/features/main/data/entity/todo_entity.dart';
import 'package:flutter_application_example/data/api/todo/todo_update.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_repository.g.dart';

@riverpod
TodoRepository todoRepository(TodoRepositoryRef ref) {
  final todoRDS = ref.read(todoRDSProvider);
  final todoLDS = ref.read(todoLDSProvider);
  return TodoRepository(todoRDS, todoLDS);
}

class TodoRepository {
  final TodoRDS _remote;
  final TodoLDS _local;

  TodoRepository(this._remote, this._local);

  Future<List<TodoEntity>> get() async {
    try {
      final todos = await _remote.getTodos();
      await _local.insertTodos(todos);
      return todos.map(TodoEntity.fromResponse).toList();
    } catch (e) {
      final todos = await _local.getTodos();
      if (todos.isNotEmpty) {
        return todos.map(TodoEntity.fromSchemaData).toList();
      }
      throw Exception(e.toString());
    }
  }

  Future<TodoEntity> getDetail(int id) async {
    final response = await _remote.getTodo(id);
    return TodoEntity.fromResponse(response);
  }

  Future<MessageEntity> delete(int id) {
    throw UnimplementedError();
  }

  Future<bool> toggle(int id) {
    throw UnimplementedError();
  }

  Future<TodoEntity> update(
    int id,
    TodoUpdate todo,
  ) {
    throw UnimplementedError();
  }
}
