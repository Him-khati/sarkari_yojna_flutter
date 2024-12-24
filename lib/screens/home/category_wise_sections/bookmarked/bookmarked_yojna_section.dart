import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarkari_yojna_flutter/data/models/scheme_category.dart';
import 'package:sarkari_yojna_flutter/data/models/yojna.dart';
import 'package:sarkari_yojna_flutter/main.dart';
import 'package:sarkari_yojna_flutter/screens/home/common/horizontal_list_section.dart';
import 'package:sarkari_yojna_flutter/utils/logger/logger.dart';

import '../../home_screen_cubit.dart';
import '../common/yojna_state.dart';
import 'bookmarked_yojna_bloc.dart';

class BookmarkedYojnaSection extends StatelessWidget {
  const BookmarkedYojnaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (_) => BookmarkedYojnaCubit(
          yojnaRepository: getIt.get(),
        ),
        child: BlocBuilder<BookmarkedYojnaCubit, YojnaState>(
          builder: (context, state) {
            final homeScreenCubit = context.read<HomeScreenCubit>();

            switch (state) {
              case YojnaLoadingInitialState():
                return Container();
              case YojnaListChanged():
                return YojnaHorizontalListSection(
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
    SchemeCategory.bookmarked,
  );

  void onYojnaCardClick(
    BuildContext context,
    HomeScreenCubit cubit,
    Yojna yojna,
  ) => cubit.handleYojnaItemClick(
        context,
        SchemeCategory.bookmarked,
        yojna,
  );
}
