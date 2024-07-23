import 'package:drift/drift.dart';
import 'package:flutter_application_example/data/cache/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_dao.g.dart';

@riverpod
TodoDao todoDao(TodoDaoRef ref) {
  final appDatabase = ref.read(appDatabaseProvider);
  return TodoDao(appDatabase);
}

/// A data access object (DAO) for managing Todo data in the database.
class TodoDao {
  final AppDatabase _db;

  const TodoDao(this._db);

  /// Retrieves a list of all Todo items from the database.
  ///
  /// The Todo items are ordered by their creation date.
  Future<List<TodoSchemaData>> getTodos() async {
    return (_db.select(_db.todoSchema)
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt)]))
        .get();
  }

  /// Retrieves a single Todo item from the database based on its ID.
  ///
  /// The ID of the Todo item to retrieve.
  Future<TodoSchemaData> getTodo(int id) async {
    return (_db.select(_db.todoSchema)..where((t) => t.id.equals(id)))
        .getSingle();
  }

  /// Inserts multiple Todo items into the database.
  ///
  /// The list of Todo items to insert.
  Future<void> insertTodos(List<TodoSchemaCompanion> list) {
    return _db.batch((batch) => batch.insertAllOnConflictUpdate(_db.todoSchema, list));
  }
}
