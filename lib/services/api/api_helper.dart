import 'package:dio/dio.dart';

class ApiHelper {
  final Dio _dio;

  ApiHelper(this._dio);

  String get baseUrl => _dio.options.baseUrl;

  Future<Response> _performRequest(Future<Response> Function() request) async {
    try {
      return await request();
    } catch (e) {
      // if (e is DioException) {
      //   DioErrorHandler.handleError(e);
      // }
      rethrow;
    }
  }

  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParameters, Options? options}) async {
    return await _performRequest(
        () => _dio.get(endpoint, queryParameters: queryParameters, options: options));
  }

  Future<Response> post(String endpoint, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    return await _performRequest(() => _dio.post(endpoint, data: data, queryParameters: queryParameters));
  }

  Future<Response> put(String endpoint,
      {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) async {
    return await _performRequest(
        () => _dio.put(endpoint, data: data, queryParameters: queryParameters, options: options));
  }

  Future<Response> delete(String endpoint, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    return await _performRequest(() => _dio.delete(endpoint, data: data, queryParameters: queryParameters));
  }
}
