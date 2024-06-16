import 'package:dartz/dartz.dart';
import 'package:todo_app/data/models/auth/login_info.dart';

import '../../core/error/app_exception.dart';
import '../../data/models/auth/user.dart';

abstract class AuthRepository {
  Future<Either<AppException, LoginInfo>> login(
      {required Map<String, dynamic> params});
  Future<Either<AppException, LoginInfo>> refreshToken(
      {required Map<String, dynamic> params});

  Future<Either<AppException, User>> getCurrentUser();
}
