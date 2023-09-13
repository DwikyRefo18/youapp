import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:youapp/widgets/cutom_text.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).back();
      },
      child: Row(
        children: [
          Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
          SizedBox(width: 4),
          CustomText(
            title: "Back",
            fontWeight: FontWeight.w700,
          )
        ],
      ),
    );
  }
}
