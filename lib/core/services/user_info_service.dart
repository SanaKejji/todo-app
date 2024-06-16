import 'dart:developer';

import 'package:todo_app/core/di/injection.dart';
import 'package:todo_app/core/use_case/use_case.dart';
import 'package:todo_app/domain/use_cases/auth/get_current_use_case.dart';

import '../../data/models/auth/user.dart';

class UserInfoService {
  UserInfoService._internal();

  static final instance = UserInfoService._internal();

  User? user;

  int? get userId {
    return user?.id;
  }

  set setUser(User? user) {
    this.user = user;
  }

  Future<void> getUserInfo() async {
    final result = await getIt<GetCurrentUserUseCase>().call(NoParams());
    result.fold((l) {
      log('failed to get current user');
    }, (user) {
      this.user = user;
    });
  }

  void deleteUser() {
    user = null;
  }
}
