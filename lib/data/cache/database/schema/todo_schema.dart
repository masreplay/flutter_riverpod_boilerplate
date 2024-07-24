import 'package:drift/drift.dart';

/// Represents the schema for the 'todos' table in the database.
class TodoSchema extends Table {
  /// The primary key column for the 'todos' table.
  IntColumn get id => integer().autoIncrement()();

  /// The server ID column for the 'todos' table.
  IntColumn get serverId => integer().unique()();

  /// The title column for the 'todos' table.
  TextColumn get title => text()();

  /// The completed column for the 'todos' table.
  BoolColumn get completed => boolean().withDefault(const Constant(false))();

  /// The createdAt column for the 'todos' table.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  
  /// The name of the table in the database.
  @override
  String get tableName => 'todos';
}
