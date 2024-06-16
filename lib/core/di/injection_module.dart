import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../router/router.dart';
import '../unified_api/dio/dio_interceptor.dart';
import '../unified_api/dio/factory.dart';
import 'injection.dart';

@module
abstract class InjectableModule {
  @preResolve
  @lazySingleton
  Future<SharedPreferences> get sharedPref => SharedPreferences.getInstance();

  @lazySingleton
  Dio get dioInstance {
    return DioFactory.create(
        baseUrl: 'https://dummyjson.com',
        interceptor: getIt.get<DioHeadersInterceptor>());
  }

  @lazySingleton
  AppRouter get router => AppRouter();
}
