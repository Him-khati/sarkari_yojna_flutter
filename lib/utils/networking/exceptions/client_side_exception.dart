class ClientSideException implements Exception {
  final String error;
  final StackTrace? st;

  ClientSideException(
      this.error,
      this.st
  );

  @override
  String toString() => error;

  String? get message => error;
  StackTrace? get stackTrace => st;
}
