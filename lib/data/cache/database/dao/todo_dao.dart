import 'package:drift/drift.dart';
import 'package:flutter_application_example/data/api/todo/todo_response.dart';
import 'package:flutter_application_example/data/cache/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_dao.g.dart';

@riverpod
TodoDAO todoDAO(TodoDAORef ref) {
  return TodoDAO(ref.read(appDatabaseProvider));
}

class TodoDAO {
  final AppDatabase _db;

  const TodoDAO(this._db);

  Future<List<TodoSchemaData>> getTodos() async {
    return (_db.select(_db.todoSchema)
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt)]))
        .get();
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

  Future<void> insertTodo(TodoSchemaCompanion todo) async {
    await _db.into(_db.todoSchema).insert(todo);
  }
}
