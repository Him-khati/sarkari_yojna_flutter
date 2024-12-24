class SessionExpiredException implements Exception {
  String? externalMessage;
  String? get message => externalMessage ?? "Session expired, please login again";

  StackTrace? get stackTrace => null;

  SessionExpiredException({this.externalMessage});

  @override
  String toString() => externalMessage ?? "Session expired, please login again";
}
