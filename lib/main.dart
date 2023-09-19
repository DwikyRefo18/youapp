import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youapp/router/app_router.dart';
import 'package:youapp/screen/auth/login/login.dart';
import 'package:youapp/screen/home/home.dart';
import 'package:youapp/screen/profile/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  print(email);
  runApp(MaterialApp(home: email == null ? LoginPage() : ProfilePage()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter',
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
      ),
      routerConfig: _appRouter.config(
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      builder: EasyLoading.init(),
    );
  }
}
