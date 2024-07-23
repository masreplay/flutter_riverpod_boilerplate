import 'package:drift/drift.dart';
import 'package:flutter_application_example/data/cache/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_dao.g.dart';

@riverpod
TodoDao todoDao(TodoDaoRef ref) {
  final appDatabase = ref.read(appDatabaseProvider);
  return TodoDao(appDatabase);
}

class TodoDao {
  final AppDatabase _db;

  const TodoDao(this._db);

  Future<List<TodoSchemaData>> getTodos() async {
    return (_db.select(_db.todoSchema)
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt)]))
        .get();
  }

  Future<TodoSchemaData> getTodo(int id) async {
    return (_db.select(_db.todoSchema)..where((t) => t.id.equals(id)))
        .getSingle();
  }

  Future<void> insertTodos(List<TodoSchemaCompanion> list) {
    return _db.batch((batch) => batch.insertAllOnConflictUpdate(_db.todoSchema, list));
  }
}
