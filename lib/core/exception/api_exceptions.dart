abstract class ApiException implements Exception {}

class InvalidUri extends ApiException {}

class TimeOut extends ApiException {}

class NetworkException extends ApiException {}

class ResponseException extends ApiException {}
