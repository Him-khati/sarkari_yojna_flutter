import 'package:equatable/equatable.dart';
import 'package:sarkari_yojna_flutter/data/models/yojna.dart';

import '../../../../data/models/scheme_category.dart';

sealed class YojnaState extends Equatable {
  const YojnaState();
}

final class YojnaLoadingInitialState extends YojnaState {
  @override
  List<Object> get props => [];
}

final class YojnaListChanged extends YojnaState {
  final SchemeCategory sectionId;
  final String title;
  final List<Yojna> yojna;

  const YojnaListChanged({
    required this.sectionId,
    required this.title,
    required this.yojna,
  });

  @override
  List<Object?> get props => [sectionId,title,yojna];
}
