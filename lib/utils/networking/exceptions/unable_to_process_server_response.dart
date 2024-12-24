/// is thrown when app is unable to parse Json received from server
class UnableToProcessServerResponse implements Exception {
  String? get message => "Unable to process server response";
  StackTrace? get stackTrace => null;
  const UnableToProcessServerResponse();
  @override
  String toString() => "Unable to process server response";
}
