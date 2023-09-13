import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:youapp/constants/colors.dart';
import 'package:youapp/widgets/custom_dropdown.dart';
import 'package:youapp/widgets/custom_textfield.dart';
import 'package:youapp/widgets/cutom_text.dart';
import 'package:youapp/widgets/enum/textfield_style_enum.dart';
import 'package:youapp/widgets/enum/textfield_type_enum.dart';

class EditAboutWidget extends StatelessWidget {
  const EditAboutWidget({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    TextEditingController dateInput = TextEditingController();
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
          updateImage(),
          const SizedBox(height: 15),
          CustomTextField(
            hintText: "Enter name",
            fieldStyle: TextFieldStyle.style2,
            label: "Display Name:",
          ),
          const SizedBox(height: 15),
          CustomDropdown(
            hintText: "Select Gender",
            label: "Gender:",
            list: ['Male', 'Female'],
            onSelected: (val) {},
          ),
          const SizedBox(height: 15),
          CustomTextField(
            hintText: "DD MMM YYYY",
            fieldStyle: TextFieldStyle.style2,
            label: "Birthday:",
            type: TextFieldType.date,
            controller: dateInput,
          ),
          const SizedBox(height: 15),
          CustomTextField(
            hintText: "--",
            fieldStyle: TextFieldStyle.style2,
            label: "Horoscope:",
          ),
          const SizedBox(height: 15),
          CustomTextField(
            hintText: "--",
            fieldStyle: TextFieldStyle.style2,
            label: "Zodiac:",
          ),
          const SizedBox(height: 15),
          CustomDropdown(
            hintText: "Add height",
            label: "Height:",
            list: ['14', '15', '16', '17'],
            onSelected: (val) {},
          ),
          const SizedBox(height: 15),
          CustomDropdown(
            hintText: "Add weight",
            label: "Weight:",
            list: ['14', '15', '16', '17'],
            onSelected: (val) {},
          ),
        ],
      ),
    );
  }

  Widget updateImage() {
    return GestureDetector(
      onTap: () async {
        final ImagePicker picker = ImagePicker();
// Pick an image.
        final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      },
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(17),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Colors.white.withOpacity(0.08),
            ),
            child: Icon(
              MdiIcons.plus,
              color: ColorsHelper.gold,
              size: 22,
            ),
          ),
          SizedBox(width: 12),
          CustomText(
            title: "Add Image",
            fontSize: 12,
          ),
        ],
      ),
    );
  }

  Widget sectionTitle({required String title, required VoidCallback onTap}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CustomText(title: title, fontSize: 14),
      GestureDetector(onTap: onTap, child: CustomText(title: "Save & Update", color: ColorsHelper.gold)),
    ]);
  }
}
