import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarkari_yojna_flutter/data/models/scheme_category.dart';
import 'package:sarkari_yojna_flutter/data/models/yojna.dart';
import 'package:sarkari_yojna_flutter/data/repositories/yojna_repository.dart';
import 'package:sarkari_yojna_flutter/utils/logger/logger.dart';

import 'home_screen_layout_config.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenBlocState> {
  static const tag = "HomeScreenCubit";

  final YojnaRepository yojnaRepository;
  final Logger logger;

  HomeScreenCubit({
    required this.yojnaRepository,
    required this.logger,
  }) : super(HomeScreenBlocInitial()) {
    loadYojnaData();
  }

  void loadYojnaData() async {
    logger.i(tag, "Updating Stored Yojna");

    try {
      await yojnaRepository.updateYojna(forceUpdate: false);

      _prepareHomeScreenConfigAndEmit();
    } catch (error) {
      emit(ErrorLoadingHomeScreenConfig(
          error: error.toString(), showRetry: false));

      logger.e(
        tag,
        "error updating yojna",
        error,
      );
    }
  }

  void _prepareHomeScreenConfigAndEmit() {
    //TODO generate this dynamically based on data

    final config = HomeScreenLayoutConfig(toolbarTitle: "Home", children: [
      // YojnaListItem(
      //   schemeCategory: SchemeCategory.newlyLaunched,
      //   orientation: Orientation.landscape,
      // ),
      YojnaListItem(
        schemeCategory: SchemeCategory.ageFiltered,
        orientation: Orientation.portrait,
      ),
      YojnaListItem(
        schemeCategory: SchemeCategory.bookmarked,
        orientation: Orientation.landscape,
      ),
      // YojnaListItem(
      //   schemeCategory: SchemeCategory.stateFiltered,
      //   orientation: Orientation.landscape,
      // ),
    ]);

    emit(HomeScreenContentChanged(config: config));
  }

  void handleYojnaItemClick(
      BuildContext context,
      SchemeCategory category,
      Yojna yojna,
  ){
    context.goNamed("/details",queryParameters: {
      "id" : yojna.id
    });
  }

  void handleYojnaSectionSeeAllClick(
      BuildContext context,
      SchemeCategory category,
  ){



  }
}
