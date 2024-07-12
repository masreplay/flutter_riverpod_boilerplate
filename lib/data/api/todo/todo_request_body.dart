import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_request_body.freezed.dart';
part 'todo_request_body.g.dart';

@freezed
class TodoRequestBody with _$TodoRequestBody {
  factory TodoRequestBody({
    required String title,
    required bool completed,
  }) = _TodoRequestBody;

  factory TodoRequestBody.fromJson(Map<String, dynamic> json) =>
      _$TodoRequestBodyFromJson(json);
}
