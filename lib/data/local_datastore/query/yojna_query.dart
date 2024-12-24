import 'package:sarkari_yojna_flutter/data/local_datastore/entities/entity_yojna.dart';

import '../../../objectbox.g.dart';

abstract class YojnaQuery {
  Future<List<YojnaEntity>> query(
    Box<YojnaEntity> yojnaBox,
  );
}

abstract class WatchableYojnaQuery {
  Stream<List<YojnaEntity>> query(
    Box<YojnaEntity> yojnaBox,
  );
}

class WatchBookmarkedYojnaQuery implements WatchableYojnaQuery {
  @override
  Stream<List<YojnaEntity>> query(Box<YojnaEntity> yojnaBox) {
    return yojnaBox
        .query()
        .order(YojnaEntity_.updated, flags: Order.descending)
        .watch(triggerImmediately: true)
        .map((e) => e.find());
  }
}

class WatchYojnaByAgeQuery implements WatchableYojnaQuery {
  final int lowerAgeLimit;
  final int upperAgeLimit;

  WatchYojnaByAgeQuery({
    required this.lowerAgeLimit,
    required this.upperAgeLimit,
  });

  @override
  Stream<List<YojnaEntity>> query(Box<YojnaEntity> yojnaBox) {
    return yojnaBox
        .query()
        .order(YojnaEntity_.updated, flags: Order.descending)
        .watch(triggerImmediately: true)
        .map((e) => e.find());
  }
}
