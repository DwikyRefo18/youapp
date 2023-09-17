import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:youapp/constants/colors.dart';
import 'package:youapp/screen/profile/widgets/edit_about_form_bloc.dart';
import 'package:youapp/widgets/custom_date.dart';
import 'package:youapp/widgets/custom_dropdown.dart';
import 'package:youapp/widgets/custom_textfield.dart';
import 'package:youapp/widgets/cutom_text.dart';
import 'package:youapp/widgets/enum/textfield_style_enum.dart';

class EditAboutWidget extends StatelessWidget {
  const EditAboutWidget({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditAboutFormBloc(),
      child: Builder(builder: (context) {
        final formBloc = context.read<EditAboutFormBloc>();
        return Container(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: ColorsHelper.box1,
          ),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: <Widget>[
                sectionTitle(title: "About", onTap: onTap),
                const SizedBox(height: 15),
                updateImage(),
                const SizedBox(height: 15),
                CustomTextField(
                  textFieldBloc: formBloc.displayName,
                  hintText: "Enter name",
                  fieldStyle: TextFieldStyle.style2,
                  label: "Display Name:",
                ),
                const SizedBox(height: 8),
                CustomDropdown(
                  selectFieldBloc: formBloc.gender,
                  hintText: "Select Gender",
                  label: "Gender:",
                  items: ['Male', 'Female'],
                  onSelected: (val) {},
                ),
                const SizedBox(height: 8),
                CustomDate(
                  dateTimeFieldBloc: formBloc.birthDate,
                  hintText: 'dd-MM-yyyy',
                  fieldStyle: TextFieldStyle.style2,
                  label: 'Birthday:',
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  hintText: "--",
                  fieldStyle: TextFieldStyle.style2,
                  label: "Zodiac:",
                  textFieldBloc: formBloc.zodiac,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  hintText: "--",
                  fieldStyle: TextFieldStyle.style2,
                  label: "Horoscope:",
                  textFieldBloc: formBloc.horoscope,
                ),
                const SizedBox(height: 8),
                CustomDropdown(
                  selectFieldBloc: formBloc.height,
                  hintText: "Add height",
                  label: "Height:",
                  items: ['125', '150', '130'],
                  onSelected: (val) {},
                ),
                const SizedBox(height: 8),
                CustomDropdown(
                  selectFieldBloc: formBloc.weight,
                  hintText: "Add weight",
                  label: "Weight:",
                  items: ['40', '55', '89'],
                  onSelected: (val) {},
                ),
              ],
            ),
          ),
        );
      }),
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
