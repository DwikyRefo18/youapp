import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youapp/constants/colors.dart';
import 'package:youapp/widgets/cutom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.title = "login",
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [ColorsHelper.button1, ColorsHelper.button2]),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: double.maxFinite,
          height: 48,
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [ColorsHelper.button1, ColorsHelper.button2]),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: ColorsHelper.button1.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 14,
                  offset: Offset(0, 6),
                )
              ]),
          padding: const EdgeInsets.all(10),
          constraints: const BoxConstraints(minWidth: 88.0),
          child: CustomText(
            title: title,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            lineHeight: 1.5,
          ),
        ),
      ),
    );
  }
}
