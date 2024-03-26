// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  bool operator ==(Object other) {
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

/// @nodoc
mixin _$FormStatus<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() invalid,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String? message, T? data) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? invalid,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String? message, T? data)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? invalid,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String? message, T? data)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormStatusCopyWith<T, $Res> {
  factory $FormStatusCopyWith(
          FormStatus<T> value, $Res Function(FormStatus<T>) then) =
      _$FormStatusCopyWithImpl<T, $Res, FormStatus<T>>;
}

/// @nodoc
class _$FormStatusCopyWithImpl<T, $Res, $Val extends FormStatus<T>>
    implements $FormStatusCopyWith<T, $Res> {
  _$FormStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$FormStatusCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl<T> extends _Initial<T> {
  const _$InitialImpl() : super._();

  @override
  String toString() {
    return 'FormStatus<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() invalid,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String? message, T? data) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? invalid,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String? message, T? data)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? invalid,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String? message, T? data)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }
}

abstract class _Initial<T> extends FormStatus<T> {
  const factory _Initial() = _$InitialImpl<T>;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$InvalidImplCopyWith<T, $Res> {
  factory _$$InvalidImplCopyWith(
          _$InvalidImpl<T> value, $Res Function(_$InvalidImpl<T>) then) =
      __$$InvalidImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InvalidImplCopyWithImpl<T, $Res>
    extends _$FormStatusCopyWithImpl<T, $Res, _$InvalidImpl<T>>
    implements _$$InvalidImplCopyWith<T, $Res> {
  __$$InvalidImplCopyWithImpl(
      _$InvalidImpl<T> _value, $Res Function(_$InvalidImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvalidImpl<T> extends _Invalid<T> {
  const _$InvalidImpl() : super._();

  @override
  String toString() {
    return 'FormStatus<$T>.invalid()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() invalid,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String? message, T? data) success,
  }) {
    return invalid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? invalid,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String? message, T? data)? success,
  }) {
    return invalid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? invalid,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String? message, T? data)? success,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid();
    }
    return orElse();
  }
}

abstract class _Invalid<T> extends FormStatus<T> {
  const factory _Invalid() = _$InvalidImpl<T>;
  const _Invalid._() : super._();
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<T, $Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl<T> value, $Res Function(_$LoadingImpl<T>) then) =
      __$$LoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<T, $Res>
    extends _$FormStatusCopyWithImpl<T, $Res, _$LoadingImpl<T>>
    implements _$$LoadingImplCopyWith<T, $Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl<T> _value, $Res Function(_$LoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl<T> extends _Loading<T> {
  const _$LoadingImpl() : super._();

  @override
  String toString() {
    return 'FormStatus<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() invalid,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String? message, T? data) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? invalid,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String? message, T? data)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? invalid,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String? message, T? data)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }
}

abstract class _Loading<T> extends FormStatus<T> {
  const factory _Loading() = _$LoadingImpl<T>;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<T, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<T> value, $Res Function(_$ErrorImpl<T>) then) =
      __$$ErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<T, $Res>
    extends _$FormStatusCopyWithImpl<T, $Res, _$ErrorImpl<T>>
    implements _$$ErrorImplCopyWith<T, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<T> _value, $Res Function(_$ErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl<T> extends _Error<T> {
  const _$ErrorImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'FormStatus<$T>.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      __$$ErrorImplCopyWithImpl<T, _$ErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() invalid,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String? message, T? data) success,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? invalid,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String? message, T? data)? success,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? invalid,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String? message, T? data)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }
}

abstract class _Error<T> extends FormStatus<T> {
  const factory _Error({required final String message}) = _$ErrorImpl<T>;
  const _Error._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<T, $Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl<T> value, $Res Function(_$SuccessImpl<T>) then) =
      __$$SuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String? message, T? data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<T, $Res>
    extends _$FormStatusCopyWithImpl<T, $Res, _$SuccessImpl<T>>
    implements _$$SuccessImplCopyWith<T, $Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl<T> _value, $Res Function(_$SuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SuccessImpl<T>(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<T> extends _Success<T> {
  const _$SuccessImpl({this.message, this.data}) : super._();

  @override
  final String? message;
  @override
  final T? data;

  @override
  String toString() {
    return 'FormStatus<$T>.success(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      __$$SuccessImplCopyWithImpl<T, _$SuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() invalid,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String? message, T? data) success,
  }) {
    return success(message, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? invalid,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String? message, T? data)? success,
  }) {
    return success?.call(message, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? invalid,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String? message, T? data)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message, data);
    }
    return orElse();
  }
}

abstract class _Success<T> extends FormStatus<T> {
  const factory _Success({final String? message, final T? data}) =
      _$SuccessImpl<T>;
  const _Success._() : super._();

  String? get message;
  T? get data;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
