import 'package:dartz/dartz.dart';

import '../../core/error/app_exception.dart';
import '../../data/models/todo/todo.dart';

abstract class TodosRepository {
  Future<Either<AppException, PaginatedTodoModel>> getAllTodos(
      {required Map<String, dynamic> params});

  Future<Either<AppException, PaginatedTodoModel>> getCurrentUserTodos();

  Future<Either<AppException, Todo>> addTodo(
      {required Map<String, dynamic> params});

  Future<Either<AppException, Todo>> updateTodo(
      {required Map<String, dynamic> params, required int todoId});

  Future<Either<AppException, Todo>> deleteTodo({required int todoId});
}
