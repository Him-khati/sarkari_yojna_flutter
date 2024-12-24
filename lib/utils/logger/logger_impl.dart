
import 'dart:developer';

import 'package:sarkari_yojna_flutter/utils/logger/logger.dart';

class LoggerImpl extends Logger{

  @override
  void d(String tag, String message) {
    log(
        "[Debug] $tag : $message"
    );
  }

  @override
  void e(String tag, String message, Object e, {StackTrace? s}) {
    log(
      "[Error] $tag : $message",
      error: e,
      stackTrace: s
    );
  }

  @override
  void i(String tag, String message, [object]) {
    log(
        "[Info] $tag : $message"
    );
  }

  @override
  void registerUser({required String uid, String? name}) {
    // TODO: implement registerUser
  }

  @override
  void unregisterUser() {
    // TODO: implement unregisterUser
  }

}