import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sarkari_yojna_flutter/data/remote_datastore/yojna_remote_data_store.dart';
import 'package:sarkari_yojna_flutter/utils/networking/networking_util.dart';

import '../../utils/networking/dio_utils.dart';
import '../../utils/networking/url_helper.dart';

GetIt registerRemoteDependencies(GetIt getIt) => getIt
  ..registerLazySingleton<UrlHelper>(() => UrlHelper())
  ..registerSingletonAsync<Dio>(() => DioFactory().createDioInstance())
  ..registerLazySingleton<NetworkingUtil>(() => NetworkingUtil(
        baseUrl: "https://674f3073721b13871ccc.appwrite.global",
        urlHelper: getIt.get(),
        dio: getIt.get(),
        logger: getIt.get(),
      ))
  ..registerLazySingleton<YojnaRemoteDataStore>(() => YojnaRemoteDataStore(
    networkingUtil: getIt.get()
  ));
