import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/errors/error_model.dart';
import 'package:flutter_advanced/core/errors/exceptions.dart';

class DioExceptionHandler {
  DioExceptionHandler._();

  static Never handle(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw NetworkException('Connection timeout. Please try again.');

      case DioExceptionType.sendTimeout:
        throw NetworkException('Send timeout. Please try again.');

      case DioExceptionType.receiveTimeout:
        throw NetworkException('Receive timeout. Please try again.');

      case DioExceptionType.connectionError:
        throw NetworkException('No internet connection.');

      case DioExceptionType.badCertificate:
        throw ServerException('Connection is not secure.');

      case DioExceptionType.cancel:
        throw ServerException('Request cancelled.');

      case DioExceptionType.unknown:
        if (e.error is SocketException) {
          throw NetworkException('No internet connection.');
        }

        throw ServerException('Unexpected error occurred.');

      case DioExceptionType.badResponse:
        return _handleBadResponse(e);

      // ignore: unreachable_switch_default
      default:
        throw ServerException('Something went wrong.');
    }
  }

  static Never _handleBadResponse(DioException e) {
    final statusCode = e.response?.statusCode ?? 0;

    final errorModel = parseErrorResponse(e.response?.data, statusCode);

    switch (statusCode) {
      case 400:
        throw ValidationException(
          errorModel.message,
          errorModel.code,
          errorModel.fieldErrors,
        );

      case 401:
        throw AuthException(
          errorModel.message,
          errorModel.code,
          errorModel.fieldErrors,
        );

      case 403:
        throw PermissionException(
          errorModel.message,
          errorModel.code,
          errorModel.fieldErrors,
        );

      case 404:
        throw ServerException(
          errorModel.message,
          errorModel.code,
          errorModel.fieldErrors,
        );

      case 409:
        throw ValidationException(
          errorModel.message,
          errorModel.code,
          errorModel.fieldErrors,
        );

      case 422:
        throw ValidationException(
          errorModel.message,
          errorModel.code,
          errorModel.fieldErrors,
        );

      case 500:
      case 502:
      case 503:
      case 504:
        throw ServerException(
          errorModel.message,
          errorModel.code,
          errorModel.fieldErrors,
        );

      default:
        throw ServerException(
          errorModel.message,
          errorModel.code,
          errorModel.fieldErrors,
        );
    }
  }
}

/// Parse API Error Response
ErrorModel parseErrorResponse(dynamic data, int statusCode) {
  if (data == null) {
    return ErrorModel(
      statusCode: statusCode,
      message: getDefaultErrorMessage(statusCode),
      generalErrors: [getDefaultErrorMessage(statusCode)],
    );
  }

  if (data is String) {
    return ErrorModel(
      statusCode: statusCode,
      message: data.isEmpty ? getDefaultErrorMessage(statusCode) : data,
      generalErrors: [data.isEmpty ? getDefaultErrorMessage(statusCode) : data],
    );
  }

  if (data is Map<String, dynamic>) {
    return ErrorModel.fromJson(data);
  }

  return ErrorModel(
    statusCode: statusCode,
    message: getDefaultErrorMessage(statusCode),
    generalErrors: [getDefaultErrorMessage(statusCode)],
  );
}

/// Default Messages
String getDefaultErrorMessage(int statusCode) {
  switch (statusCode) {
    case 400:
      return 'Bad request.';

    case 401:
      return 'Unauthorized.';

    case 403:
      return 'Access forbidden.';

    case 404:
      return 'Resource not found.';

    case 409:
      return 'Conflict occurred.';

    case 422:
      return 'Validation failed.';

    case 429:
      return 'Too many requests.';

    case 500:
      return 'Internal server error.';

    case 504:
      return 'Server timeout.';

    default:
      return 'Something went wrong.';
  }
}
