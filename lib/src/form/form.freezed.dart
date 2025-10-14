// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Field<T> {
  /// value is required T value,
  T get value;

  /// validators is list of validator for field
  List<Validator<T>> get validators;

  /// isPure indicates the value is changed or not
  bool get isPure;

  /// use displayError instead of errorMessage to show error
  /// use this only to update error message from server-side validation
  String? get errorMessage;

  /// extra is extra data related to field
  Map<String, dynamic> get extra;

  /// autoValidate is used to validate mark field as pure on every change
  bool get autoValidate;

  /// Create a copy of Field
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FieldCopyWith<T, Field<T>> get copyWith =>
      _$FieldCopyWithImpl<T, Field<T>>(this as Field<T>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Field<T> &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality()
                .equals(other.validators, validators) &&
            (identical(other.isPure, isPure) || other.isPure == isPure) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other.extra, extra) &&
            (identical(other.autoValidate, autoValidate) ||
                other.autoValidate == autoValidate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(validators),
      isPure,
      errorMessage,
      const DeepCollectionEquality().hash(extra),
      autoValidate);

  @override
  String toString() {
    return 'Field<$T>(value: $value, validators: $validators, isPure: $isPure, errorMessage: $errorMessage, extra: $extra, autoValidate: $autoValidate)';
  }
}

/// @nodoc
abstract mixin class $FieldCopyWith<T, $Res> {
  factory $FieldCopyWith(Field<T> value, $Res Function(Field<T>) _then) =
      _$FieldCopyWithImpl;
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
class _$FieldCopyWithImpl<T, $Res> implements $FieldCopyWith<T, $Res> {
  _$FieldCopyWithImpl(this._self, this._then);

  final Field<T> _self;
  final $Res Function(Field<T>) _then;

  /// Create a copy of Field
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
      validators: null == validators
          ? _self.validators
          : validators // ignore: cast_nullable_to_non_nullable
              as List<Validator<T>>,
      isPure: null == isPure
          ? _self.isPure
          : isPure // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      extra: null == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      autoValidate: null == autoValidate
          ? _self.autoValidate
          : autoValidate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _Field<T> extends Field<T> {
  const _Field(
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

  /// Create a copy of Field
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FieldCopyWith<T, _Field<T>> get copyWith =>
      __$FieldCopyWithImpl<T, _Field<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Field<T> &&
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

  @override
  String toString() {
    return 'Field<$T>(value: $value, validators: $validators, isPure: $isPure, errorMessage: $errorMessage, extra: $extra, autoValidate: $autoValidate)';
  }
}

/// @nodoc
abstract mixin class _$FieldCopyWith<T, $Res>
    implements $FieldCopyWith<T, $Res> {
  factory _$FieldCopyWith(_Field<T> value, $Res Function(_Field<T>) _then) =
      __$FieldCopyWithImpl;
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
class __$FieldCopyWithImpl<T, $Res> implements _$FieldCopyWith<T, $Res> {
  __$FieldCopyWithImpl(this._self, this._then);

  final _Field<T> _self;
  final $Res Function(_Field<T>) _then;

  /// Create a copy of Field
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = freezed,
    Object? validators = null,
    Object? isPure = null,
    Object? errorMessage = freezed,
    Object? extra = null,
    Object? autoValidate = null,
  }) {
    return _then(_Field<T>(
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
      validators: null == validators
          ? _self._validators
          : validators // ignore: cast_nullable_to_non_nullable
              as List<Validator<T>>,
      isPure: null == isPure
          ? _self.isPure
          : isPure // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      extra: null == extra
          ? _self._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      autoValidate: null == autoValidate
          ? _self.autoValidate
          : autoValidate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$FormStatus<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FormStatus<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FormStatus<$T>()';
  }
}

/// @nodoc
class $FormStatusCopyWith<T, $Res> {
  $FormStatusCopyWith(FormStatus<T> _, $Res Function(FormStatus<T>) __);
}

/// Adds pattern-matching-related methods to [FormStatus].
extension FormStatusPatterns<T> on FormStatus<T> {
  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? invalid,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String? message, T? data)? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Invalid() when invalid != null:
        return invalid();
      case _Loading() when loading != null:
        return loading();
      case _Error() when error != null:
        return error(_that.message);
      case _Success() when success != null:
        return success(_that.message, _that.data);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() invalid,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String? message, T? data) success,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Invalid():
        return invalid();
      case _Loading():
        return loading();
      case _Error():
        return error(_that.message);
      case _Success():
        return success(_that.message, _that.data);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? invalid,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String? message, T? data)? success,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Invalid() when invalid != null:
        return invalid();
      case _Loading() when loading != null:
        return loading();
      case _Error() when error != null:
        return error(_that.message);
      case _Success() when success != null:
        return success(_that.message, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial<T> extends FormStatus<T> {
  const _Initial() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FormStatus<$T>.initial()';
  }
}

/// @nodoc

class _Invalid<T> extends FormStatus<T> {
  const _Invalid() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Invalid<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FormStatus<$T>.invalid()';
  }
}

/// @nodoc

class _Loading<T> extends FormStatus<T> {
  const _Loading() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FormStatus<$T>.loading()';
  }
}

/// @nodoc

class _Error<T> extends FormStatus<T> {
  const _Error({required this.message}) : super._();

  final String message;

  /// Create a copy of FormStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<T, _Error<T>> get copyWith =>
      __$ErrorCopyWithImpl<T, _Error<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'FormStatus<$T>.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<T, $Res>
    implements $FormStatusCopyWith<T, $Res> {
  factory _$ErrorCopyWith(_Error<T> value, $Res Function(_Error<T>) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<T, $Res> implements _$ErrorCopyWith<T, $Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error<T> _self;
  final $Res Function(_Error<T>) _then;

  /// Create a copy of FormStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_Error<T>(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Success<T> extends FormStatus<T> {
  const _Success({this.message, this.data}) : super._();

  final String? message;
  final T? data;

  /// Create a copy of FormStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuccessCopyWith<T, _Success<T>> get copyWith =>
      __$SuccessCopyWithImpl<T, _Success<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success<T> &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'FormStatus<$T>.success(message: $message, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<T, $Res>
    implements $FormStatusCopyWith<T, $Res> {
  factory _$SuccessCopyWith(
          _Success<T> value, $Res Function(_Success<T>) _then) =
      __$SuccessCopyWithImpl;
  @useResult
  $Res call({String? message, T? data});
}

/// @nodoc
class __$SuccessCopyWithImpl<T, $Res> implements _$SuccessCopyWith<T, $Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success<T> _self;
  final $Res Function(_Success<T>) _then;

  /// Create a copy of FormStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_Success<T>(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

// dart format on
