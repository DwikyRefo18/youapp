import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:youapp/router/app_router.dart';

void main() {
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
    );
  }
}
