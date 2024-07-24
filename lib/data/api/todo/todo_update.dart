import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_update.freezed.dart';

@freezed
class TodoUpdate with _$TodoUpdate {
  const factory TodoUpdate({
    required String title,
    required bool completed,
  }) = _TodoUpdate;
}