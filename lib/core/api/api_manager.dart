import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../exceptions/network_exception.dart';
import '../network/logger_interceptor.dart';



@singleton
class ApiManager {
  late final Dio dio;
  final Logger _logger = Logger(
    level: kReleaseMode ? Level.nothing : Level.debug,
    printer: PrettyPrinter(
      methodCount: 1,
      printEmojis: true,
      colors: true,
    ),
  );

  ApiManager() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    dio.interceptors.add(LoggerInterceptor(_logger));
  }

  // ---------------- Network check ----------------
  Future<void> _checkNetwork() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      throw NetworkException();
    }
  }

  /////////// Get /////////////
  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? param,
    Map<String, dynamic>? headers,
  }) async {
    await _checkNetwork(); // <-- Network check

    return dio.get(
      endPoint,
      queryParameters: param,
      options: Options(
        headers: headers,
        validateStatus: (status) => true,
      ),
    );
  }

  ////////// Post //////////
  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    await _checkNetwork(); // <-- Network check

    return dio.post(
      endPoint,
      data: body,
      options: Options(
        headers: headers,
        validateStatus: (status) => true,
      ),
    );
  }

  ////// Delete ///////
  Future<Response> deleteData({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    await _checkNetwork(); // <-- Network check

    return dio.delete(
      endPoint,
      data: body,
      options: Options(
        headers: headers,
        validateStatus: (status) => true,
      ),
    );
  }
}
