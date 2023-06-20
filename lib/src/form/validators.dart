import '../extensions/extensions.dart';

class Validator<T> {
  final String? message;

  Validator(this.message);

  call(T value) => bool;
}

class EmailValidator extends Validator<String> {
  EmailValidator(super.message);

  @override
  bool call(String value) {
    return value.isEmail;
  }
}

class RequiredValidator extends Validator<String> {
  RequiredValidator(super.message);

  @override
  bool call(String value) {
    return value.isNotBlank;
  }
}

class MaxLengthValidator extends Validator<String> {
  final int limit;

  MaxLengthValidator(super.message, this.limit);

  @override
  bool call(String value) {
    return value.length < limit;
  }
}

class MinLengthValidator extends Validator<String> {
  final int limit;

  MinLengthValidator(super.message, this.limit);

  @override
  bool call(String value) {
    return value.length > limit;
  }
}
