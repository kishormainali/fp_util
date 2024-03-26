part of 'form.dart';

/// {@template form_mixin}
///
/// A [FormMixin] is mixin class for handling form.
///
/// {@endtemplate}

mixin FormMixin {
  /// inputs
  List<Field> get inputs;

  /// check fields are valid
  bool get isValid => inputs.every((element) => element.isValid);

  /// check whether inputs are valid or not
  bool get isNotValid => !isValid;

  /// data to submit for remote
  Map<String, dynamic> get data;
}
