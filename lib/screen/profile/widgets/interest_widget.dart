import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:youapp/constants/colors.dart';
import 'package:youapp/widgets/cutom_text.dart';

class InterestWidget extends StatelessWidget {
  const InterestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: ColorsHelper.box1,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        sectionTitle(title: "Interest"),
        SizedBox(height: 12),
        CustomText(
          title: "Add in your interest to find a better match",
          color: Colors.white.withOpacity(0.33),
        ),
      ]),
    );
  }

  Widget sectionTitle({required String title}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CustomText(title: title, fontSize: 14),
      Icon(
        MdiIcons.pencilMinusOutline,
        color: Colors.white,
        size: 17,
      ),
    ]);
  }
}
