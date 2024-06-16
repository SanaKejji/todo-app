import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/data/data_source/todos_data_source.dart';

import 'package:todo_app/data/models/todo/todo.dart';
import 'package:todo_app/domain/repositories/todos_repository.dart';

import '../../core/error/app_exception.dart';
import '../../core/error/app_exception_handler.dart';

@LazySingleton(as: TodosRepository)
class TodosRepositoryImpl extends TodosRepository {
  final TodosRemoteDataSource _dataSource;

  TodosRepositoryImpl(this._dataSource);

  @override
  Future<Either<AppException, Todo>> addTodo(
      {required Map<String, dynamic> params}) async {
    try {
      return Right(await _dataSource.addTodo(params: params));
    } catch (e) {
      return Left(AppExceptionHandler.handleError(e));
    }
  }

  @override
  Future<Either<AppException, Todo>> deleteTodo({required int todoId}) async {
    try {
      return Right(
          await _dataSource.deleteTodo(todoId: todoId));
    } catch (e) {
      return Left(AppExceptionHandler.handleError(e));
    }
  }

  @override
  Future<Either<AppException, PaginatedTodoModel>> getAllTodos(
      {required Map<String, dynamic> params}) async {
    try {
      return Right(await _dataSource.getAllTodos(params: params));
    } catch (e) {
      return Left(AppExceptionHandler.handleError(e));
    }
  }

  @override
  Future<Either<AppException, PaginatedTodoModel>> getCurrentUserTodos() async {
    try {
      return Right(await _dataSource.getCurrentUserTodos());
    } catch (e) {
      return Left(AppExceptionHandler.handleError(e));
    }
  }

  @override
  Future<Either<AppException, Todo>> updateTodo(
      {required Map<String, dynamic> params, required int todoId}) async {
    try {
      return Right(
          await _dataSource.updateTodo(params: params, todoId: todoId));
    } catch (e) {
      return Left(AppExceptionHandler.handleError(e));
    }
  }
}
