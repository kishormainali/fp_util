import 'package:fp_util/fp_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'field.freezed.dart';

/// Field class for form handling
@Freezed(
  genericArgumentFactories: true,
  map: FreezedMapOptions.none,
  when: FreezedWhenOptions.none,
)
class Field<T> with _$Field<T> {
  const Field._();

  const factory Field({
    required T value,
    @Default([]) List<Validator<T>> validators,
    @Default(true) bool isPure,
    String? errorMessage,
  }) = _Field<T>;

  /// method to mark field as dirty
  Field<T> dirty(T value) => copyWith(
        value: value,
        isPure: false,
        errorMessage: _validate(),
      );

  /// show error message only when field is dirty
  String? get displayError => isPure ? null : errorMessage;

  /// check field is valid or not
  bool get isValid => validators.isEmpty ? true : validators.every((validate) => validate(value));

  /// error message for field
  /// validate field with every validators
  String? _validate() {
    for (final validator in validators) {
      if (!validator(value)) {
        return validator.message;
      }
    }
    return null;
  }
}
