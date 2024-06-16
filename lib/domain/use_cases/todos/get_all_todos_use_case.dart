import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/data/models/todo/todo.dart';
import 'package:todo_app/domain/repositories/todos_repository.dart';
import '../../../core/error/app_exception.dart';
import '../../../core/use_case/use_case.dart';

@LazySingleton()
class GetAllTodosUseCase extends UseCase<
    Future<Either<AppException, PaginatedTodoModel>>, PaginationParam> {
  final TodosRepository _todosRepository;

  GetAllTodosUseCase(this._todosRepository);

  @override
  Future<Either<AppException, PaginatedTodoModel>> call(params) async {
    return await _todosRepository.getAllTodos(params: params.toMap());
  }
}

class PaginationParam {
  final int limit;
  final int skip;

  PaginationParam({required this.limit, required this.skip});

  Map<String, dynamic> toMap() {
    return {
      'limit': limit,
      'skip': skip,
    };
  }
}
