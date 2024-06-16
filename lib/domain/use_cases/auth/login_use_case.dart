import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/data/models/auth/login_info.dart';
import '../../../core/error/app_exception.dart';
import '../../../core/use_case/use_case.dart';
import '../../repositories/auth_repositiory.dart';

@LazySingleton()
class LoginUseCase
    extends UseCase<Future<Either<AppException, LoginInfo>>, LoginParam> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<Either<AppException, LoginInfo>> call(params) async {
    return await _authRepository.login(params: params.toMap());
  }
}

class LoginParam {
  final String username;
  final String password;
  final int expiresInMins;
  LoginParam(
      {required this.username, required this.password, this.expiresInMins = 5});

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'expiresInMins': expiresInMins,
    };
  }
}
