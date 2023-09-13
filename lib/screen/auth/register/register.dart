import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:youapp/constants/colors.dart';
import 'package:youapp/router/app_router.gr.dart';
import 'package:youapp/widgets/button_back.dart';
import 'package:youapp/widgets/custom_button.dart';
import 'package:youapp/widgets/custom_textfield.dart';
import 'package:youapp/widgets/cutom_text.dart';
import 'package:youapp/widgets/enum/textfield_type_enum.dart';
import 'package:youapp/widgets/layout.dart';

@RoutePage()
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AppLayout(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ButtonBack(),
            SizedBox(height: 40),
            CustomText(
              title: "Register",
              margin: EdgeInsets.only(left: 30),
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 20),
            CustomTextField(hintText: "Enter Email"),
            SizedBox(height: 15),
            CustomTextField(hintText: "Cereate Username"),
            SizedBox(height: 15),
            CustomTextField(hintText: "Cerate Password", type: TextFieldType.password),
            SizedBox(height: 15),
            CustomTextField(hintText: "Confrim Password", type: TextFieldType.password),
            SizedBox(height: 15),
            CustomButton(
              title: "Register",
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  title: "Have an account?",
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
                    title: "Login here",
                    color: ColorsHelper.gold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
