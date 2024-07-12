// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoRequestBody _$TodoRequestBodyFromJson(Map<String, dynamic> json) {
  return _TodoRequestBody.fromJson(json);
}

/// @nodoc
mixin _$TodoRequestBody {
  String get title => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoRequestBodyCopyWith<TodoRequestBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoRequestBodyCopyWith<$Res> {
  factory $TodoRequestBodyCopyWith(
          TodoRequestBody value, $Res Function(TodoRequestBody) then) =
      _$TodoRequestBodyCopyWithImpl<$Res, TodoRequestBody>;
  @useResult
  $Res call({String title, bool completed});
}

/// @nodoc
class _$TodoRequestBodyCopyWithImpl<$Res, $Val extends TodoRequestBody>
    implements $TodoRequestBodyCopyWith<$Res> {
  _$TodoRequestBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? completed = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoRequestBodyImplCopyWith<$Res>
    implements $TodoRequestBodyCopyWith<$Res> {
  factory _$$TodoRequestBodyImplCopyWith(_$TodoRequestBodyImpl value,
          $Res Function(_$TodoRequestBodyImpl) then) =
      __$$TodoRequestBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, bool completed});
}

/// @nodoc
class __$$TodoRequestBodyImplCopyWithImpl<$Res>
    extends _$TodoRequestBodyCopyWithImpl<$Res, _$TodoRequestBodyImpl>
    implements _$$TodoRequestBodyImplCopyWith<$Res> {
  __$$TodoRequestBodyImplCopyWithImpl(
      _$TodoRequestBodyImpl _value, $Res Function(_$TodoRequestBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? completed = null,
  }) {
    return _then(_$TodoRequestBodyImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoRequestBodyImpl implements _TodoRequestBody {
  _$TodoRequestBodyImpl({required this.title, required this.completed});

  factory _$TodoRequestBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoRequestBodyImplFromJson(json);

  @override
  final String title;
  @override
  final bool completed;

  @override
  String toString() {
    return 'TodoRequestBody(title: $title, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoRequestBodyImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, completed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoRequestBodyImplCopyWith<_$TodoRequestBodyImpl> get copyWith =>
      __$$TodoRequestBodyImplCopyWithImpl<_$TodoRequestBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoRequestBodyImplToJson(
      this,
    );
  }
}

abstract class _TodoRequestBody implements TodoRequestBody {
  factory _TodoRequestBody(
      {required final String title,
      required final bool completed}) = _$TodoRequestBodyImpl;

  factory _TodoRequestBody.fromJson(Map<String, dynamic> json) =
      _$TodoRequestBodyImpl.fromJson;

  @override
  String get title;
  @override
  bool get completed;
  @override
  @JsonKey(ignore: true)
  _$$TodoRequestBodyImplCopyWith<_$TodoRequestBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
