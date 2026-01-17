// core/exceptions/network_exception.dart

class NetworkException implements Exception {
  final String message;

  NetworkException([this.message = "No internet connection"]);
}
