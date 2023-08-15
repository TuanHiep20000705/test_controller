import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  static String baseUrl = 'https://flutter-prep-f5f13-default-rtdb.firebaseio.com/';

  static ApiClient? _instanceEC;

  static ApiClient get instanceEC {
    _instanceEC = ApiClient._init();
    return _instanceEC!;
  }

  late final Dio dio;

  ApiClient._init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30)
      )
    )..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 100
    ));
  }

  Future<Response> get(String path) async {
    try {
      return await dio.get(path,
      options: Options(headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      })
      );
    } on DioException catch(e) {
      final errorMessage = throw 'get list fail.';
    }
  }
}