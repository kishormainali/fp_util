import '../extensions/extensions.dart';

/// {@template validator}
///
/// A [Validator] is base class for handling form validation.
///
/// {@endtemplate}
abstract class Validator<T> {
  /// {@macro validator}
  const Validator(this.message);
  final String? message;

  bool isValid(T value);

  String? call(T value) {
    return isValid(value) ? null : message;
  }
}

/// {@template emailValidator}
///
/// A [Validator] that validates an email address.
///
/// {@endtemplate}
class EmailValidator extends Validator<String> {
  const EmailValidator(super.message);

  @override
  String? call(String value) {
    return value.isNullOrEmpty ? null : super.call(value);
  }

  @override
  bool isValid(String value) => value.isEmail;
}

/// {@template requiredValidator}
///
/// A [Validator] that validates if a value is not null or empty.
///
/// {@endtemplate}
class RequiredValidator<T> extends Validator<T> {
  const RequiredValidator(super.message);

  @override
  bool isValid(T value) {
    if (value is String) {
      return value.isNotNullNotEmpty;
    } else if (value is List) {
      return value.isNotNullNotEmpty;
    } else if (value is Map) {
      return value.isNotEmpty;
    } else {
      return value != null;
    }
  }
}

/// {@template maxLengthValidator}
///
/// A [Validator] that validates max length of string.
///
/// {@endtemplate}
class MaxLengthValidator extends Validator<String> {
  const MaxLengthValidator(super.message, this.limit);
  final int limit;

  @override
  bool isValid(String value) => value.length <= limit;
}

/// {@template minLengthValidator}
///
/// A [Validator] that validates min length of string.
///
/// {@endtemplate}
class MinLengthValidator extends Validator<String> {
  const MinLengthValidator(super.message, this.limit);

  final int limit;

  @override
  bool isValid(String value) {
    return value.length >= limit;
  }
}

/// {@template matchValidator}
///
/// A [Validator] that compares two values.
/// If [compareFn] is not provided, it will compare the string values
/// of the two values.
///
/// {@endtemplate}

class MatchValidator<T> extends Validator<T> {
  const MatchValidator(
    super.message,
    this.match, {
    this.compareFn,
  });

  final T match;

  final bool Function(T value, T matchValue)? compareFn;

  @override
  bool isValid(T value) {
    return compareFn?.call(value, match) ??
        value.toString().trim() == match.toString().trim();
  }
}
