import 'package:get_it/get_it.dart';
import 'package:sarkari_yojna_flutter/utils/logger/logger.dart';
import 'package:sarkari_yojna_flutter/utils/logger/logger_impl.dart';

GetIt registerBaseDependencies(GetIt getIt) => getIt
  ..registerSingleton<Logger>(
    LoggerImpl(),
  );
