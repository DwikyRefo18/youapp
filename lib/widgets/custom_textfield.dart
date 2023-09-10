import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'enum/textfield_enum.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintText = 'Enter text',
    this.type = TextFieldType.input,
  });

  final String hintText;
  final TextFieldType type;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = false;

  void toogleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.type == TextFieldType.password && !showPassword ? true : false,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          suffix: widget.type == TextFieldType.password
              ? GestureDetector(
                  onTap: toogleShowPassword,
                  child: Icon(
                    showPassword == true ? MdiIcons.eyeOutline : MdiIcons.eyeOffOutline,
                    color: Colors.white,
                    size: 22,
                  ),
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.white.withOpacity(0.06),
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.4),
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          )),
    );
  }
}
