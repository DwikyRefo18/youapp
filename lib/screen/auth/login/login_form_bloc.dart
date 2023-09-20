import 'dart:async';

import 'package:dio/dio.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youapp/utils/api.dart';
import 'package:youapp/utils/exceptions.dart';

final dio = apiService();

class LoginFormBloc extends FormBloc<String, String> {
  final emailFeild = TextFieldBloc(validators: [FieldBlocValidators.email, FieldBlocValidators.required]);
  final passwordField =
      TextFieldBloc(validators: [FieldBlocValidators.passwordMin6Chars, FieldBlocValidators.required]);
  final usernameField = TextFieldBloc(validators: [FieldBlocValidators.required]);

  final confirmPassword = TextFieldBloc(validators: [FieldBlocValidators.required]);

  Validator<String> _confirmPassword(
    TextFieldBloc passwordTextFieldBloc,
  ) {
    return (String? confirmPassword) {
      if (confirmPassword == passwordTextFieldBloc.value) {
        return null;
      }
      return "Must be equal to password";
    };
  }

  LoginFormBloc() : super(autoValidate: true) {
    addFieldBlocs(fieldBlocs: [
      emailFeild,
      passwordField,
      usernameField,
    ]);

    confirmPassword
      ..addValidators([_confirmPassword(passwordField)])
      ..subscribeToFieldBlocs([passwordField]);
  }

  @override
  void onSubmitting() async {
    try {
      await dio.post('/login', data: {
        'email': emailFeild.value,
        'password': passwordField.value,
        "username": usernameField.value,
      });
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', 'AIUEO');
      // print(response);
      emitSuccess(canSubmitAgain: true);
    } on DioException catch (error) {
      final data = DioExceptions.fromDioError(error);
      emitFailure(failureResponse: data.message);
    }
  }
}
