import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youapp/constants/colors.dart';

class AppLayout extends StatelessWidget {
  AppLayout({super.key, this.child});
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      width: double.infinity,
      constraints: BoxConstraints(minHeight: double.infinity),
      decoration: const BoxDecoration(
        gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
          ColorsHelper.bg3,
          ColorsHelper.bg2,
          ColorsHelper.bg1,
        ], stops: [
          0,
          0.2,
          1
        ]),
      ),
      child: child,
    );
  }
}
