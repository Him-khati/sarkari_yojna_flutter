import 'package:sarkari_yojna_flutter/data/models/yojna.dart';
import 'package:sarkari_yojna_flutter/utils/networking/networking_util.dart';

import 'models/get_yojna_list_response.dart';

class YojnaRemoteDataStore {
  final NetworkingUtil networkingUtil;

  YojnaRemoteDataStore({
    required this.networkingUtil,
  });

  Future<List<Yojna>> getYojna({required DateTime? lastUpdated}) async {
    final response = await networkingUtil.get(
        "/fetch_yojnas",
        getYojnaResponseFromJson,
    );

    return response.yojna.documents;
  }
}
