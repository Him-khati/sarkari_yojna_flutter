import 'package:sarkari_yojna_flutter/data/local_datastore/yojna_local_data_store.dart';
import 'package:sarkari_yojna_flutter/data/local_datastore/query/yojna_query.dart';
import 'package:sarkari_yojna_flutter/data/models/yojna.dart';
import 'package:sarkari_yojna_flutter/data/remote_datastore/yojna_remote_data_store.dart';
import 'package:sarkari_yojna_flutter/utils/logger/logger.dart';

class YojnaRepository {
  static const tag = "YojnaRepository";

  final YojnaLocalDataStore _yojnaLocalDataStore;
  final YojnaRemoteDataStore _yojnaRemoteDataStore;
  final Logger _logger;

  YojnaRepository({
    required YojnaLocalDataStore yojnaLocalDataStore,
    required YojnaRemoteDataStore yojnaRemoteDataStore,
    required Logger logger,
  })  : _yojnaLocalDataStore = yojnaLocalDataStore,
        _yojnaRemoteDataStore = yojnaRemoteDataStore,
        _logger = logger;

  Future<void> updateYojna({
    bool forceUpdate = false,
  }) async {
    final storeYojna = await _yojnaLocalDataStore.getStoredYojnaInfo();

    final cachedYojnaCountZero = storeYojna.count == 0;
    final storedYojnaCacheNotValid = !_isCacheValid(storeYojna.lastUpdated);

    final willUpdateYojna =
        forceUpdate || cachedYojnaCountZero || storedYojnaCacheNotValid;

    if (!willUpdateYojna) {
      _logger.i(
        tag,
        '''Will Not Update Cached Yojna, 
      forceUpdate =$forceUpdate, 
      cachedYojnaCountZero =$cachedYojnaCountZero, 
      storedYojnaCacheNotValid =$storedYojnaCacheNotValid''',
      );
      return;
    }

    await _updateCachedYojna(storeYojna.lastUpdated);
  }

  Future<void> _updateCachedYojna(
    DateTime? lastUpdated,
  ) async {
    final yojna = await _yojnaRemoteDataStore.getYojna(
      lastUpdated: lastUpdated,
    );

    _logger.d(tag, "Received ${yojna.length} from Server");
    await _yojnaLocalDataStore.insertYojna(yojna);
  }

  bool _isCacheValid(DateTime? lastUpdated) {
    if (lastUpdated == null) return false;

    final now = DateTime.now();
    final sevenDaysAfter = now.add(const Duration(days: 7));
    return lastUpdated.isBefore(sevenDaysAfter);
  }

  Stream<List<Yojna>> watchBookmarkedYojna({
    int limit = 8,
  }) {
    return _yojnaLocalDataStore
        .watchYojnaFromQuery(WatchBookmarkedYojnaQuery())
        .take(limit);
  }

  Stream<List<Yojna>> watchAgeFilteredYojna({
    int limit = 2,
  }) {
    return _yojnaLocalDataStore
        .watchYojnaFromQuery(WatchBookmarkedYojnaQuery())
        .take(limit);
  }
}
