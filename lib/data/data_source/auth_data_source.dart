import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/data/models/auth/login_info.dart';

import '../models/auth/user.dart';

@Injectable()
class AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSource({required Dio dio}) : _dio = dio;

  Future<LoginInfo> login({required Map<String, dynamic> params}) async {
    final result = await _dio.post('/auth/login', data: params);

    return LoginInfo.fromJson(result.data);
  }

  Future<LoginInfo> refreshToken({required Map<String, dynamic> params}) async {
    final result = await _dio.post('/auth/refresh', data: params);

    return LoginInfo.fromJson(result.data);
  }

  Future<User> getCurrentUser() async {
    final result = await _dio.get('/auth/me');

    return User.fromJson(result.data);
  }
}
