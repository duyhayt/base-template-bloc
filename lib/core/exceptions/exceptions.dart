class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => "NetworkException: $message";
}

class ServerException implements Exception {
  final String message;

  ServerException(this.message);

  @override
  String toString() => message;
}

class DioExceptions implements Exception {
  final String message;

  DioExceptions(this.message);

  @override
  String toString() => message;
}