import 'package:auto_route/auto_route.dart';
import 'package:youapp/utils/middleware.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: ProfileRoute.page, initial: true, guards: [AuthGuard()]),
      ];
}
