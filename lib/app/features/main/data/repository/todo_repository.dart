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
  final todoLDS = ref.read(todoLdsProvider);
  return TodoRepository(todoRDS, todoLDS);
}

class TodoRepository {
  final TodoRDS _remoteDataSource;
  final TodoLds _localDataSource;

  TodoRepository(this._remoteDataSource, this._localDataSource);

  Future<List<TodoEntity>> get() async {
    try {
      final todos = await _remoteDataSource.getTodos();
      final list = todos.map(TodoEntity.fromResponse).toList();
      await _localDataSource.insertTodos(list.map((e) => e.toSchemaData()).toList());
      return list;
    } catch (e) {
      final todos = await _localDataSource.getTodos();
      return todos.map(TodoEntity.fromSchemaData).toList();
    }
  }

  Future<TodoEntity> getDetail(int id) async {
    final response = await _remoteDataSource.getTodo(id);
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
