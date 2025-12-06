class AppException implements Exception {
  final _message;
  final _prefix;

  AppException(this._message, [this._prefix]);

  @override
  String toString() {
    return '$_message $_prefix';
  }
}

class fetchDataException extends AppException {
  fetchDataException([String? message])
      : super(message, "Error During Communication");
}

class BadRequestException extends AppException {
  BadRequestException([String ? message]) 
      : super(message, "Invalid Request");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String ? message]) 
      : super(message, "Unauthorised Request");
}

class InvalidInputException extends AppException {
  InvalidInputException([String ? message]) 
      : super(message, "Invalid Input");
}

class NoInternetException extends AppException {
  NoInternetException([String ? message]) 
      : super(message, "No Internet Connection");
}