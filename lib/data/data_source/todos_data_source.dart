import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/core/di/injection.dart';
import 'package:todo_app/core/services/auth_storage_service.dart';
import 'package:todo_app/core/services/user_info_service.dart';
import 'package:todo_app/data/models/todo/todo.dart';

@Injectable()
class TodosRemoteDataSource {
  final Dio _dio;

  TodosRemoteDataSource({required Dio dio}) : _dio = dio;

  Future<PaginatedTodoModel> getAllTodos(
      {required Map<String, dynamic> params}) async {
    final result = await _dio.get('/todos', queryParameters: params);

    return PaginatedTodoModel.fromJson(result.data);
  }

  Future<PaginatedTodoModel> getCurrentUserTodos() async {
    final result =
        await _dio.get('/todos/user/${getIt<AuthStorageService>().userId}');

    return PaginatedTodoModel.fromJson(result.data);
  }

  Future<Todo> addTodo({required Map<String, dynamic> params}) async {
    final result = await _dio.post('/todos/add', data: params);

    return Todo.fromJson(result.data);
  }

  Future<Todo> updateTodo(
      {required Map<String, dynamic> params, required int todoId}) async {
    final result = await _dio.put('/todos/$todoId', data: params);

    return Todo.fromJson(result.data);
  }

  Future<Todo> deleteTodo({required int todoId}) async {
    final result = await _dio.delete('/todos/$todoId');

    return Todo.fromJson(result.data);
  }
}
