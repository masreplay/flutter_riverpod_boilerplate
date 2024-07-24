import 'dart:developer';

import 'package:flutter_application_example/app/features/main/data/data_source/todo_local_data_source.dart';
import 'package:flutter_application_example/app/features/main/data/data_source/todo_remote_data_source.dart';
import 'package:flutter_application_example/app/features/main/data/entity/message_entity.dart';
import 'package:flutter_application_example/app/features/main/data/entity/todo_entity.dart';
import 'package:flutter_application_example/data/api/todo/todo_update.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_repository.g.dart';

@riverpod
TodoRepository todoRepository(TodoRepositoryRef ref) {
  final todoRds = ref.read(todoRdsProvider);
  final todoLds = ref.read(todoLdsProvider);
  return TodoRepository(todoRds, todoLds);
}

/// A repository class that handles the retrieval and manipulation of Todo data.
class TodoRepository {
  final TodoRds _remoteDataSource;
  final TodoLds _localDataSource;

  const TodoRepository(this._remoteDataSource, this._localDataSource);

  /// Retrieves a list of TodoEntity objects.
  ///
  /// If the remote data source is available, it retrieves the data from there.
  /// If an error occurs, it falls back to retrieving the data from the local data source.
  Future<List<TodoEntity>> get() async {
    try {
      final todos = await _remoteDataSource.getTodos();
      final list = todos.map(TodoEntity.fromResponse).toList();
      await _localDataSource
          .insertTodos(list.map((e) => e.toSchemaData()).toList());
      return list;
    } catch (e) {
      final todos = await _localDataSource.getTodos();
      return todos.map(TodoEntity.fromSchemaData).toList();
    }
  }

  /// Retrieves a TodoEntity object with the specified ID.
  ///
  /// If the remote data source is available, it retrieves the data from there.
  /// If an error occurs, it falls back to retrieving the data from the local data source.
  Future<TodoEntity> getDetail(int id) async {
    try {
      final response = await _remoteDataSource.getTodo(id);
      return TodoEntity.fromResponse(response);
    } catch (e) {
      log(e.toString());
      final todo = await _localDataSource.getTodo(id);
      return TodoEntity.fromSchemaData(todo);
      
    }
  }

  /// Deletes a TodoEntity object with the specified ID.
  Future<MessageEntity> delete(int id) {
    throw UnimplementedError();
  }

  /// Toggles the completed status of a TodoEntity object with the specified ID.
  Future<bool> toggle(int id) {
    throw UnimplementedError();
  }

  /// Updates a TodoEntity object with the specified ID.
  Future<TodoEntity> update(
    int id,
    TodoUpdate todo,
  ) {
    throw UnimplementedError();
  }
}
