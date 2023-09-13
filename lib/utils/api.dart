// Package imports:
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:youapp/utils/interceptor.dart';

var options = BaseOptions(
  baseUrl: "https://techtest.youapp.ai/api/",
  connectTimeout: Duration(minutes: 1),
  receiveTimeout: Duration(minutes: 1),
  contentType: 'application/json',
  receiveDataWhenStatusError: true,
  validateStatus: (status) {
    return status! > 0;
  },
);

Dio apiService() {
  Dio api = Dio(options);

  final InterceptorHelper interceptorHelper = InterceptorHelper();
  api.interceptors.add(PrettyDioLogger(
    compact: false,
    responseBody: false,
    responseHeader: false,
    request: true,
    requestBody: true,
    requestHeader: false,
  ));
  api.interceptors.add(
    QueuedInterceptorsWrapper(
      onRequest: (r, h) => interceptorHelper.onRequest(r, h),
      onResponse: (r, h) => interceptorHelper.onResponse(r, h),
    ),
  );

  return api;
}
