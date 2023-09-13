// ignore_for_file: unnecessary_new

// Package imports:
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';

class NoNetworkException extends DioException {
  @override
  // ignore: overridden_fields
  RequestOptions requestOptions;

  NoNetworkException(this.requestOptions) : super(requestOptions: requestOptions);

  @override
  String get message => 'Koneksi anda sedang bermasalah';
}

class InterceptorHelper {
  String? accessToken;
  onRequest(dio.RequestOptions request, dio.RequestInterceptorHandler handler) async {
    request.headers['Content-Type'] = 'application/json';

    return handler.next(request);
  }

  onResponse(dio.Response response, dio.ResponseInterceptorHandler handler) async {
    if (response.statusCode! >= 400) {
      final error = dio.DioException(
        requestOptions: response.requestOptions,
        type: dio.DioExceptionType.badResponse,
        response: response,
      );

      return handler.reject(error);
    }

    return handler.next(response);
  }
}
