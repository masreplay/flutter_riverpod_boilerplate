// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MessageEntity {

 String get message => throw _privateConstructorUsedError;







@JsonKey(ignore: true)
$MessageEntityCopyWith<MessageEntity> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $MessageEntityCopyWith<$Res>  {
  factory $MessageEntityCopyWith(MessageEntity value, $Res Function(MessageEntity) then) = _$MessageEntityCopyWithImpl<$Res, MessageEntity>;
@useResult
$Res call({
 String message
});



}

/// @nodoc
class _$MessageEntityCopyWithImpl<$Res,$Val extends MessageEntity> implements $MessageEntityCopyWith<$Res> {
  _$MessageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_value.copyWith(
message: null == message ? _value.message : message // ignore: cast_nullable_to_non_nullable
as String,
  )as $Val);
}

}


/// @nodoc
abstract class _$$MessageEntityImplCopyWith<$Res> implements $MessageEntityCopyWith<$Res> {
  factory _$$MessageEntityImplCopyWith(_$MessageEntityImpl value, $Res Function(_$MessageEntityImpl) then) = __$$MessageEntityImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String message
});



}

/// @nodoc
class __$$MessageEntityImplCopyWithImpl<$Res> extends _$MessageEntityCopyWithImpl<$Res, _$MessageEntityImpl> implements _$$MessageEntityImplCopyWith<$Res> {
  __$$MessageEntityImplCopyWithImpl(_$MessageEntityImpl _value, $Res Function(_$MessageEntityImpl) _then)
      : super(_value, _then);


@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_$MessageEntityImpl(
message: null == message ? _value.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _$MessageEntityImpl  implements _MessageEntity {
  const _$MessageEntityImpl({required this.message});

  

@override final  String message;

@override
String toString() {
  return 'MessageEntity(message: $message)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$MessageEntityImpl&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@JsonKey(ignore: true)
@override
@pragma('vm:prefer-inline')
_$$MessageEntityImplCopyWith<_$MessageEntityImpl> get copyWith => __$$MessageEntityImplCopyWithImpl<_$MessageEntityImpl>(this, _$identity);








}


abstract class _MessageEntity implements MessageEntity {
  const factory _MessageEntity({required final  String message}) = _$MessageEntityImpl;
  

  

@override  String get message;
@override @JsonKey(ignore: true)
_$$MessageEntityImplCopyWith<_$MessageEntityImpl> get copyWith => throw _privateConstructorUsedError;

}
