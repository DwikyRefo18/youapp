import 'package:flutter/material.dart';
import 'package:youapp/widgets/cutom_text.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: 30,
        ),
        SizedBox(width: 4),
        CustomText(
          title: "Back",
          fontWeight: FontWeight.w700,
        )
      ],
    );
  }
}
