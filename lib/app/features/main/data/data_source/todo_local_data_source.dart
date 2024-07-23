import 'package:flutter_application_example/data/cache/database/dao/todo_dao.dart';
import 'package:flutter_application_example/data/cache/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_local_data_source.g.dart';

/// A data source for managing local storage operations related to todos.
@riverpod
TodoLds todoLds(TodoLdsRef ref) {
  final todoDao = ref.read(todoDaoProvider);
  return TodoDriftLds(todoDao);
}

/// An abstract class representing the contract for local data source operations related to todos.
abstract class TodoLds {
  /// Retrieves a list of todos from the local storage.
  Future<List<TodoSchemaData>> getTodos();

  /// Inserts a list of todos into the local storage.
  Future<void> insertTodos(List<TodoSchemaCompanion> list);
}

/// A concrete implementation of the [TodoLds] contract using the [TodoDao] for data access.
class TodoDriftLds implements TodoLds {
  final TodoDao _dao;

  TodoDriftLds(this._dao);

  @override
  Future<List<TodoSchemaData>> getTodos() {
    return _dao.getTodos();
  }

  @override
  Future<void> insertTodos(List<TodoSchemaCompanion> list) {
    return _dao.insertTodos(list);
  }
}
