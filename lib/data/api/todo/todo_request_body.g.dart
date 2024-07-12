// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoRequestBodyImpl _$$TodoRequestBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$TodoRequestBodyImpl(
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$$TodoRequestBodyImplToJson(
        _$TodoRequestBodyImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'completed': instance.completed,
    };
