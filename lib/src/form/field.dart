import 'package:fp_util/fp_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'field.freezed.dart';

/// {@template field}
///
/// A [Field] is  class for handling state of form field.
///
/// [T] is type of value of field
///
/// [List<Validator<T>>] is list of validator for field
///
/// [isPure] indicates the value is changed or not
///
/// [errorMessage] is error message for field,
/// use [displayError] instead of [errorMessage] to show error,
/// use [errorMessage] only to update error message from server-side validation
///
/// [extra] is extra data related to field
/// for example, we can store obscureText value for password field
///
/// [autoValidate] is used to validate mark field as pure on every change
///
/// {@endtemplate}
@Freezed(
  genericArgumentFactories: true,
  map: FreezedMapOptions.none,
  when: FreezedWhenOptions.none,
)
class Field<T> with _$Field<T> {
  const Field._();

  /// {@macro field}
  const factory Field({
    /// value is required T value,
    required T value,

    /// validators is list of validator for field
    @Default([]) List<Validator<T>> validators,

    /// isPure indicates the value is changed or not
    @Default(true) bool isPure,

    /// use displayError instead of errorMessage to show error
    /// use this only to update error message from server-side validation
    String? errorMessage,

    /// extra is extra data related to field
    @Default({}) Map<String, dynamic> extra,

    /// autoValidate is used to validate mark field as pure on every change
    @Default(true) bool autoValidate,
  }) = _Field<T>;

  /// method to mark field as dirty
  Field<T> dirty(T updatedValue) {
    return copyWith(
      value: updatedValue,
      isPure: !autoValidate,
      errorMessage: autoValidate ? _validate(updatedValue) : null,
    );
  }

  /// method to update extra data
  /// extra data is used to store any extra data related to field
  /// for example, we can store obscureText value for password field
  Field<T> updateExtra(Map<String, dynamic> updatedExtra) {
    return copyWith(
      extra: updatedExtra,
    );
  }

  /// method to make field dirty and validate with match validator
  Field<T> match(
    T updatedValue,
    T matchValue,
    String matchErrorMessage, {
    bool Function(T value, T matchValue)? compareFn,
    String key = 'default-match-validator',
  }) {
    final updatedValidators = validators.toList();

    /// remove existing match validator to avoid duplicate
    updatedValidators.removeWhere(
      (validator) {
        if (validator is MatchValidator<T>) {
          return validator.key == key;
        }
        return false;
      },
    );

    /// add new match validator
    updatedValidators.add(
      MatchValidator<T>(
        matchErrorMessage,
        matchValue,
        compareFn: compareFn,
        key: key,
      ),
    );

    return copyWith(
      value: updatedValue,
      validators: updatedValidators,
      isPure: !autoValidate,
      errorMessage: autoValidate ? _validate(updatedValue, updatedValidators) : null,
    );
  }

  /// method to make field dirty and validate with multiple match validator
  Field<T> matchMultiple(
    T updatedValue, {
    List<MatchHolder<T>> matchHolders = const [],
  }) {
    final updatedValidators = validators.toList();

    /// remove existing match validator to avoid duplicate
    updatedValidators.removeWhere(
      (validator) {
        if (validator is MatchValidator<T>) {
          return matchHolders.any((matchHolder) => matchHolder.key == validator.key);
        }
        return false;
      },
    );

    /// add new match validator
    updatedValidators.addAll(
      matchHolders.map(
        (matchHolder) => MatchValidator<T>(
          matchHolder.message,
          matchHolder.match,
          compareFn: matchHolder.compareFn,
          key: matchHolder.key,
        ),
      ),
    );

    return copyWith(
      value: updatedValue,
      validators: updatedValidators,
      isPure: !autoValidate,
      errorMessage: autoValidate ? _validate(updatedValue, updatedValidators) : null,
    );
  }

  /// show error message only when field is dirty
  ///  use displayError instead of errorMessage
  String? get displayError => isPure ? null : errorMessage;

  /// check field is valid or not
  bool get isValid => validators.isEmpty ? true : _validate(value) == null;

  /// error message for field
  /// validate field with every validators
  String? _validate(T updatedValue, [List<Validator<T>>? optionalValidators]) {
    final updatedValidators = optionalValidators ?? validators;
    for (final validator in updatedValidators) {
      if (!validator.isValid(updatedValue)) {
        return validator.message;
      }
    }
    return null;
  }

  /// mark field as dirty
  Field<T> markDirty() {
    return copyWith(
      isPure: false,
      errorMessage: _validate(value), // force field to validate
    );
  }
}
