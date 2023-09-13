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
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: AppLayout(
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
            CustomTextField(hintText: "Enter Username/Email"),
            SizedBox(height: 15),
            CustomTextField(hintText: "Enter Password", type: TextFieldType.password),
            SizedBox(height: 25),
            CustomButton(
              title: "Login",
            ),
            SizedBox(height: 30),
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
      )),
    );
  }
}
