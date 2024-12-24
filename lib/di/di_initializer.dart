import 'package:get_it/get_it.dart';

import 'dependencies/base_dependencies.dart';
import 'dependencies/data_dependencies.dart';
import 'dependencies/local_data_dependencies.dart';
import 'dependencies/remote_dependencies.dart';

/// Depedendencies Heirarchy
///
/// Base Dependencies
/// Util dependencies
/// Data Dependencies

class DiInitializer {
  static Future<void> initializeDI(
    GetIt getIt,
  ) async {
    registerBaseDependencies(getIt);
    registerRemoteDependencies(getIt);
    await registerLocalStorageDependencies(getIt);
    registerDataDependencies(getIt);
  }
}

