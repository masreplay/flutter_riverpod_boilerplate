import 'package:flutter_application_example/app/features/main/data/entity/message_entity.dart';
import 'package:flutter_application_example/data/api/todo/todo_client.dart';
import 'package:flutter_application_example/app/features/main/data/entity/todo_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_repository.g.dart';

@riverpod
TodoRepository todoRepository(TodoRepositoryRef ref) {
  return TodoRepository(ref.read(todoClientProvider));
}

class TodoRepository {
  final TodoClient _client;

  TodoRepository(this._client);

  Future<List<TodoEntity>> get() async {
    final response = await _client.getTodos();
    return response.map(TodoEntity.fromResponse).toList();
  }

  Future<TodoEntity> getDetails(int id) async {
    final response = await _client.getTodo(id);
    return TodoEntity.fromResponse(response);
  }

  Future<MessageEntity> delete(int id) {
    throw UnimplementedError();
  }

  Future<bool> toggle(int id) {
    throw UnimplementedError();
  }
}
