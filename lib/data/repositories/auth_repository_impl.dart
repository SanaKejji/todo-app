import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/data/data_source/auth_data_source.dart';
import 'package:todo_app/data/models/auth/login_info.dart';
import 'package:todo_app/data/models/auth/user.dart';

import '../../core/error/app_exception.dart';
import '../../core/error/app_exception_handler.dart';
import '../../domain/repositories/auth_repositiory.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);
  @override
  Future<Either<AppException, LoginInfo>> login(
      {required Map<String, dynamic> params}) async {
    try {
      return Right(await _dataSource.login(params: params));
    } catch (e) {
      return Left(AppExceptionHandler.handleError(e));
    }
  }

  @override
  Future<Either<AppException, User>> getCurrentUser() async {
    try {
      return Right(await _dataSource.getCurrentUser());
    } catch (e) {
      return Left(AppExceptionHandler.handleError(e));
    }
  }

  @override
  Future<Either<AppException, LoginInfo>> refreshToken(
      {required Map<String, dynamic> params}) async {
    try {
      return Right(await _dataSource.refreshToken(params: params));
    } catch (e) {
      return Left(AppExceptionHandler.handleError(e));
    }
  }
}
