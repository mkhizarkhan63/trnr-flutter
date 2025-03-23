import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum DioMethod { post, get, put, delete }

class APIService {
  APIService._singleton();

  static final APIService instance = APIService._singleton();

  String get baseUrl {
    if (kDebugMode) {
      return 'http://88.222.215.116/api/';
    }

    return 'http://88.222.215.116/api/';
  }

  Future<Response> request(
    String endpoint,
    DioMethod method, {
    Map<String, dynamic>? param,
    Map<String, dynamic>? queryParams,
    String? contentType,
    FormData? formData,
  }) async {
    try {
      final dio = Dio(
        BaseOptions(
            validateStatus: (status) => status! < 500,
            // Allow 400 status for inspectionz
            baseUrl: baseUrl,
            connectTimeout: const Duration(minutes: 5),
            receiveTimeout: const Duration(minutes: 5)),
      );

      if (formData != null) {
        for (var value in formData.fields) {
          print("key: ${value.key} value: ${value.value}");
        }

        for (var value in formData.files) {
          print("key: ${value.key} value: ${value.value}");
        }
      }

      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
      switch (method) {
        case DioMethod.post:
          return dio.post(endpoint,
              data: param ?? formData,
              queryParameters: queryParams,
              options: Options(
                  headers: {"Content-Type": contentType},
                  validateStatus: (status) => status! < 500));
        case DioMethod.get:
          return dio.get(endpoint, data: param);
        case DioMethod.put:
          return dio.put(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.delete:
          return dio.delete(
            endpoint,
            data: param ?? formData,
          );
        default:
          return dio.post(endpoint,
              data: param ?? formData,
              options: Options(
                  contentType: contentType,
                  validateStatus: (status) => status! < 500));
      }
    } catch (e) {
      throw Exception('Network error');
    }
  }
}
