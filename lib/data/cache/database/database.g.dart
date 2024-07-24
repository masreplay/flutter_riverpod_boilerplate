// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TodoSchemaTable extends TodoSchema
    with TableInfo<$TodoSchemaTable, TodoSchemaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoSchemaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _serverIdMeta =
      const VerificationMeta('serverId');
  @override
  late final GeneratedColumn<int> serverId = GeneratedColumn<int>(
      'server_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _completedMeta =
      const VerificationMeta('completed');
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
      'completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, serverId, title, completed, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todos';
  @override
  VerificationContext validateIntegrity(Insertable<TodoSchemaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('server_id')) {
      context.handle(_serverIdMeta,
          serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta));
    } else if (isInserting) {
      context.missing(_serverIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoSchemaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoSchemaData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      serverId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}server_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      completed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completed'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TodoSchemaTable createAlias(String alias) {
    return $TodoSchemaTable(attachedDatabase, alias);
  }
}

class TodoSchemaData extends DataClass implements Insertable<TodoSchemaData> {
  /// The primary key column for the 'todos' table.
  final int id;

  /// The server ID column for the 'todos' table.
  final int serverId;

  /// The title column for the 'todos' table.
  final String title;

  /// The completed column for the 'todos' table.
  final bool completed;

  /// The createdAt column for the 'todos' table.
  final DateTime createdAt;
  const TodoSchemaData(
      {required this.id,
      required this.serverId,
      required this.title,
      required this.completed,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['server_id'] = Variable<int>(serverId);
    map['title'] = Variable<String>(title);
    map['completed'] = Variable<bool>(completed);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TodoSchemaCompanion toCompanion(bool nullToAbsent) {
    return TodoSchemaCompanion(
      id: Value(id),
      serverId: Value(serverId),
      title: Value(title),
      completed: Value(completed),
      createdAt: Value(createdAt),
    );
  }

  factory TodoSchemaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoSchemaData(
      id: serializer.fromJson<int>(json['id']),
      serverId: serializer.fromJson<int>(json['serverId']),
      title: serializer.fromJson<String>(json['title']),
      completed: serializer.fromJson<bool>(json['completed']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'serverId': serializer.toJson<int>(serverId),
      'title': serializer.toJson<String>(title),
      'completed': serializer.toJson<bool>(completed),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TodoSchemaData copyWith(
          {int? id,
          int? serverId,
          String? title,
          bool? completed,
          DateTime? createdAt}) =>
      TodoSchemaData(
        id: id ?? this.id,
        serverId: serverId ?? this.serverId,
        title: title ?? this.title,
        completed: completed ?? this.completed,
        createdAt: createdAt ?? this.createdAt,
      );
  TodoSchemaData copyWithCompanion(TodoSchemaCompanion data) {
    return TodoSchemaData(
      id: data.id.present ? data.id.value : this.id,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      title: data.title.present ? data.title.value : this.title,
      completed: data.completed.present ? data.completed.value : this.completed,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodoSchemaData(')
          ..write('id: $id, ')
          ..write('serverId: $serverId, ')
          ..write('title: $title, ')
          ..write('completed: $completed, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, serverId, title, completed, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoSchemaData &&
          other.id == this.id &&
          other.serverId == this.serverId &&
          other.title == this.title &&
          other.completed == this.completed &&
          other.createdAt == this.createdAt);
}

class TodoSchemaCompanion extends UpdateCompanion<TodoSchemaData> {
  final Value<int> id;
  final Value<int> serverId;
  final Value<String> title;
  final Value<bool> completed;
  final Value<DateTime> createdAt;
  const TodoSchemaCompanion({
    this.id = const Value.absent(),
    this.serverId = const Value.absent(),
    this.title = const Value.absent(),
    this.completed = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TodoSchemaCompanion.insert({
    this.id = const Value.absent(),
    required int serverId,
    required String title,
    this.completed = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : serverId = Value(serverId),
        title = Value(title);
  static Insertable<TodoSchemaData> custom({
    Expression<int>? id,
    Expression<int>? serverId,
    Expression<String>? title,
    Expression<bool>? completed,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serverId != null) 'server_id': serverId,
      if (title != null) 'title': title,
      if (completed != null) 'completed': completed,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TodoSchemaCompanion copyWith(
      {Value<int>? id,
      Value<int>? serverId,
      Value<String>? title,
      Value<bool>? completed,
      Value<DateTime>? createdAt}) {
    return TodoSchemaCompanion(
      id: id ?? this.id,
      serverId: serverId ?? this.serverId,
      title: title ?? this.title,
      completed: completed ?? this.completed,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<int>(serverId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoSchemaCompanion(')
          ..write('id: $id, ')
          ..write('serverId: $serverId, ')
          ..write('title: $title, ')
          ..write('completed: $completed, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TodoSchemaTable todoSchema = $TodoSchemaTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todoSchema];
}

typedef $$TodoSchemaTableCreateCompanionBuilder = TodoSchemaCompanion Function({
  Value<int> id,
  required int serverId,
  required String title,
  Value<bool> completed,
  Value<DateTime> createdAt,
});
typedef $$TodoSchemaTableUpdateCompanionBuilder = TodoSchemaCompanion Function({
  Value<int> id,
  Value<int> serverId,
  Value<String> title,
  Value<bool> completed,
  Value<DateTime> createdAt,
});

class $$TodoSchemaTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TodoSchemaTable,
    TodoSchemaData,
    $$TodoSchemaTableFilterComposer,
    $$TodoSchemaTableOrderingComposer,
    $$TodoSchemaTableCreateCompanionBuilder,
    $$TodoSchemaTableUpdateCompanionBuilder> {
  $$TodoSchemaTableTableManager(_$AppDatabase db, $TodoSchemaTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TodoSchemaTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TodoSchemaTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> serverId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<bool> completed = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TodoSchemaCompanion(
            id: id,
            serverId: serverId,
            title: title,
            completed: completed,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int serverId,
            required String title,
            Value<bool> completed = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TodoSchemaCompanion.insert(
            id: id,
            serverId: serverId,
            title: title,
            completed: completed,
            createdAt: createdAt,
          ),
        ));
}

class $$TodoSchemaTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TodoSchemaTable> {
  $$TodoSchemaTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get serverId => $state.composableBuilder(
      column: $state.table.serverId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get completed => $state.composableBuilder(
      column: $state.table.completed,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TodoSchemaTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TodoSchemaTable> {
  $$TodoSchemaTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get serverId => $state.composableBuilder(
      column: $state.table.serverId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get completed => $state.composableBuilder(
      column: $state.table.completed,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TodoSchemaTableTableManager get todoSchema =>
      $$TodoSchemaTableTableManager(_db, _db.todoSchema);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'714990a2e6fd2d3d79f7eec09f37630f4a590035';

/// See also [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = Provider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppDatabaseRef = ProviderRef<AppDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
