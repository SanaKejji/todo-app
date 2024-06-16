import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/data/models/auth/login_info.dart';
import '../../../core/error/app_exception.dart';
import '../../../core/use_case/use_case.dart';
import '../../repositories/auth_repositiory.dart';

@LazySingleton()
class RefreshTokenUseCase extends UseCase<
    Future<Either<AppException, LoginInfo>>, RefreshTokenParam> {
  final AuthRepository _authRepository;

  RefreshTokenUseCase(this._authRepository);

  @override
  Future<Either<AppException, LoginInfo>> call(params) async {
    return await _authRepository.refreshToken(params: params.toMap());
  }
}

class RefreshTokenParam {
  final String refreshToken;
  final int expiresInMins;
  RefreshTokenParam({required this.refreshToken, this.expiresInMins = 60});

  Map<String, dynamic> toMap() {
    return {
      'refreshToken': refreshToken,
      'expiresInMins': expiresInMins,
    };
  }
}
