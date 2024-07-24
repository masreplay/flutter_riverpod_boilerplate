// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodoEntity {

 int get id => throw _privateConstructorUsedError; String get title => throw _privateConstructorUsedError; bool get completed => throw _privateConstructorUsedError;







@JsonKey(ignore: true)
$TodoEntityCopyWith<TodoEntity> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $TodoEntityCopyWith<$Res>  {
  factory $TodoEntityCopyWith(TodoEntity value, $Res Function(TodoEntity) then) = _$TodoEntityCopyWithImpl<$Res, TodoEntity>;
@useResult
$Res call({
 int id, String title, bool completed
});



}

/// @nodoc
class _$TodoEntityCopyWithImpl<$Res,$Val extends TodoEntity> implements $TodoEntityCopyWith<$Res> {
  _$TodoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? completed = null,}) {
  return _then(_value.copyWith(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,completed: null == completed ? _value.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  )as $Val);
}

}


/// @nodoc
abstract class _$$TodoEntityImplCopyWith<$Res> implements $TodoEntityCopyWith<$Res> {
  factory _$$TodoEntityImplCopyWith(_$TodoEntityImpl value, $Res Function(_$TodoEntityImpl) then) = __$$TodoEntityImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 int id, String title, bool completed
});



}

/// @nodoc
class __$$TodoEntityImplCopyWithImpl<$Res> extends _$TodoEntityCopyWithImpl<$Res, _$TodoEntityImpl> implements _$$TodoEntityImplCopyWith<$Res> {
  __$$TodoEntityImplCopyWithImpl(_$TodoEntityImpl _value, $Res Function(_$TodoEntityImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? completed = null,}) {
  return _then(_$TodoEntityImpl(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,completed: null == completed ? _value.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _$TodoEntityImpl extends _TodoEntity  {
  const _$TodoEntityImpl({required this.id, required this.title, required this.completed}): super._();

  

@override final  int id;
@override final  String title;
@override final  bool completed;

@override
String toString() {
  return 'TodoEntity(id: $id, title: $title, completed: $completed)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$TodoEntityImpl&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.completed, completed) || other.completed == completed));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,completed);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$TodoEntityImplCopyWith<_$TodoEntityImpl> get copyWith => __$$TodoEntityImplCopyWithImpl<_$TodoEntityImpl>(this, _$identity);








}


abstract class _TodoEntity extends TodoEntity {
  const factory _TodoEntity({required final  int id, required final  String title, required final  bool completed}) = _$TodoEntityImpl;
  const _TodoEntity._(): super._();

  

@override  int get id;@override  String get title;@override  bool get completed;
@override @JsonKey(ignore: true)
_$$TodoEntityImplCopyWith<_$TodoEntityImpl> get copyWith => throw _privateConstructorUsedError;

}
