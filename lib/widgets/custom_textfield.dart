import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:youapp/widgets/cutom_text.dart';

import 'enum/textfield_style_enum.dart';
import 'enum/textfield_type_enum.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintText = 'Enter text',
    this.type = TextFieldType.input,
    this.fieldStyle = TextFieldStyle.style1,
    this.label,
    this.autofillHints,
    required this.textFieldBloc,
  });

  final String hintText;
  final TextFieldType type;
  final TextFieldStyle fieldStyle;
  final String? label;
  final TextFieldBloc<dynamic> textFieldBloc;
  final dynamic autofillHints;

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
    return Row(
      children: [
        Visibility(
            visible: widget.label != null,
            child: Expanded(
                flex: 1,
                child: CustomText(
                  title: widget.label ?? "",
                  margin: EdgeInsets.only(right: 10),
                  color: Colors.white.withOpacity(0.33),
                ))),
        Expanded(
            flex: 2,
            child: TextFieldBlocBuilder(
              textFieldBloc: widget.textFieldBloc,
              autofillHints: widget.autofillHints,
              readOnly: widget.type == TextFieldType.date ? true : false,
              onTap: widget.type == TextFieldType.date
                  ? () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                        // widget.controller?.text = formattedDate;
                      }
                    }
                  : null,
              textAlign: widget.fieldStyle == TextFieldStyle.style1 ? TextAlign.left : TextAlign.right,
              obscureText: widget.type == TextFieldType.password && !showPassword ? true : false,
              textColor: MaterialStateProperty.resolveWith((states) {
                return Colors.white;
              }),
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
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: widget.fieldStyle == TextFieldStyle.style1 ? 14 : 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: BorderSide(
                      width: widget.fieldStyle == TextFieldStyle.style1 ? 0 : 1,
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
            ))
      ],
    );
  }
}
