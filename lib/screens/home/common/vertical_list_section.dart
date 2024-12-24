import 'package:flutter/material.dart';
import 'package:sarkari_yojna_flutter/data/models/scheme_category.dart';
import 'package:sarkari_yojna_flutter/screens/home/common/yojna_cards/yojna_card_click_listener.dart';
import 'package:sarkari_yojna_flutter/screens/home/common/yojna_cards/yojna_vertical_card.dart';

import '../../../data/models/yojna.dart';
import '../../../widgets/header/header.dart';

class YojnaVerticalListSection extends StatelessWidget {
  final SchemeCategory id;
  final String title;
  final List<Yojna> items;
  final OnHeaderSeeAllClick onHeaderSeeAllClick;
  final OnYojnaCardClick onYojnaCardClick;

  const YojnaVerticalListSection({
    super.key,
    required this.id,
    required this.title,
    required this.items,
    required this.onHeaderSeeAllClick,
    required this.onYojnaCardClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Header(
            id: id,
            title: title,
            seeAllClick: onHeaderSeeAllClick,
          ),
        ),
        ..._addYojnaItems()
      ],
    );
  }

  Iterable<YojnaVerticalCard> _addYojnaItems() {
   return  items.map((yojna) {
      return YojnaVerticalCard(
        yojna: yojna,
        onYojnaCardClick: onYojnaCardClick,
      );
    });
  }
}
