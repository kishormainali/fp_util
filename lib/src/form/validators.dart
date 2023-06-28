import '../extensions/extensions.dart';

abstract class Validator<T> {
  Validator(this.message);
  final String? message;

  bool isValid(T value);

  String? call(T value) {
    return isValid(value) ? null : message;
  }
}

class EmailValidator extends Validator<String> {
  EmailValidator(super.message);

  @override
  String? call(String value) {
    return value.isNullOrEmpty ? null : super.call(value);
  }

  @override
  bool isValid(String value) => value.isEmail;
}

class RequiredValidator extends Validator<String> {
  RequiredValidator(super.message);

  @override
  bool isValid(String value) => value.isNotBlank;
}

class MaxLengthValidator extends Validator<String> {
  final int limit;

  MaxLengthValidator(super.message, this.limit);

  @override
  bool isValid(String value) => value.length <= limit;
}

class MinLengthValidator extends Validator<String> {
  final int limit;

  MinLengthValidator(super.message, this.limit);

  @override
  bool isValid(String value) {
    return value.length >= limit;
  }
}

class MatchValidator<T> extends Validator<T> {
  MatchValidator(
    super.message,
    this.match, {
    this.compareFn,
  });

  final T match;

  bool Function(T value, T matchValue)? compareFn;

  @override
  bool isValid(T value) {
    return compareFn?.call(value, match) ??
        value.toString().trim() == match.toString().trim();
  }
}

class NullStringValidator extends Validator<String?> {
  NullStringValidator(super.message);

  @override
  bool isValid(String? value) {
    return value.isNotNullNotEmpty;
  }
}
