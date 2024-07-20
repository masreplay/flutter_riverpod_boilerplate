// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodoUpdate {

 String get title => throw _privateConstructorUsedError; bool get completed => throw _privateConstructorUsedError;







@JsonKey(ignore: true)
$TodoUpdateCopyWith<TodoUpdate> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $TodoUpdateCopyWith<$Res>  {
  factory $TodoUpdateCopyWith(TodoUpdate value, $Res Function(TodoUpdate) then) = _$TodoUpdateCopyWithImpl<$Res, TodoUpdate>;
@useResult
$Res call({
 String title, bool completed
});



}

/// @nodoc
class _$TodoUpdateCopyWithImpl<$Res,$Val extends TodoUpdate> implements $TodoUpdateCopyWith<$Res> {
  _$TodoUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? completed = null,}) {
  return _then(_value.copyWith(
title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,completed: null == completed ? _value.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  )as $Val);
}

}


/// @nodoc
abstract class _$$TodoUpdateImplCopyWith<$Res> implements $TodoUpdateCopyWith<$Res> {
  factory _$$TodoUpdateImplCopyWith(_$TodoUpdateImpl value, $Res Function(_$TodoUpdateImpl) then) = __$$TodoUpdateImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String title, bool completed
});



}

/// @nodoc
class __$$TodoUpdateImplCopyWithImpl<$Res> extends _$TodoUpdateCopyWithImpl<$Res, _$TodoUpdateImpl> implements _$$TodoUpdateImplCopyWith<$Res> {
  __$$TodoUpdateImplCopyWithImpl(_$TodoUpdateImpl _value, $Res Function(_$TodoUpdateImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? completed = null,}) {
  return _then(_$TodoUpdateImpl(
title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,completed: null == completed ? _value.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _$TodoUpdateImpl  implements _TodoUpdate {
  const _$TodoUpdateImpl({required this.title, required this.completed});

  

@override final  String title;
@override final  bool completed;

@override
String toString() {
  return 'TodoUpdate(title: $title, completed: $completed)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$TodoUpdateImpl&&(identical(other.title, title) || other.title == title)&&(identical(other.completed, completed) || other.completed == completed));
}


@override
int get hashCode => Object.hash(runtimeType,title,completed);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$TodoUpdateImplCopyWith<_$TodoUpdateImpl> get copyWith => __$$TodoUpdateImplCopyWithImpl<_$TodoUpdateImpl>(this, _$identity);








}


abstract class _TodoUpdate implements TodoUpdate {
  const factory _TodoUpdate({required final  String title, required final  bool completed}) = _$TodoUpdateImpl;
  

  

@override  String get title;@override  bool get completed;
@override @JsonKey(ignore: true)
_$$TodoUpdateImplCopyWith<_$TodoUpdateImpl> get copyWith => throw _privateConstructorUsedError;

}
