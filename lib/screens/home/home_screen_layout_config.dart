import 'package:flutter/material.dart';

import '../../data/models/scheme_category.dart';

class HomeScreenLayoutConfig {
  final String toolbarTitle;
  final List<HomeScreenItem> children;

  HomeScreenLayoutConfig({
    required this.toolbarTitle,
    required this.children,
  });
}

sealed class HomeScreenItem {}

class YojnaListItem extends HomeScreenItem {
  final Orientation orientation;
  final SchemeCategory schemeCategory;

  YojnaListItem({
    required this.orientation,
    required this.schemeCategory,
  });
}

class InformationBanner extends HomeScreenItem {}
