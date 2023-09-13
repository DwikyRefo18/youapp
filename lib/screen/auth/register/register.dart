import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:youapp/screen/auth/register/register_form_bloc.dart';
import 'package:youapp/widgets/button_back.dart';
import 'package:youapp/widgets/custom_button.dart';
import 'package:youapp/widgets/layout.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = context.read<RegisterFormBloc>();
          return SafeArea(
              child: Scaffold(
            body: FormBlocListener<RegisterFormBloc, String, String>(
                onSubmitting: (context, state) {
                  EasyLoading.show(status: 'loading...');
                },
                onSuccess: (context, state) {
                  EasyLoading.dismiss();
                  AnimatedSnackBar.material(
                    'Data berhasil di submit',
                    type: AnimatedSnackBarType.success, // Position of snackbar on desktop devices
                  ).show(context);
                },
                onFailure: (context, state) {
                  EasyLoading.dismiss();
                  AnimatedSnackBar.material(
                    state.failureResponse ?? "",
                    type: AnimatedSnackBarType.error, // Position of snackbar on desktop devices
                  ).show(context);
                },
                child: ScrollableFormBlocManager(
                  formBloc: formBloc,
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        ButtonBack(),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc.usernameField,
                          autofillHints: const [AutofillHints.username],
                          decoration: const InputDecoration(
                              labelText: 'TextFieldBlocBuilder',
                              prefixIcon: Icon(Icons.text_fields),
                              hintText: "Username"),
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc.emailField,
                          autofillHints: const [AutofillHints.email],
                          decoration: const InputDecoration(
                              labelText: 'TextFieldBlocBuilder',
                              prefixIcon: Icon(Icons.text_fields),
                              hintText: "Email"),
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc.passwordField,
                          autofillHints: const [AutofillHints.password],
                          suffixButton: SuffixButton.obscureText,
                          decoration: const InputDecoration(
                              labelText: 'TextFieldBlocBuilder',
                              prefixIcon: Icon(Icons.text_fields),
                              hintText: "Password"),
                        ),
                        CustomButton(
                          title: "Register",
                          onTap: formBloc.submit,
                        ),
                      ],
                    ),
                  ),
                )),
          ));
        },
      ),
    );
  }
}
