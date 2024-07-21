import 'package:flutter_application_example/data/api/todo/todo_client.dart';
import 'package:flutter_application_example/app/features/main/data/entities/todo_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_repository.g.dart';

@riverpod
TodoRepository todoRepository(TodoRepositoryRef ref) {
  return TodoRepository(ref.read(todoClientProvider));
}

class TodoRepository {
  final TodoClient _client;

  TodoRepository(this._client);

  Future<List<TodoEntity>> getTodos() async {
    final response = await _client.getTodos();
    return response.map(TodoEntity.fromResponse).toList();
  }

  Future<TodoEntity> getTodo(int id) async {
    final response = await _client.getTodo(id);
    return TodoEntity.fromResponse(response);
  }

  Future<void> delete(int id) {
    throw UnimplementedError();
  }
}
