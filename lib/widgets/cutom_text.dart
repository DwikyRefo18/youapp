import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.title,
    this.fontSize = 13,
    this.fontWeight = FontWeight.w500,
    this.margin = EdgeInsets.zero,
    this.color = Colors.white,
    this.textAlign,
    this.lineHeight,
    this.text,
    this.decoration,
  });
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry margin;
  final Color color;
  final TextAlign? textAlign;
  final double? lineHeight;
  final Text? text;
  final TextDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text(
        title,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontFamily: "Inter",
          height: lineHeight,
          decoration: decoration,
          decorationColor: color,
        ),
      ),
    );
  }
}
