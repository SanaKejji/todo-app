import 'package:auto_route/auto_route.dart';
import 'package:todo_app/core/di/injection.dart';
import 'package:todo_app/core/services/auth_storage_service.dart';
import 'package:todo_app/router/router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (getIt<AuthStorageService>().isLoggedIn) {
      resolver.next(true);
    } else {
      router.replace(const AuthRoute());
    }
  }
}
