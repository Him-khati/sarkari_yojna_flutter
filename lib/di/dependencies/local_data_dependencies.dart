import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sarkari_yojna_flutter/data/local_datastore/authors_data_store.dart';
import 'package:sarkari_yojna_flutter/data/local_datastore/tag_local_data_store.dart';
import 'package:sarkari_yojna_flutter/data/local_datastore/yojna_local_data_store.dart';
import 'package:sarkari_yojna_flutter/utils/networking/networking_util.dart';

import '../../objectbox.g.dart';
import '../../utils/networking/dio_utils.dart';
import '../../utils/networking/url_helper.dart';

Future<Store> openLocalDbStore() async {
  final path = await getApplicationDocumentsDirectory();
  return openStore(directory: path.path);
}

Future<void> registerLocalStorageDependencies(GetIt getIt) async {
  final store = await openLocalDbStore();
  getIt
    ..registerSingleton(store)
    ..registerLazySingleton<YojnaLocalDataStore>(() {
      Store store = getIt.get();
      return YojnaLocalDataStore(box: store.box());
    })
    ..registerLazySingleton<TagLocalDataStore>(() {
      Store store = getIt.get();
      return TagLocalDataStore(box: store.box());
    })
    ..registerLazySingleton<AuthorsLocalDataStore>(() {
      Store store = getIt.get();
      return AuthorsLocalDataStore(box: store.box());
    });
}
