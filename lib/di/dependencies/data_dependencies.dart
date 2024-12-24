import 'package:get_it/get_it.dart';
import 'package:sarkari_yojna_flutter/data/repositories/tag_repository.dart';
import 'package:sarkari_yojna_flutter/data/repositories/yojna_repository.dart';

GetIt registerDataDependencies(GetIt getIt) => getIt
  ..registerLazySingleton<YojnaRepository>(() => YojnaRepository(
        logger: getIt.get(),
        yojnaLocalDataStore: getIt.get(),
        yojnaRemoteDataStore: getIt.get(),
      ))
  ..registerLazySingleton<TagRepository>(
    () => TagRepository(),
  );
