import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/data/models/todo/todo.dart';
import 'package:todo_app/domain/repositories/todos_repository.dart';
import '../../../core/error/app_exception.dart';
import '../../../core/use_case/use_case.dart';

@LazySingleton()
class DeleteTodoUseCase
    extends UseCase<Future<Either<AppException, Todo>>, int> {
  final TodosRepository _todosRepository;

  DeleteTodoUseCase(this._todosRepository);

  @override
  Future<Either<AppException, Todo>> call(params) async {
    return await _todosRepository.deleteTodo(todoId: params);
  }
}
