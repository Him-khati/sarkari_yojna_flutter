import 'package:flutter/material.dart';
import 'package:sarkari_yojna_flutter/data/models/yojna.dart';
import 'package:sarkari_yojna_flutter/screens/yojna_list_common/yojna_list_layout_type.dart';
import 'package:sarkari_yojna_flutter/utils/text_themes.dart';

typedef YojnaContainerSeeAllClickListener = void Function(String sectionId);

class YojnaList extends StatelessWidget {
  final String sectionId;
  final String title;
  final YojnaListLayoutType layoutType;
  final YojnaContainerSeeAllClickListener seeAllClickListener;
  final List<Yojna> yojna;

  const YojnaList({
    super.key,
    required this.sectionId,
    required this.title,
    required this.yojna,
    required this.seeAllClickListener,
    this.layoutType = YojnaListLayoutType.horizontalScrollingCardsListLayout,
  });

  Widget _yojnaListCardTitle(
    BuildContext context,
  ) =>
      Column(
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.highlightTextTheme.headlineMedium
                    ?.copyWith(color: Colors.black, letterSpacing: 1),
              ),
              TextButton(
                  onPressed: () => seeAllClickListener(sectionId),
                  child: const Text("Show All"))
            ],
          ),
          buildList(
            context,
          )
        ],
      );


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _yojnaListCardTitle(context),
      ],
    );
  }

  Widget buildList(
    BuildContext context,
  ) {
    if (YojnaListLayoutType.verticalCardListLayout == layoutType) {
      return _buildVerticalYojnaList(context);
    } else {
      return _buildHorizontalYojnaList(
        context,
      );
    }
  }

  Widget _buildVerticalYojnaList(
    BuildContext context,
  ) {

    final children = yojna.map((yojna){
      return _buildVerticalYojnaListItem(context);
    }).toList();

    return SizedBox(
      height: 200,
      child: ListView(
        shrinkWrap: true,
        children: children,
      ),
    );
  }

  Widget _buildHorizontalYojnaList(
    BuildContext context,
  ) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemBuilder: _buildHorizontalYojnaItem,
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
      ),
    );
  }

  Widget _buildVerticalYojnaListItem(
    BuildContext context,
  ) {
    return const Card(
      child: Column(
        children: [
          Text("Hello"),
          Text("Hello 2"),
          Text("Hello def"),
          Text("Hello peded"),
        ],
      ),
    );
  }

  Widget _buildHorizontalYojnaItem(BuildContext context, int index) {
    return const Card(
      child: Column(
        children: [
          Text("Hello"),
          Text("Hello 2"),
          Text("Hello def"),
          Text("Hello peded"),
        ],
      ),
    );
  }
}
