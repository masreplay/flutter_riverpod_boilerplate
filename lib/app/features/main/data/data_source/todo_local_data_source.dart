import 'package:flutter_application_example/data/api/todo/todo_response.dart';
import 'package:flutter_application_example/data/cache/database/dao/todo_dao.dart';
import 'package:flutter_application_example/data/cache/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_local_data_source.g.dart';

/// A data source for managing local storage operations related to todos.
@riverpod
TodoLDS todoLDS(TodoLDSRef ref) {
  final todoDAO = ref.read(todoDAOProvider);
  return TodoDriftLDS(todoDAO);
}

/// An abstract class representing the contract for local data source operations related to todos.
abstract class TodoLDS {
  /// Retrieves a list of todos from the local storage.
  Future<List<TodoSchemaData>> getTodos();

  /// Inserts a list of todos into the local storage.
  Future<void> insertTodos(List<TodoResponse> todos);
}

/// A concrete implementation of the [TodoLDS] contract using the [TodoDAO] for data access.
class TodoDriftLDS implements TodoLDS {
  final TodoDAO _dao;

  TodoDriftLDS(this._dao);

  @override
  Future<List<TodoSchemaData>> getTodos() {
    return _dao.getTodos();
  }

  @override
  Future<void> insertTodos(List<TodoResponse> todos) {
    return _dao.insertTodos(todos);
  }
}
