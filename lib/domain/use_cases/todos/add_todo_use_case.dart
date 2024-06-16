import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/data/models/todo/todo.dart';
import 'package:todo_app/domain/repositories/todos_repository.dart';
import '../../../core/error/app_exception.dart';
import '../../../core/use_case/use_case.dart';

@LazySingleton()
class AddTodoUseCase
    extends UseCase<Future<Either<AppException, Todo>>, TodoParams> {
  final TodosRepository _todosRepository;

  AddTodoUseCase(this._todosRepository);

  @override
  Future<Either<AppException, Todo>> call(params) async {
    return await _todosRepository.addTodo(params: params.toMap());
  }
}

class TodoParams {
  final int userId;
  final bool completed;
  final String todo;

  TodoParams(
      {required this.userId, this.completed = false, required this.todo});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'completed': completed,
      'todo': todo,
    };
  }
}
