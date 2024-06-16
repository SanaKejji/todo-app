import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/core/di/injection.dart';
import 'package:todo_app/core/services/auth_storage_service.dart';
import 'package:todo_app/data/models/auth/login_info.dart';
import 'package:todo_app/domain/use_cases/auth/refresh_token_use_case.dart';

import '../../error/app_exception.dart';

@lazySingleton
class DioHeadersInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(
        {"Authorization": "Bearer ${getIt<AuthStorageService>().accessToken}"});
    log('headers are ${options.headers}');
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.badResponse) {
      if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
        LoginInfo? authData = getIt<AuthStorageService>().getLoginInfo();
        final result = await getIt<RefreshTokenUseCase>().call(
            RefreshTokenParam(refreshToken: authData?.refreshToken ?? ''));
        result.fold((failure) {
          handler.reject(err);
        }, (authData) async {
          getIt<AuthStorageService>().setLoginInfo(authData.copyWith(
              refreshToken: authData.refreshToken, token: authData.token));
          final response = await _retry(err.requestOptions);
          handler.resolve(response);
        });
        return;
      }
    }
    handler.next(err);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    return getIt<Dio>().fetch<dynamic>(requestOptions);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }
}
