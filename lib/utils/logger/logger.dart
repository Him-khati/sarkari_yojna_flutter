abstract class Logger {

  void e(
    String tag,
    String message,
    Object e, {
    StackTrace? s,
  });

  void d(
    String tag,
    String message,
  );

  void i(
    String tag,
    String message, [
    dynamic object,
  ]);

  void registerUser({
    required String uid,
    String? name,
  });

  void unregisterUser();
}
