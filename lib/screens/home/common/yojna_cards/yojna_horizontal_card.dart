import 'package:flutter/material.dart';
import 'package:relative_time/relative_time.dart';
import 'package:sarkari_yojna_flutter/data/models/yojna.dart';
import 'package:sarkari_yojna_flutter/screens/home/common/yojna_cards/yojna_card_click_listener.dart';
import 'package:sarkari_yojna_flutter/utils/text_themes.dart';
import 'package:sarkari_yojna_flutter/widgets/image_view/sy_image.dart';

class YojnaHorizontalCard extends StatelessWidget {
  final Yojna yojna;
  final double width;
  final OnYojnaCardClick onYojnaCardClick;

  const YojnaHorizontalCard({
    super.key,
    required this.yojna,
    required this.onYojnaCardClick,
    this.width = 500,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 250,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                onYojnaCardClick(yojna);
              },
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SyImage(
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                    imageToLoadUrlOrPath: _getImagePath(),
                  ),
                  const Text("Tag"),
                  Text(yojna.title,
                  style: context.textTheme.bodyLarge,
                  ),
                  Text(
                    _getTime(context),
                    style: context.textTheme.labelSmall,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Uri _getImagePath() {
    return yojna.art ??
        Uri.parse(
          "https://t3.ftcdn.net/jpg/02/73/22/74/240_F_273227473_N0WRQuX3uZCJJxlHKYZF44uaJAkh2xLG.jpg",
        );
  }

  String _getTime(BuildContext context) {
   return "Updated ${RelativeTime(context).format(yojna.updated)}";
  }
}
