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
  /// value is required T value,
  T get value => throw _privateConstructorUsedError;

  /// validators is list of validator for field
  List<Validator<T>> get validators => throw _privateConstructorUsedError;

  /// isPure indicates the value is changed or not
  bool get isPure => throw _privateConstructorUsedError;

  /// use displayError instead of errorMessage to show error
  /// use this only to update error message from server-side validation
  String? get errorMessage => throw _privateConstructorUsedError;

  /// extra is extra data related to field
  Map<String, dynamic> get extra => throw _privateConstructorUsedError;

  /// autoValidate is used to validate mark field as pure on every change
  bool get autoValidate => throw _privateConstructorUsedError;

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
      Map<String, dynamic> extra,
      bool autoValidate});
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
    Object? autoValidate = null,
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
      autoValidate: null == autoValidate
          ? _value.autoValidate
          : autoValidate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FieldImplCopyWith<T, $Res>
    implements $FieldCopyWith<T, $Res> {
  factory _$$FieldImplCopyWith(
          _$FieldImpl<T> value, $Res Function(_$FieldImpl<T>) then) =
      __$$FieldImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {T value,
      List<Validator<T>> validators,
      bool isPure,
      String? errorMessage,
      Map<String, dynamic> extra,
      bool autoValidate});
}

/// @nodoc
class __$$FieldImplCopyWithImpl<T, $Res>
    extends _$FieldCopyWithImpl<T, $Res, _$FieldImpl<T>>
    implements _$$FieldImplCopyWith<T, $Res> {
  __$$FieldImplCopyWithImpl(
      _$FieldImpl<T> _value, $Res Function(_$FieldImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? validators = null,
    Object? isPure = null,
    Object? errorMessage = freezed,
    Object? extra = null,
    Object? autoValidate = null,
  }) {
    return _then(_$FieldImpl<T>(
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
      autoValidate: null == autoValidate
          ? _value.autoValidate
          : autoValidate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FieldImpl<T> extends _Field<T> {
  const _$FieldImpl(
      {required this.value,
      final List<Validator<T>> validators = const [],
      this.isPure = true,
      this.errorMessage,
      final Map<String, dynamic> extra = const {},
      this.autoValidate = true})
      : _validators = validators,
        _extra = extra,
        super._();

  /// value is required T value,
  @override
  final T value;

  /// validators is list of validator for field
  final List<Validator<T>> _validators;

  /// validators is list of validator for field
  @override
  @JsonKey()
  List<Validator<T>> get validators {
    if (_validators is EqualUnmodifiableListView) return _validators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_validators);
  }

  /// isPure indicates the value is changed or not
  @override
  @JsonKey()
  final bool isPure;

  /// use displayError instead of errorMessage to show error
  /// use this only to update error message from server-side validation
  @override
  final String? errorMessage;

  /// extra is extra data related to field
  final Map<String, dynamic> _extra;

  /// extra is extra data related to field
  @override
  @JsonKey()
  Map<String, dynamic> get extra {
    if (_extra is EqualUnmodifiableMapView) return _extra;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_extra);
  }

  /// autoValidate is used to validate mark field as pure on every change
  @override
  @JsonKey()
  final bool autoValidate;

  @override
  String toString() {
    return 'Field<$T>(value: $value, validators: $validators, isPure: $isPure, errorMessage: $errorMessage, extra: $extra, autoValidate: $autoValidate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldImpl<T> &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality()
                .equals(other._validators, _validators) &&
            (identical(other.isPure, isPure) || other.isPure == isPure) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._extra, _extra) &&
            (identical(other.autoValidate, autoValidate) ||
                other.autoValidate == autoValidate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(_validators),
      isPure,
      errorMessage,
      const DeepCollectionEquality().hash(_extra),
      autoValidate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldImplCopyWith<T, _$FieldImpl<T>> get copyWith =>
      __$$FieldImplCopyWithImpl<T, _$FieldImpl<T>>(this, _$identity);
}

abstract class _Field<T> extends Field<T> {
  const factory _Field(
      {required final T value,
      final List<Validator<T>> validators,
      final bool isPure,
      final String? errorMessage,
      final Map<String, dynamic> extra,
      final bool autoValidate}) = _$FieldImpl<T>;
  const _Field._() : super._();

  @override

  /// value is required T value,
  T get value;
  @override

  /// validators is list of validator for field
  List<Validator<T>> get validators;
  @override

  /// isPure indicates the value is changed or not
  bool get isPure;
  @override

  /// use displayError instead of errorMessage to show error
  /// use this only to update error message from server-side validation
  String? get errorMessage;
  @override

  /// extra is extra data related to field
  Map<String, dynamic> get extra;
  @override

  /// autoValidate is used to validate mark field as pure on every change
  bool get autoValidate;
  @override
  @JsonKey(ignore: true)
  _$$FieldImplCopyWith<T, _$FieldImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
