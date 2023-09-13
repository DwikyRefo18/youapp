import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:youapp/screen/profile/widgets/about_widget.dart';
import 'package:youapp/screen/profile/widgets/interest_widget.dart';
import 'package:youapp/widgets/button_back.dart';
import 'package:youapp/widgets/custom_image.dart';
import 'package:youapp/widgets/cutom_text.dart';
import 'package:youapp/widgets/layout.dart';

import 'widgets/edit_about_widget.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEdit = false;

  void toogleEditProfile() {
    setState(() {
      isEdit = !isEdit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: AppLayout(
              child: SingleChildScrollView(
        child: Column(
          children: [
            ButtonBack(),
            SizedBox(height: 15),
            Center(
              child: Stack(
                children: <Widget>[
                  CustomImage(
                    url: 'https://akcdn.detik.net.id/visual/2021/02/11/film-makin-lama-makin-asyik_169.png?w=400&q=90',
                    height: 250,
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: '@jondea,28', fontSize: 16),
                        CustomText(
                          title: 'male',
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            badgeIcon(imageAsset: 'assets/images/virgo.png', title: "Virgo"),
                            SizedBox(width: 10),
                            badgeIcon(imageAsset: 'assets/images/pig.png', title: "Pig")
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 27),
            isEdit == true ? EditAboutWidget(onTap: toogleEditProfile) : AboutWidget(onTap: toogleEditProfile),
            SizedBox(height: 27),
            InterestWidget()
          ],
        ),
      ))),
    );
  }
}

Widget badgeIcon({required String imageAsset, required String title}) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.black54,
      ),
      child: Row(children: [
        Image.asset(
          imageAsset,
          width: 20,
          height: 20,
        ),
        CustomText(title: title, color: Colors.white54, margin: EdgeInsets.only(left: 5))
      ]));
}
