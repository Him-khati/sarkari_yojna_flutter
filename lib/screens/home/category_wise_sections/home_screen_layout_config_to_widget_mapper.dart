import 'package:flutter/material.dart';
import 'package:sarkari_yojna_flutter/data/models/scheme_category.dart';
import 'package:sarkari_yojna_flutter/screens/home/category_wise_sections/bookmarked/bookmarked_yojna_section.dart';
import 'package:sarkari_yojna_flutter/screens/home/category_wise_sections/newly_launched/newly_launched_yojna_section.dart';
import 'package:sarkari_yojna_flutter/screens/home/category_wise_sections/state_filtered/state_filtered_yojna_yojna_section.dart';
import 'package:sarkari_yojna_flutter/screens/home/home_screen_layout_config.dart';

import 'age_filtered/yojna_filtered_by_age_section.dart';

class HomeScreenLayoutConfigToWidgetMapper {
  static List<Widget> toWidgets(HomeScreenLayoutConfig layoutConfig) {
    return layoutConfig.children.map((childrenConfig) {
      return mapToWidget(childrenConfig);
    }).toList();
  }

  static Widget mapToWidget(HomeScreenItem childrenConfig) {
    switch (childrenConfig) {
      case YojnaListItem():
        return mapToYojnaListWidget(childrenConfig);
      case InformationBanner():
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  static Widget mapToYojnaListWidget(YojnaListItem yojnaListConfig) {
    switch(yojnaListConfig.schemeCategory){
      case SchemeCategory.bookmarked:
          return const BookmarkedYojnaSection();
      case SchemeCategory.ageFiltered:
        return const YojnaFilteredByAgeSection();
      case SchemeCategory.newlyLaunched:
        return const NewlyLaunchedYojnaSection();
      case SchemeCategory.stateFiltered:
        return const YojnaFilteredByStateSection();
    }
  }
}
