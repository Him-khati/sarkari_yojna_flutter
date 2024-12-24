import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarkari_yojna_flutter/data/models/scheme_category.dart';
import 'package:sarkari_yojna_flutter/data/models/yojna.dart';
import 'package:sarkari_yojna_flutter/main.dart';
import 'package:sarkari_yojna_flutter/screens/home/category_wise_sections/age_filtered/yojna_filtered_by_age_cubit.dart';
import 'package:sarkari_yojna_flutter/screens/home/common/horizontal_list_section.dart';
import 'package:sarkari_yojna_flutter/screens/home/common/vertical_list_section.dart';

import '../../home_screen_cubit.dart';
import '../common/yojna_state.dart';

class YojnaFilteredByAgeSection extends StatelessWidget {
  const YojnaFilteredByAgeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (_) => YojnaFilteredByAgeCubit(yojnaRepository: getIt.get()),
        child: BlocBuilder<YojnaFilteredByAgeCubit, YojnaState>(
          builder: (context, state) {
            final homeScreenCubit = context.read<HomeScreenCubit>();
      
            switch (state) {
              case YojnaLoadingInitialState():
                return Container();
              case YojnaListChanged():
                return YojnaVerticalListSection(
                  id: state.sectionId,
                  title: state.title,
                  items: state.yojna,
                  onHeaderSeeAllClick: (category) {
                    onHeaderSeeAllClick(
                      context,
                      homeScreenCubit,
                      category,
                    );
                  },
                  onYojnaCardClick: (yojna) {
                    onYojnaCardClick(
                      context,
                      homeScreenCubit,
                      yojna,
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }

  void onHeaderSeeAllClick(
    BuildContext context,
    HomeScreenCubit cubit,
    SchemeCategory sectionCategory,
  ) => cubit.handleYojnaSectionSeeAllClick(
        context,
        SchemeCategory.ageFiltered,
      );

  void onYojnaCardClick(
    BuildContext context,
    HomeScreenCubit cubit,
    Yojna yojna,
  ) => cubit.handleYojnaItemClick(
        context,
        SchemeCategory.ageFiltered,
        yojna,
      );
}
