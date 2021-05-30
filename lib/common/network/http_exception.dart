class HttpException implements Exception {
  final String message;
  final int statusCode;

  HttpException(this.message, this.statusCode);

  static bool isNotFoundHttpException(final Object error) =>
      (error is HttpException && error.statusCode == 404);
}
