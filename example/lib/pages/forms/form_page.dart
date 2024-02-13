import 'package:flutter/material.dart' hide FormState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fp_util/fp_util.dart';

import 'cubit/form_cubit.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form Page'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                BlocSelector<FormCubit, FormState, Field<String>>(
                  selector: (state) => state.name,
                  builder: (context, name) {
                    return TextFormField(
                      initialValue: name.value,
                      onChanged: context.read<FormCubit>().onNameChanged,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        errorText: name.displayError,
                      ),
                    );
                  },
                ),
                Sizes.gap12,
                BlocSelector<FormCubit, FormState, Field<String>>(
                  selector: (state) => state.email,
                  builder: (context, email) {
                    return TextFormField(
                      initialValue: email.value,
                      onChanged: context.read<FormCubit>().onEmailChanged,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        errorText: email.displayError,
                      ),
                    );
                  },
                ),
                Sizes.gap12,
                BlocSelector<FormCubit, FormState, Field<String>>(
                  selector: (state) => state.password,
                  builder: (context, password) {
                    return TextFormField(
                      initialValue: password.value,
                      onChanged: context.read<FormCubit>().onPasswordChanged,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        errorText: password.displayError,
                      ),
                    );
                  },
                ),
                Sizes.gap20,
                BlocBuilder<FormCubit, FormState>(
                  builder: (context, state) {
                    return FilledButton(
                      onPressed: state.isValid ? context.read<FormCubit>().submit : null,
                      child: state.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : const Text('Submit'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
