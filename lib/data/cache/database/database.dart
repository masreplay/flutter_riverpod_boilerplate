import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_application_example/data/cache/database/schema/todo_schema.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database.g.dart';

@riverpod
AppDatabase appDatabase(AppDatabaseRef ref) {
  return AppDatabase();
}

/// Represents the application database.
/// This class extends the generated `_$AppDatabase` class from Drift.
/// It defines the schema version and the method to open a database connection.
@DriftDatabase(tables: [TodoSchema])
class AppDatabase extends _$AppDatabase {
  /// Creates an instance of the [AppDatabase] class.
  /// It calls the constructor of the superclass [_$AppDatabase] and passes the opened database connection.
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  /// Opens a connection to the database.
  /// It uses the `driftDatabase` function from `package:drift_flutter` to store the database in the application documents directory.
  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'flutter_riverpod_boilerplate');
  }
}