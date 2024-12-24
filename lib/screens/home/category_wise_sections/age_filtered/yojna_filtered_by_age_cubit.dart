import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sarkari_yojna_flutter/data/models/scheme_category.dart';
import 'package:sarkari_yojna_flutter/data/models/yojna.dart';
import 'package:sarkari_yojna_flutter/data/repositories/yojna_repository.dart';
import 'package:sarkari_yojna_flutter/screens/home/category_wise_sections/common/yojna_state.dart';

class YojnaFilteredByAgeCubit extends Cubit<YojnaState> {
  final YojnaRepository yojnaRepository;
  StreamSubscription? watchBookmarkedYojnaSubscription;

  YojnaFilteredByAgeCubit({
    required this.yojnaRepository,
  }) : super(YojnaLoadingInitialState()) {
    _startListeningBookmarkedYojna();
  }

  void _startListeningBookmarkedYojna() {
    watchBookmarkedYojnaSubscription = yojnaRepository
            .watchBookmarkedYojna()
            .listen(_processReceivedYojna);
  }

  void _processReceivedYojna(
    List<Yojna> yojna,
  ) {
    emit(YojnaListChanged(
      sectionId: SchemeCategory.ageFiltered,
      title: "Yojna for Your Age Group",
      yojna: yojna,
    ));
  }

  @override
  Future<void> close() {
    watchBookmarkedYojnaSubscription?.cancel();
    watchBookmarkedYojnaSubscription = null;

    return super.close();
  }
}
