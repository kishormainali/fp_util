part of 'form_cubit.dart';

@freezed
class FormState with _$FormState, FormMixin {
  const FormState._();
  const factory FormState({
    required Field<String> name,
    required Field<String> email,
    required Field<String> password,
    required FormStatus<String> status,
  }) = _FormState;

  /// Initial state of the form
  factory FormState.initial() => const FormState(
        name: Field<String>(
          value: '',
          validators: [
            RequiredValidator('Name is required'),
          ],
        ),
        email: Field<String>(
          value: '',
          validators: [
            RequiredValidator('Email is required'),
            EmailValidator(
              'Please enter a valid email address',
            ),
          ],
        ),
        password: Field<String>(
          value: '',
          validators: [
            RequiredValidator('Password is required'),
            MinLengthValidator('Password must be at least 5 characters', 5),
          ],
        ),
        status: FormStatus.initial(),
      );

  FormState dirty({
    Field<String>? name,
    Field<String>? email,
    Field<String>? password,
  }) {
    return copyWith(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      status: const FormStatus.initial(),
    );
  }

  bool get isLoading => status.isLoading;

  @override
  Map<String, dynamic> get data => {
        'name': name.value,
        'email': email.value,
        'password': password.value,
      };

  @override
  List<Field> get inputs => [name, email, password];
}
