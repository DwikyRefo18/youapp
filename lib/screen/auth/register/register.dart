import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:youapp/constants/colors.dart';
import 'package:youapp/router/app_router.gr.dart';
import 'package:youapp/screen/auth/register/register_form_bloc.dart';
import 'package:youapp/widgets/button_back.dart';
import 'package:youapp/widgets/custom_button.dart';
import 'package:youapp/widgets/custom_textfield.dart';
import 'package:youapp/widgets/cutom_text.dart';
import 'package:youapp/widgets/enum/textfield_type_enum.dart';
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

                  AutoRouter.of(context).back();
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
                            title: "Register",
                            margin: EdgeInsets.only(left: 30),
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 20),
                          CustomTextField(
                            textFieldBloc: formBloc.emailField,
                            hintText: "Enter Email",
                          ),
                          CustomTextField(
                            hintText: "Create Username",
                            textFieldBloc: formBloc.usernameField,
                          ),
                          CustomTextField(
                            hintText: "Create Password",
                            textFieldBloc: formBloc.passwordField,
                            type: TextFieldType.password,
                          ),
                          CustomTextField(
                            hintText: "Confirm Password",
                            textFieldBloc: formBloc.confirmPassword,
                            type: TextFieldType.password,
                          ),
                          SizedBox(height: 15),
                          CustomButton(
                            title: "Register",
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
                                  AutoRouter.of(context).push(const LoginRoute());
                                },
                                child: CustomText(
                                  title: "Login Here",
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
                )),
          ));
        },
      ),
    );
  }
}
