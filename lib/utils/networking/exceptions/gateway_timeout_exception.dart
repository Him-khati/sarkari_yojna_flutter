class GatewayTimeOutException implements Exception {
  final String error;
  final StackTrace? st;

  GatewayTimeOutException(
      this.error,
      this.st
  );

  @override
  String toString() => error;

  String? get message => error;
  StackTrace? get stackTrace => st;
}
