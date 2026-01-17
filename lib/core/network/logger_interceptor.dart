import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  final Logger logger;

  LoggerInterceptor(this.logger);

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) {
    logger.i(
      '➡️ REQUEST\n'
          '${options.method} ${options.uri}\n'
          'Headers: ${options.headers}\n'
          'Query: ${options.queryParameters}\n'
          'Body: ${options.data}',
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
      Response response,
      ResponseInterceptorHandler handler,
      ) {
    logger.d(
      '✅ RESPONSE\n'
          '${response.requestOptions.uri}\n'
          'Status: ${response.statusCode}\n'
          'Data: ${response.data}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) {
    logger.e(
      '❌ ERROR\n'
          '${err.requestOptions.uri}\n'
          'Message: ${err.message}\n'
          'Response: ${err.response?.data}',
      error: err,
      stackTrace: err.stackTrace,
    );
    super.onError(err, handler);
  }
}
