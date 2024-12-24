import 'package:flutter/material.dart';
import 'package:sarkari_yojna_flutter/data/models/yojna.dart';
import 'package:sarkari_yojna_flutter/screens/home/common/yojna_cards/yojna_card_click_listener.dart';
import 'package:sarkari_yojna_flutter/widgets/image_view/sy_image.dart';

class YojnaVerticalCard extends StatelessWidget {
  final Yojna yojna;
  final OnYojnaCardClick onYojnaCardClick;

  const YojnaVerticalCard({
    super.key,
    required this.yojna,
    required this.onYojnaCardClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(children: [
          SyImage(
            height: 80,
            fit: BoxFit.cover,
            imageToLoadUrlOrPath: _getImagePath(),
          ),
        ]),
      ),
    );
  }

  Uri _getImagePath() {
    return yojna.art ??
        Uri.parse(
          "https://t3.ftcdn.net/jpg/02/73/22/74/240_F_273227473_N0WRQuX3uZCJJxlHKYZF44uaJAkh2xLG.jpg",
        );
  }
}
