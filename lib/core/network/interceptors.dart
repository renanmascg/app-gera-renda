import 'package:dio/dio.dart';

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    print(
        'Request ${options.method} -> Path: ${options.baseUrl} ${options.path} : ${options.data.toString()} - ${options.headers.toString()}');
    
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print(
        'Response ${response.statusCode} -> Path: ${response.request.path} response: ${response.data.toString()}');
    
    return super.onResponse(response);
  }

  @override
  Future onError(DioError error) {
    print(
        'Error ${error?.response?.statusCode} - ${error?.response?.statusMessage} -> Path: ${error?.request?.path}');
    
    return super.onError(error);
  }
}
