import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../models/error/error_model.dart';
import 'app_exception.dart';

class AppExceptionHandler {
  static AppException handleError(error) {
    try {
      log(error.toString());
      if (error is SocketException) {
        return _handleSocketException(error);
      } else if (error is FormatException) {
        return _handleFormatException(error);
      } else if (error is DioException) {
        return _handleDioError(error);
      } else {
        return AppException(
          message: 'Unknown Error',
          innerException: error,
        );
      }
    } catch (e) {
      return AppException(
        message: 'Unknown Error',
        innerException: error,
      );
    }
  }

  static AppException _handleSocketException(SocketException socketException) {
    return AppException(
        message: 'No internet connection :(', innerException: socketException);
  }

  static AppException _handleFormatException(FormatException formatException) {
    return AppException(
        message: "Format Exception :(", innerException: formatException);
  }

  static AppException _handleDioError(DioException error) {
    if (error.error == "XMLHttpRequest error.") {
      return AppException(
        message: 'No internet connection :(',
        innerException: error,
      );
    }
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return AppException(
          message: 'Connection Timeout :(',
          innerException: error,
        );
      case DioExceptionType.connectionError:
        return AppException(
          message: 'No internet connection :(',
          innerException: error,
        );
      case DioExceptionType.badResponse:
        return _responseErrorHandler(error);
      case DioExceptionType.receiveTimeout:
        return AppException(
          message: 'Receive Timeout :(',
          innerException: error,
        );
      case DioExceptionType.sendTimeout:
        return AppException(
          message: 'Send Timeout :(',
          innerException: error,
        );
      case DioExceptionType.cancel:
        return AppException(
          message: 'Request Cancelled :(',
          innerException: error,
        );
      case DioExceptionType.unknown:
      default:
        return AppException(
          message: 'Unknown error :(',
          innerException: error,
        );
    }
  }

  static AppException _responseErrorHandler(DioException error) {
    ErrorModel? errorDetails;
    if (error.response?.data is Map) {
      errorDetails = (error.response?.data == null)
          ? null
          : ErrorModel.fromJson(error.response?.data);
    }
    switch (error.response?.statusCode) {
      case 400:
        return AppException(
          message: errorDetails?.message ?? 'Bad Request :(',
          innerException: error,
        );
      case 404:
        return AppException(
          message: errorDetails?.message ?? 'Not Found 404 :(',
          innerException: error,
        );
      case 401:
      case 403:
        return AppException(
          message: errorDetails?.message ?? "Unauthorized :(",
          innerException: error,
        );
      case 500:
        return AppException(
          message: errorDetails?.message ?? "Internal Server Error :(",
          innerException: error,
        );
      default:
        return AppException(
          message: errorDetails?.message ?? 'Unknown error',
          innerException: error,
        );
    }
  }
}
