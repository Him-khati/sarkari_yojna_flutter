class NetworkingException implements Exception {
  String? get message => "Unable to reach server, Check internet connection";
  StackTrace? get stackTrace => null;
  const NetworkingException();
  @override
  String toString() => "Unable to reach server, Check internet connection";
}
