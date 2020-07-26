import 'package:dio/dio.dart';

import 'interceptors.dart';

class CustomDio {
  Dio _dio;
  final Map<String, dynamic> _headers = {};
  BaseOptions _options;

  CustomDio() {
    _options = BaseOptions(
      baseUrl: 'http://10.0.2.2:3333/', //android emulator
      // baseUrl: 'http://localhost:3333/', // ios emulator
      // baseUrl: 'http://192.168.0.142:3333'/ // physical device
      connectTimeout: 15000,
      contentType: 'application/json'
    );

    _dio = Dio(_options);
    _dio.interceptors.add(CustomInterceptors());
  }

  void setNewHeaders(Map<String, dynamic> headers) {
    _headers.addAll(headers);
    _dio.options.headers = _headers;
  }

  void setContentType(String contentType) {
    _dio.options.merge(contentType: contentType);
  }

  Dio get dio {
    return _dio;
  }

}