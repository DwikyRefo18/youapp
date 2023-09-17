import 'package:dio/dio.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:youapp/utils/api.dart';
import 'package:youapp/utils/exceptions.dart';

final dio = apiService();

class EditAboutFormBloc extends FormBloc<String, String> {
  final displayName = TextFieldBloc(
    name: 'displayName',
  );

  final gender = SelectFieldBloc(
    items: ['Male', 'Female'],
  );

  final birthDate = InputFieldBloc<DateTime?, Object>(
    name: 'birthDate',
    initialValue: null,
    toJson: (value) => value!.toUtc().toIso8601String(),
  );

  final horoscope = TextFieldBloc();

  final zodiac = TextFieldBloc();

  final height = SelectFieldBloc(
    items: ['125', '150', '130'],
  );

  final weight = SelectFieldBloc(
    items: ['40', '55', '89'],
  );

  EditAboutFormBloc() {
    addFieldBlocs(fieldBlocs: [
      displayName,
      gender,
      birthDate,
      horoscope,
      zodiac,
      height,
      weight,
    ]);
  }

  @override
  void onSubmitting() async {
    try {
      await dio.post('/updateProfile', data: {
        "name": displayName.value,
        "birthday": birthDate.value,
        "height": height.value,
        "weight": weight.value,
        "interests": ["string"]
      });

      emitSuccess(canSubmitAgain: true);
    } on DioException catch (error) {
      final data = DioExceptions.fromDioError(error);
      emitFailure(failureResponse: data.message);
    }
  }
}
