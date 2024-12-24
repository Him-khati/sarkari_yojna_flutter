class InternalServerErrorException implements Exception {
  String? get message =>
      "Some internal server while processing your request, please try again later";
  StackTrace? get stackTrace => null;
  const InternalServerErrorException();
  @override
  String toString() => "Some internal server while processing your request, please try again later";
}
