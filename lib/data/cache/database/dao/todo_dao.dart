import 'package:drift/drift.dart';
import 'package:flutter_application_example/data/api/todo/todo_response.dart';
import 'package:flutter_application_example/data/cache/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_dao.g.dart';

@riverpod
TodoDAO todoDAO(TodoDAORef ref) {
  final appDatabase = ref.read(appDatabaseProvider);
  return TodoDAO(appDatabase);
}

class TodoDAO {
  final AppDatabase _db;

  const TodoDAO(this._db);

  Future<List<TodoSchemaData>> getTodos() async {
    return (_db.select(_db.todoSchema)
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt)]))
        .get();
  }

  Future<TodoSchemaData> getTodoById(int id) async {
    return (_db.select(_db.todoSchema)..where((t) => t.id.equals(id)))
        .getSingle();
  }

  Future<void> insertTodos(List<TodoResponse> todos) async {
    await _db.batch(
      (batch) => batch.insertAll(
        _db.todoSchema,
        todos.map(
          (todo) {
            return TodoSchemaCompanion.insert(
              title: todo.title,
              completed: Value(todo.completed),
            );
          },
        ).toList(),
      ),
    );
  }
}
