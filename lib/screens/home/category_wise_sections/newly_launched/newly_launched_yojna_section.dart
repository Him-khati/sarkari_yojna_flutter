
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarkari_yojna_flutter/data/models/scheme_category.dart';
import 'package:sarkari_yojna_flutter/data/models/yojna.dart';
import 'package:sarkari_yojna_flutter/screens/home/common/horizontal_list_section.dart';

import '../common/yojna_state.dart';
import 'newly_launched_yojna_bloc.dart';

class NewlyLaunchedYojnaSection extends StatelessWidget {
  const NewlyLaunchedYojnaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewlyLaunchedYojnaBloc(),
      child: BlocBuilder<NewlyLaunchedYojnaBloc, YojnaState>(
        builder: (context, state) {
          switch (state) {
            case YojnaLoadingInitialState():
              return Container();
            case YojnaListChanged():
              return YojnaHorizontalListSection(
                id: state.sectionId,
                title: state.title,
                items: state.yojna,
                onHeaderSeeAllClick: onHeaderSeeAllClick,
                onYojnaCardClick: onYojnaCardClick,
              );
          }
        },
      ),
    );
  }

  void onHeaderSeeAllClick(SchemeCategory headerId) {
  }

  void onYojnaCardClick(Yojna yojna) {

  }
}
