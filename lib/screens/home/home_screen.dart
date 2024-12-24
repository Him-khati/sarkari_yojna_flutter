import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarkari_yojna_flutter/main.dart';
import 'package:sarkari_yojna_flutter/screens/home/common/vertical_list_section.dart';
import 'package:sarkari_yojna_flutter/screens/home/home_screen_cubit.dart';
import 'package:sarkari_yojna_flutter/utils/text_themes.dart';

import 'home_screen_layout_config.dart';
import 'category_wise_sections/home_screen_layout_config_to_widget_mapper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeScreenCubit(
        yojnaRepository: getIt.get(),
        logger: getIt.get()
      ),
      child: BlocBuilder<HomeScreenCubit, HomeScreenBlocState>(
          builder: (context, state) {
        switch (state) {
          case HomeScreenBlocInitial():
            return Container();
          case HomeScreenContentChanged():
            return _buildHomeWidget(
              context,
              state.config.toolbarTitle,
              state.config,
            );
          case ErrorLoadingHomeScreenConfig():
            return Text(
              state.error,
            );
        }
      }),
    );
  }

  Widget _buildHomeWidget(
    BuildContext context,
    String toolbarTitle,
    HomeScreenLayoutConfig layoutConfig,
  ) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _topBar(
            context,
            toolbarTitle,
          ),
          ...HomeScreenLayoutConfigToWidgetMapper.toWidgets(
            layoutConfig,
          )
        ],
      ),
    );
  }

  Widget _topBar(
    BuildContext context,
    String title,
  ) =>
      SliverAppBar(
        backgroundColor: Colors.white,
        title: Text(title),
        titleTextStyle: context.highlightTextTheme.headlineMedium?.copyWith(
          color: Colors.black,
          letterSpacing: 1,
        ),
        leadingWidth: 0,
        automaticallyImplyLeading: false,
        leading: const SizedBox(),
      );

  void _seeAllClicked(String sectionId) {}
}
