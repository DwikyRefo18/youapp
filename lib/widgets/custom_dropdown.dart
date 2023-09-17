import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:youapp/widgets/cutom_text.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    this.label,
    required this.onSelected,
    this.hintText,
    required this.items,
    this.selectFieldBloc,
  });
  final String? label;
  final Function(String?)? onSelected;
  final String? hintText;
  final List<String> items;
  final SelectFieldBloc<String, dynamic>? selectFieldBloc;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
            visible: label != null,
            child: Expanded(
                flex: 1,
                child: CustomText(
                  title: label ?? "",
                  margin: EdgeInsets.only(right: 10),
                  color: Colors.white.withOpacity(0.33),
                ))),
        Expanded(
            flex: 2,
            child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.06), borderRadius: BorderRadius.circular(10) //<-- SEE HERE
                    ),
                child: DropdownButtonFormField(
                  onChanged: onSelected,
                  padding: EdgeInsets.zero,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Inter",
                  ),
                  hint: Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                      title: "Select Gender",
                      color: Colors.white.withOpacity(0.06),
                    ),
                  ),
                  selectedItemBuilder: (BuildContext context) {
                    return items.map<Widget>((String item) {
                      // This is the widget that will be shown when you select an item.
                      // Here custom text style, alignment and layout size can be applied
                      // to selected item string.
                      return Container(
                        constraints: BoxConstraints(minWidth: 170),
                        child: CustomText(
                          title: item,
                          color: Colors.white,
                          textAlign: TextAlign.right,
                        ),
                      );
                    }).toList();
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  dropdownColor: Colors.black,
                  items: items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(
                            title: value,
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ));
                  }).toList(),
                ))),
      ],
    );
  }
}
