import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:youapp/widgets/cutom_text.dart';
import 'package:youapp/widgets/enum/textfield_style_enum.dart';
import 'package:youapp/widgets/enum/textfield_type_enum.dart';

class CustomDate extends StatelessWidget {
  const CustomDate({
    super.key,
    this.hintText = 'Enter text',
    this.type = TextFieldType.input,
    this.fieldStyle = TextFieldStyle.style1,
    this.label,
    required this.dateTimeFieldBloc,
  });

  final String hintText;
  final TextFieldType type;
  final TextFieldStyle fieldStyle;
  final String? label;
  final InputFieldBloc<DateTime?, dynamic> dateTimeFieldBloc;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Visibility(
        visible: label != null,
        child: Expanded(
          flex: 1,
          child: CustomText(
            title: label ?? "",
            margin: EdgeInsets.only(right: 10),
            color: Colors.white.withOpacity(0.33),
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: DateTimeFieldBlocBuilder(
          dateTimeFieldBloc: dateTimeFieldBloc,
          format: DateFormat('dd-MM-yyyy'),
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
          decoration: InputDecoration(
            hintText: 'dd-MM-yyyy',
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide(
                width: fieldStyle == TextFieldStyle.style1 ? 0 : 1,
                style: BorderStyle.none,
              ),
            ),
          ),
          textAlign: fieldStyle == TextFieldStyle.style1 ? TextAlign.left : TextAlign.right,
          textColor: MaterialStateProperty.resolveWith(
            (states) {
              return Colors.white;
            },
          ),
        ),
      )
    ]);
  }
}
