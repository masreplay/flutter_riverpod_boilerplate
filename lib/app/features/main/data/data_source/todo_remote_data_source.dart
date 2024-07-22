import 'package:flutter_application_example/data/api/todo/todo_client.dart';
import 'package:flutter_application_example/data/api/todo/todo_request_body.dart';
import 'package:flutter_application_example/data/api/todo/todo_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_remote_data_source.g.dart';

@riverpod
TodoRDS todoRDS(TodoRDSRef ref) {
  final todoClient = ref.read(todoClientProvider);
  return TodoApiRDS(todoClient);
}

abstract class TodoRDS {
  Future<List<TodoResponse>> getTodos();

  Future<TodoResponse> getTodo(
    int id,
  );

  Future<TodoResponse> createTodo(
    String title,
    TodoRequestBody body,
  );
}

class TodoApiRDS implements TodoRDS {
  final TodoClient _todoClient;

  TodoApiRDS(this._todoClient);
  @override
  Future<List<TodoResponse>> getTodos() {
    return _todoClient.getTodos();
  }

  @override
  Future<TodoResponse> getTodo(int id) {
    return _todoClient.getTodo(id);
  }

  @override
  Future<TodoResponse> createTodo(
    String title,
    TodoRequestBody body,
  ) {
    return _todoClient.createTodo(title, body);
  }
}
