import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio create(
      {required String baseUrl, required Interceptor interceptor}) {
    final baseOptions = BaseOptions(baseUrl: baseUrl);
    final dio = Dio(baseOptions);

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));
    }
    dio.interceptors.add(interceptor);

    return dio;
  }
}
