// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FormState {
  Field<String> get name;
  Field<String> get email;
  Field<String> get password;
  FormStatus<String> get status;

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormStateCopyWith<FormState> get copyWith =>
      _$FormStateCopyWithImpl<FormState>(this as FormState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, password, status);

  @override
  String toString() {
    return 'FormState(name: $name, email: $email, password: $password, status: $status)';
  }
}

/// @nodoc
abstract mixin class $FormStateCopyWith<$Res> {
  factory $FormStateCopyWith(FormState value, $Res Function(FormState) _then) =
      _$FormStateCopyWithImpl;
  @useResult
  $Res call(
      {Field<String> name,
      Field<String> email,
      Field<String> password,
      FormStatus<String> status});

  $FieldCopyWith<String, $Res> get name;
  $FieldCopyWith<String, $Res> get email;
  $FieldCopyWith<String, $Res> get password;
  $FormStatusCopyWith<String, $Res> get status;
}

/// @nodoc
class _$FormStateCopyWithImpl<$Res> implements $FormStateCopyWith<$Res> {
  _$FormStateCopyWithImpl(this._self, this._then);

  final FormState _self;
  final $Res Function(FormState) _then;

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus<String>,
    ));
  }

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get name {
    return $FieldCopyWith<String, $Res>(_self.name, (value) {
      return _then(_self.copyWith(name: value));
    });
  }

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get email {
    return $FieldCopyWith<String, $Res>(_self.email, (value) {
      return _then(_self.copyWith(email: value));
    });
  }

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get password {
    return $FieldCopyWith<String, $Res>(_self.password, (value) {
      return _then(_self.copyWith(password: value));
    });
  }

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormStatusCopyWith<String, $Res> get status {
    return $FormStatusCopyWith<String, $Res>(_self.status, (value) {
      return _then(_self.copyWith(status: value));
    });
  }
}

/// Adds pattern-matching-related methods to [FormState].
extension FormStatePatterns on FormState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FormState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FormState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FormState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FormState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Field<String> name, Field<String> email,
            Field<String> password, FormStatus<String> status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FormState() when $default != null:
        return $default(_that.name, _that.email, _that.password, _that.status);
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
  TResult when<TResult extends Object?>(
    TResult Function(Field<String> name, Field<String> email,
            Field<String> password, FormStatus<String> status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormState():
        return $default(_that.name, _that.email, _that.password, _that.status);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Field<String> name, Field<String> email,
            Field<String> password, FormStatus<String> status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormState() when $default != null:
        return $default(_that.name, _that.email, _that.password, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FormState extends FormState {
  const _FormState(
      {required this.name,
      required this.email,
      required this.password,
      required this.status})
      : super._();

  @override
  final Field<String> name;
  @override
  final Field<String> email;
  @override
  final Field<String> password;
  @override
  final FormStatus<String> status;

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FormStateCopyWith<_FormState> get copyWith =>
      __$FormStateCopyWithImpl<_FormState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FormState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, password, status);

  @override
  String toString() {
    return 'FormState(name: $name, email: $email, password: $password, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$FormStateCopyWith<$Res>
    implements $FormStateCopyWith<$Res> {
  factory _$FormStateCopyWith(
          _FormState value, $Res Function(_FormState) _then) =
      __$FormStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Field<String> name,
      Field<String> email,
      Field<String> password,
      FormStatus<String> status});

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
class __$FormStateCopyWithImpl<$Res> implements _$FormStateCopyWith<$Res> {
  __$FormStateCopyWithImpl(this._self, this._then);

  final _FormState _self;
  final $Res Function(_FormState) _then;

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? status = null,
  }) {
    return _then(_FormState(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus<String>,
    ));
  }

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get name {
    return $FieldCopyWith<String, $Res>(_self.name, (value) {
      return _then(_self.copyWith(name: value));
    });
  }

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get email {
    return $FieldCopyWith<String, $Res>(_self.email, (value) {
      return _then(_self.copyWith(email: value));
    });
  }

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get password {
    return $FieldCopyWith<String, $Res>(_self.password, (value) {
      return _then(_self.copyWith(password: value));
    });
  }

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormStatusCopyWith<String, $Res> get status {
    return $FormStatusCopyWith<String, $Res>(_self.status, (value) {
      return _then(_self.copyWith(status: value));
    });
  }
}

// dart format on
