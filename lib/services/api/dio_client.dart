import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'api_helper.dart';

class DioClient {
  final Dio _dio;
  late ApiHelper apiHelper;

  DioClient()
      : _dio = Dio(BaseOptions(
          baseUrl: dotenv.env['BASE_URL']!,
          contentType: Headers.jsonContentType,
          connectTimeout: Duration(seconds: 60),
          receiveTimeout: Duration(seconds: 60),
          // validateStatus: (status) {
          //   return status! < 400;
          // },
        )) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        return handler.next(error);
      },
    ));

    _dio.interceptors.add(LogInterceptor(responseBody: true));

    apiHelper = ApiHelper(_dio);
  }

  Dio get dio => _dio;
}
