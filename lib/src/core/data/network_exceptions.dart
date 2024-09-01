class RestApiException implements Exception {
  const RestApiException([this.errorCode, this.errorMessage]);
  final int? errorCode;
  final String? errorMessage;
}
