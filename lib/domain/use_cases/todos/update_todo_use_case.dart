import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/data/models/todo/todo.dart';
import 'package:todo_app/domain/repositories/todos_repository.dart';
import '../../../core/error/app_exception.dart';
import '../../../core/use_case/use_case.dart';

@LazySingleton()
class UpdateTodoUseCase
    extends UseCase<Future<Either<AppException, Todo>>, UpdateTodoParams> {
  final TodosRepository _todosRepository;

  UpdateTodoUseCase(this._todosRepository);

  @override
  Future<Either<AppException, Todo>> call(params) async {
    return await _todosRepository.updateTodo(
        params: params.toMap(), todoId: params.todoId);
  }
}

class UpdateTodoParams {
  final int todoId;
  final bool completed;

  UpdateTodoParams({this.completed = false, required this.todoId});

  Map<String, dynamic> toMap() {
    return {
      'completed': completed,
    };
  }
}
