import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/data/data_source/todos_data_source.dart';
import 'package:todo_app/data/models/todo/todo.dart';
import 'package:todo_app/domain/use_cases/todos/get_all_todos_use_case.dart';

import 'todos_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
main() async {
  late TodosRemoteDataSource todosRemoteDataSource;
  late MockDio mockDio;
  const String path = '/todos';
  const String baseUrl = 'https://dummyjson.com';
  setUp(() {
    mockDio = MockDio();
    todosRemoteDataSource = TodosRemoteDataSource(dio: mockDio);
  });

  group('fetching user todos test', () {
    test('fetch success', () async {
      when(mockDio.get(path, queryParameters: PaginationParam(limit: 10, skip: 20).toMap()))
          .thenAnswer((realInvocation) async => Future.value(Response(
              statusCode: 200, data: _fakeData, requestOptions: RequestOptions(baseUrl: baseUrl))));
      final result = await todosRemoteDataSource.getAllTodos(
          params: PaginationParam(limit: 10, skip: 20).toMap());
      expect(result, const TypeMatcher<PaginatedTodoModel>());
      verify(mockDio.get(path, queryParameters: PaginationParam(limit: 10, skip: 20).toMap()))
          .called(1);
    });
  });
}

final _fakeData = {
  "todos": [
    {
      "id": 1,
      "todo": "Do something nice for someone I care about",
      "completed": true,
      "userId": 26
    },
    {"id": 2, "todo": "Do something nice", "completed": false, "userId": 26},
    // 30 items
  ],
  "total": 2,
  "skip": 0,
  "limit": 2
};
