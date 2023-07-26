// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Field<T> {
  T get value => throw _privateConstructorUsedError;
  List<Validator<T>> get validators => throw _privateConstructorUsedError;
  bool get isPure => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  Map<String, dynamic> get extra => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FieldCopyWith<T, Field<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldCopyWith<T, $Res> {
  factory $FieldCopyWith(Field<T> value, $Res Function(Field<T>) then) =
      _$FieldCopyWithImpl<T, $Res, Field<T>>;
  @useResult
  $Res call(
      {T value,
      List<Validator<T>> validators,
      bool isPure,
      String? errorMessage,
      Map<String, dynamic> extra});
}

/// @nodoc
class _$FieldCopyWithImpl<T, $Res, $Val extends Field<T>>
    implements $FieldCopyWith<T, $Res> {
  _$FieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? validators = null,
    Object? isPure = null,
    Object? errorMessage = freezed,
    Object? extra = null,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
      validators: null == validators
          ? _value.validators
          : validators // ignore: cast_nullable_to_non_nullable
              as List<Validator<T>>,
      isPure: null == isPure
          ? _value.isPure
          : isPure // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      extra: null == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FieldCopyWith<T, $Res> implements $FieldCopyWith<T, $Res> {
  factory _$$_FieldCopyWith(
          _$_Field<T> value, $Res Function(_$_Field<T>) then) =
      __$$_FieldCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {T value,
      List<Validator<T>> validators,
      bool isPure,
      String? errorMessage,
      Map<String, dynamic> extra});
}

/// @nodoc
class __$$_FieldCopyWithImpl<T, $Res>
    extends _$FieldCopyWithImpl<T, $Res, _$_Field<T>>
    implements _$$_FieldCopyWith<T, $Res> {
  __$$_FieldCopyWithImpl(_$_Field<T> _value, $Res Function(_$_Field<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? validators = null,
    Object? isPure = null,
    Object? errorMessage = freezed,
    Object? extra = null,
  }) {
    return _then(_$_Field<T>(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
      validators: null == validators
          ? _value._validators
          : validators // ignore: cast_nullable_to_non_nullable
              as List<Validator<T>>,
      isPure: null == isPure
          ? _value.isPure
          : isPure // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      extra: null == extra
          ? _value._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_Field<T> extends _Field<T> {
  const _$_Field(
      {required this.value,
      final List<Validator<T>> validators = const [],
      this.isPure = true,
      this.errorMessage,
      final Map<String, dynamic> extra = const {}})
      : _validators = validators,
        _extra = extra,
        super._();

  @override
  final T value;
  final List<Validator<T>> _validators;
  @override
  @JsonKey()
  List<Validator<T>> get validators {
    if (_validators is EqualUnmodifiableListView) return _validators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_validators);
  }

  @override
  @JsonKey()
  final bool isPure;
  @override
  final String? errorMessage;
  final Map<String, dynamic> _extra;
  @override
  @JsonKey()
  Map<String, dynamic> get extra {
    if (_extra is EqualUnmodifiableMapView) return _extra;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_extra);
  }

  @override
  String toString() {
    return 'Field<$T>(value: $value, validators: $validators, isPure: $isPure, errorMessage: $errorMessage, extra: $extra)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Field<T> &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality()
                .equals(other._validators, _validators) &&
            (identical(other.isPure, isPure) || other.isPure == isPure) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._extra, _extra));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(_validators),
      isPure,
      errorMessage,
      const DeepCollectionEquality().hash(_extra));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FieldCopyWith<T, _$_Field<T>> get copyWith =>
      __$$_FieldCopyWithImpl<T, _$_Field<T>>(this, _$identity);
}

abstract class _Field<T> extends Field<T> {
  const factory _Field(
      {required final T value,
      final List<Validator<T>> validators,
      final bool isPure,
      final String? errorMessage,
      final Map<String, dynamic> extra}) = _$_Field<T>;
  const _Field._() : super._();

  @override
  T get value;
  @override
  List<Validator<T>> get validators;
  @override
  bool get isPure;
  @override
  String? get errorMessage;
  @override
  Map<String, dynamic> get extra;
  @override
  @JsonKey(ignore: true)
  _$$_FieldCopyWith<T, _$_Field<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
