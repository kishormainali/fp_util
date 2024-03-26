import 'package:bloc/bloc.dart';
import 'package:fp_util/form.dart';
import 'package:fp_util/fp_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_cubit.freezed.dart';
part 'form_state.dart';

class FormCubit extends Cubit<FormState> {
  FormCubit() : super(FormState.initial());

  void onNameChanged(String value) {
    final name = state.name.dirty(value);
    emit(state.dirty(name: name));
  }

  void onEmailChanged(String value) {
    final email = state.email.dirty(value);
    emit(state.dirty(email: email));
  }

  void onPasswordChanged(String value) {
    final password = state.password.dirty(value);
    emit(state.dirty(password: password));
  }

  void submit() async {
    Logger.d(state.data);
  }
}
