// Package imports:

import 'package:dio/dio.dart';
import 'package:youapp/utils/http.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioException dioError) {
    statusCode = dioError.response?.statusCode ?? 0;

    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );

        break;
    }
  }
  late int statusCode;
  late String message;

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case HTTP_NOT_FOUND:
        return error["data"]["message"];
      case HTTP_INTERNAL_SERVER_ERROR:
        return 'Internal server error';
      case HTTP_UNPROCESSABLE_ENTITY:
      case HTTP_BAD_REQUEST:
        if (error["message"] == null) {
          return 'Oops! Something went wrong';
        } else if (error["message"].runtimeType != String) {
          return "${error['message'][0]}";
        }
        return error["data"]["message"];
      case HTTP_UNAUTHORIZED:
        return 'Unauthorized';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
