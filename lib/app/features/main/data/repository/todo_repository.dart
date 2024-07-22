import 'package:flutter_application_example/app/features/main/data/entity/message_entity.dart';
import 'package:flutter_application_example/data/api/todo/todo_client.dart';
import 'package:flutter_application_example/app/features/main/data/entity/todo_entity.dart';
import 'package:flutter_application_example/data/api/todo/todo_update.dart';
import 'package:flutter_application_example/data/cache/database/dao/todo_dao.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_repository.g.dart';

@riverpod
TodoRepository todoRepository(TodoRepositoryRef ref) {
  return TodoRepository(
      ref.read(todoClientProvider), ref.read(todoDAOProvider));
}

class TodoRepository {
  final TodoClient _client;
  final TodoDAO _dao;

  TodoRepository(this._client, this._dao);

  Future<List<TodoEntity>> get() async {
    try {
      final todos = await _client.getTodos();
      await _dao.insertTodos(todos);
      return todos.map(TodoEntity.fromResponse).toList();
    } catch (e) {
      final todos = await _dao.getTodos();
      if (todos.isNotEmpty) {
        return todos.map(TodoEntity.fromSchemaData).toList();
      }
      rethrow;
    }
  }

  Future<TodoEntity> getDetail(int id) async {
    final response = await _client.getTodo(id);
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
