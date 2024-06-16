import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/app_exception.dart';
import '../../../core/use_case/use_case.dart';
import '../../../data/models/auth/user.dart';
import '../../repositories/auth_repositiory.dart';

@LazySingleton()
class GetCurrentUserUseCase
    extends UseCase<Future<Either<AppException, User>>, NoParams> {
  final AuthRepository _authRepository;

  GetCurrentUserUseCase(this._authRepository);

  @override
  Future<Either<AppException, User>> call(params) async {
    return await _authRepository.getCurrentUser();
  }
}
