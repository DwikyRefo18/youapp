import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:youapp/constants/colors.dart';
import 'package:youapp/widgets/cutom_text.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: ColorsHelper.box1,
      ),
      child: Column(
        children: [
          sectionTitle(title: "About", onTap: onTap),
          const SizedBox(height: 15),
          sectionAbout(title: "Birthday", value: "28/08/1995 (Age 28)"),
          const SizedBox(height: 12),
          sectionAbout(title: "Horoscope", value: "Virgo"),
          const SizedBox(height: 12),
          sectionAbout(title: "Zodiac", value: "Pig"),
          const SizedBox(height: 12),
          sectionAbout(title: "Height", value: "175cm"),
          const SizedBox(height: 12),
          sectionAbout(title: "Weight", value: "69kg"),
        ],
      ),
    );
  }

  Widget sectionAbout({required String title, required String value}) {
    return Row(
      children: [
        CustomText(
          title: "$title :",
          fontSize: 14,
          color: Colors.white.withOpacity(0.33),
        ),
        SizedBox(width: 10),
        CustomText(
          title: value,
          fontSize: 14,
        ),
      ],
    );
  }

  Widget sectionTitle({required String title, required VoidCallback onTap}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CustomText(title: title, fontSize: 14),
      GestureDetector(
        onTap: onTap,
        child: Icon(
          MdiIcons.pencilMinusOutline,
          color: Colors.white,
          size: 17,
        ),
      ),
    ]);
  }
}
