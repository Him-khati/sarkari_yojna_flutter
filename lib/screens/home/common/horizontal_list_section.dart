import 'package:flutter/material.dart';
import 'package:sarkari_yojna_flutter/data/models/scheme_category.dart';
import 'package:sarkari_yojna_flutter/data/models/yojna.dart';
import 'package:sarkari_yojna_flutter/screens/home/common/yojna_cards/yojna_card_click_listener.dart';
import 'package:sarkari_yojna_flutter/screens/home/common/yojna_cards/yojna_horizontal_card.dart';
import 'package:sarkari_yojna_flutter/widgets/header/header.dart';


class YojnaHorizontalListSection extends StatelessWidget {
  final SchemeCategory id;
  final String title;
  final List<Yojna> items;
  final OnHeaderSeeAllClick onHeaderSeeAllClick;
  final OnYojnaCardClick onYojnaCardClick;

  const YojnaHorizontalListSection({
    super.key,
    required this.id,
    required this.title,
    required this.items,
    required this.onHeaderSeeAllClick,
    required this.onYojnaCardClick
  });

  @override
  Widget build(BuildContext context) {
    const double width = 150;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(
          id: id,
          title: title,
          seeAllClick: onHeaderSeeAllClick,
        ),
        SizedBox(
          height: 250.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return YojnaHorizontalCard(
                yojna: items[index],
                width: width,
                onYojnaCardClick: onYojnaCardClick,
              );
            },
          ),
        ),
      ],
    );
  }
}
