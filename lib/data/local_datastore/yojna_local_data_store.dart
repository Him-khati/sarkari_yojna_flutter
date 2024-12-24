import 'package:sarkari_yojna_flutter/data/local_datastore/entities/entity_yojna.dart';
import 'package:sarkari_yojna_flutter/data/local_datastore/query/yojna_query.dart';
import 'package:sarkari_yojna_flutter/data/models/stored_yojna_info.dart';
import 'package:sarkari_yojna_flutter/data/models/yojna.dart';

import '../../objectbox.g.dart';
import 'mappers/yojna_entity_mapper.dart';

class YojnaLocalDataStore {
  final Box<YojnaEntity> box;

  YojnaLocalDataStore({
    required this.box,
  });

  Future<void> insertYojna(
    List<Yojna> yojna,
  ) async {
    final yojnaEntities = yojna.map((author) {
      return mapToYojnaEntity(author);
    }).toList();

    await box.putManyAsync(
      yojnaEntities,
    );
  }

  Future<List<Yojna>> getYojna() async {
    final yojnaEntities = await box.getAllAsync();

    return yojnaEntities.map((yojnaEntity) {
      return mapFromYojnaEntity(yojnaEntity);
    }).toList();
  }

  Future<StoredYojnaInfo> getStoredYojnaInfo() async {
    final yojnaCount = box.count();
    if (yojnaCount == 0) {
      return StoredYojnaInfo(
        count: yojnaCount,
        lastUpdated: null,
      );
    }

    final query = box
        .query()
        .order(YojnaEntity_.updated, flags: Order.descending)
        .build();

    final lastUpdatedAt = await query.findFirstAsync();
    return StoredYojnaInfo(
      count: yojnaCount,
      lastUpdated: lastUpdatedAt?.updated,
    );
  }

  Future<List<Yojna>> getYojnaFromQuery(
      YojnaQuery query,
  ) async {
    final yojnaEntities = await query.query(box);

    return yojnaEntities.map((yojnaEntity) {
      return mapFromYojnaEntity(yojnaEntity);
    }).toList();
  }


  Stream<List<Yojna>> watchYojnaFromQuery(
      WatchableYojnaQuery query,
  )  {
    return query
        .query(box)
        .map((yojnaEntity) => mapFromYojnaEntityList(yojnaEntity));
  }
}
