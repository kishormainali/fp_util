// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FormState {
  Field<String> get name => throw _privateConstructorUsedError;
  Field<String> get email => throw _privateConstructorUsedError;
  Field<String> get password => throw _privateConstructorUsedError;
  FormStatus<String> get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormStateCopyWith<FormState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormStateCopyWith<$Res> {
  factory $FormStateCopyWith(FormState value, $Res Function(FormState) then) = _$FormStateCopyWithImpl<$Res, FormState>;
  @useResult
  $Res call({Field<String> name, Field<String> email, Field<String> password, FormStatus<String> status});

  $FieldCopyWith<String, $Res> get name;
  $FieldCopyWith<String, $Res> get email;
  $FieldCopyWith<String, $Res> get password;
  $FormStatusCopyWith<String, $Res> get status;
}

/// @nodoc
class _$FormStateCopyWithImpl<$Res, $Val extends FormState> implements $FormStateCopyWith<$Res> {
  _$FormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get name {
    return $FieldCopyWith<String, $Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get email {
    return $FieldCopyWith<String, $Res>(_value.email, (value) {
      return _then(_value.copyWith(email: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get password {
    return $FieldCopyWith<String, $Res>(_value.password, (value) {
      return _then(_value.copyWith(password: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FormStatusCopyWith<String, $Res> get status {
    return $FormStatusCopyWith<String, $Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FormStateImplCopyWith<$Res> implements $FormStateCopyWith<$Res> {
  factory _$$FormStateImplCopyWith(_$FormStateImpl value, $Res Function(_$FormStateImpl) then) = __$$FormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Field<String> name, Field<String> email, Field<String> password, FormStatus<String> status});

  @override
  $FieldCopyWith<String, $Res> get name;
  @override
  $FieldCopyWith<String, $Res> get email;
  @override
  $FieldCopyWith<String, $Res> get password;
  @override
  $FormStatusCopyWith<String, $Res> get status;
}

/// @nodoc
class __$$FormStateImplCopyWithImpl<$Res> extends _$FormStateCopyWithImpl<$Res, _$FormStateImpl> implements _$$FormStateImplCopyWith<$Res> {
  __$$FormStateImplCopyWithImpl(_$FormStateImpl _value, $Res Function(_$FormStateImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? status = null,
  }) {
    return _then(_$FormStateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus<String>,
    ));
  }
}

/// @nodoc

class _$FormStateImpl extends _FormState {
  const _$FormStateImpl({required this.name, required this.email, required this.password, required this.status}) : super._();

  @override
  final Field<String> name;
  @override
  final Field<String> email;
  @override
  final Field<String> password;
  @override
  final FormStatus<String> status;

  @override
  String toString() {
    return 'FormState(name: $name, email: $email, password: $password, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) || other.password == password) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, password, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormStateImplCopyWith<_$FormStateImpl> get copyWith => __$$FormStateImplCopyWithImpl<_$FormStateImpl>(this, _$identity);
}

abstract class _FormState extends FormState {
  const factory _FormState({required final Field<String> name, required final Field<String> email, required final Field<String> password, required final FormStatus<String> status}) = _$FormStateImpl;
  const _FormState._() : super._();

  @override
  Field<String> get name;
  @override
  Field<String> get email;
  @override
  Field<String> get password;
  @override
  FormStatus<String> get status;
  @override
  @JsonKey(ignore: true)
  _$$FormStateImplCopyWith<_$FormStateImpl> get copyWith => throw _privateConstructorUsedError;
}
