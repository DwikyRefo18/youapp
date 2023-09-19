import 'dart:ffi';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:youapp/constants/colors.dart';
import 'package:youapp/router/app_router.gr.dart';
import 'package:youapp/screen/auth/login/login_form_bloc.dart';
import 'package:youapp/widgets/button_back.dart';
import 'package:youapp/widgets/custom_button.dart';
import 'package:youapp/widgets/custom_textfield.dart';
import 'package:youapp/widgets/cutom_text.dart';
import 'package:youapp/widgets/enum/textfield_type_enum.dart';
import 'package:youapp/widgets/layout.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormBloc(),
      child: Builder(builder: (context) {
        final formBloc = context.read<LoginFormBloc>();
        return SafeArea(
          child: Scaffold(
            body: FormBlocListener<LoginFormBloc, String, String>(
              onSubmitting: (context, state) {
                EasyLoading.show(status: 'loading...');
              },
              onSuccess: (context, state) {
                EasyLoading.dismiss();
                AnimatedSnackBar.material(
                  'Data berhasil di submit',
                  type: AnimatedSnackBarType.success, // Position of snackbar on desktop devices
                ).show(context);
                AutoRouter.of(context).push(const ProfileRoute());
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
                child: AppLayout(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ButtonBack(),
                        SizedBox(height: 40),
                        CustomText(
                          title: "Login",
                          margin: EdgeInsets.only(left: 30),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          textFieldBloc: formBloc.emailFeild,
                          hintText: "Email",
                        ),
                        CustomTextField(
                          hintText: "Username",
                          textFieldBloc: formBloc.usernameField,
                        ),
                        CustomTextField(
                          hintText: "Enter Password",
                          textFieldBloc: formBloc.passwordField,
                          type: TextFieldType.password,
                        ),
                        SizedBox(height: 15),
                        CustomButton(
                          title: "Login",
                          onTap: formBloc.submit,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              title: "No account?",
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            GestureDetector(
                              onTap: () {
                                AutoRouter.of(context).push(const ProfileRoute());
                              },
                              child: CustomText(
                                title: "Register Here",
                                color: ColorsHelper.gold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
