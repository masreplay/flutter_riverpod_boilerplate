import 'package:flutter_application_example/data/api/todo/todo_response.dart';
import 'package:flutter_application_example/data/cache/database/database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';

@freezed
class TodoEntity with _$TodoEntity {
  const TodoEntity._();
  const factory TodoEntity({
    required int id,
    required String title,
    required bool completed,
  }) = _TodoEntity;

  // from TodoResponse to TodoEntity
  factory TodoEntity.fromResponse(TodoResponse response) {
    return TodoEntity(
      id: response.id,
      title: response.title,
      completed: response.completed,
    );
  }

  // from TodoSchemaData to TodoEntity
  factory TodoEntity.fromSchemaData(TodoSchemaData schemaData) {
    return TodoEntity(
      id: schemaData.id,
      title: schemaData.title,
      completed: schemaData.completed,
    );
  }
}
