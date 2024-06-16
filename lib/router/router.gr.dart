// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:todo_app/presentation/auth/auth_screen.dart' as _i1;
import 'package:todo_app/presentation/base/base_screen.dart' as _i2;
import 'package:todo_app/presentation/my_todos/my_todos_screen.dart' as _i3;
import 'package:todo_app/presentation/others_todos/others_todos_screen.dart'
    as _i4;
import 'package:todo_app/presentation/splash/splash_screen.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthScreen(),
      );
    },
    BaseRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BaseScreen(),
      );
    },
    MyTodosRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MyTodosScreen(),
      );
    },
    OthersTodosRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.OthersTodosScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i6.PageRouteInfo<void> {
  const AuthRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BaseScreen]
class BaseRoute extends _i6.PageRouteInfo<void> {
  const BaseRoute({List<_i6.PageRouteInfo>? children})
      : super(
          BaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'BaseRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MyTodosScreen]
class MyTodosRoute extends _i6.PageRouteInfo<void> {
  const MyTodosRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MyTodosRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyTodosRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.OthersTodosScreen]
class OthersTodosRoute extends _i6.PageRouteInfo<void> {
  const OthersTodosRoute({List<_i6.PageRouteInfo>? children})
      : super(
          OthersTodosRoute.name,
          initialChildren: children,
        );

  static const String name = 'OthersTodosRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
