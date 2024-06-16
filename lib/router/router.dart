import 'package:auto_route/auto_route.dart';
import 'package:todo_app/router/router.gr.dart';

import 'guards/auth_guard.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: BaseRoute.page, guards: [
          AuthGuard()
        ], children: [
          AutoRoute(page: OthersTodosRoute.page),
          AutoRoute(page: MyTodosRoute.page),
        ]),
      ];
}
