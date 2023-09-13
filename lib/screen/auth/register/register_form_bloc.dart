import 'dart:async';

import 'package:dio/dio.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:youapp/utils/api.dart';
import 'package:youapp/utils/exceptions.dart';

final dio = apiService();

class RegisterFormBloc extends FormBloc<String, String> {
  final emailField = TextFieldBloc(validators: [FieldBlocValidators.email, FieldBlocValidators.required]);
  final passwordField =
      TextFieldBloc(validators: [FieldBlocValidators.passwordMin6Chars, FieldBlocValidators.required]);
  final usernameField = TextFieldBloc(validators: [FieldBlocValidators.required]);

  RegisterFormBloc() : super(autoValidate: true) {
    addFieldBlocs(fieldBlocs: [
      emailField,
      passwordField,
      usernameField,
    ]);
  }
  @override
  void onSubmitting() async {
    try {
      await dio.post('/register', data: {
        'email': emailField.value,
        'password': passwordField.value,
        "username": usernameField.value,
      });

      emitSuccess(canSubmitAgain: true);
    } on DioException catch (error) {
      final data = DioExceptions.fromDioError(error);
      emitFailure(failureResponse: data.message);
    }
  }
}
