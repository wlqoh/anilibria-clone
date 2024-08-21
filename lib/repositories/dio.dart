import 'dart:developer';

import 'package:dio/dio.dart';

Future<Dio> getDio([Map<String, dynamic>? headers]) async {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.anilibria.tv/v3/', headers: headers));
  dio.interceptors.add(InterceptorsWrapper(
    onResponse: (response, handler) {
      logResponse(response: response);
      return handler.next(response);
    },
    onError: (error, handler) {
      logResponse(error: error);
      return handler.next(error);
    }
  ,),);

  return dio;
}

void logResponse({Response? response, DioException? error}) {
  final r = response ?? error?.response;
  final RequestOptions options = r?.requestOptions ?? error!.requestOptions;
  final shortUri = r?.realUri ?? options.uri;
  final shortUrl = shortUri.toString().replaceAll(options.baseUrl, "");
  var output = "${options.method} "
      "${r?.statusCode} "
      "$shortUrl";

  final statusCode = r?.statusCode ?? 0;
  if (statusCode >= 400 && statusCode <= 499) {
    output += " ${r?.data}";
  }
  log(output);
}