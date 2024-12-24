import 'package:flutter/material.dart';
import 'package:sarkari_yojna_flutter/utils/text_themes.dart';
import 'package:sarkari_yojna_flutter/widgets/customizable_column.dart';
import 'package:sarkari_yojna_flutter/widgets/image_view/sy_image.dart';
import 'package:sarkari_yojna_flutter/widgets/shadow_widget.dart';

class YojnaDetailsScreen extends StatelessWidget {
  const YojnaDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomizableColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(
                context,
                "#3 Design thinking - Ideate Phase and Wireframing",
              ),
              _buildUpdatedAt(context, DateTime.now()),
              // _buildAuthorAndUpdatedTime(
              //   context,
              //   "Author",
              // ),
              _buildYojnaArt(
                  context,
                  Uri.parse(
                      "https://t3.ftcdn.net/jpg/02/73/22/74/240_F_273227473_N0WRQuX3uZCJJxlHKYZF44uaJAkh2xLG.jpg")),
              _buildContent(
                context,
                "Ideation is a creation procesdededed dededededed dedededed dededs",
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(
    BuildContext context,
    String s,
  ) {
    return Text(
      s,
      style: context.highlightTextTheme.headlineLarge,
    );
  }

  Widget _buildUpdatedAt(
    BuildContext context,
    DateTime updateTime,
  ) =>
      Text(
        "Updated 3 Days Ago",
        style: context.highlightTextTheme.bodySmall,
      );

  // Widget _buildAuthorAndUpdatedTime(
  //   BuildContext context,
  //   String s,
  // ) {
  //   return Text(s);
  // }

  Widget _buildYojnaArt(
    BuildContext context,
    Uri s,
  ) {
    final screenSize = MediaQuery.sizeOf(context).height;
    final artHeight = screenSize * 0.3;

    return ShadowWidget(
      child: SyImage(
        imageToLoadUrlOrPath: s,
        width: double.infinity,
        height: artHeight,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    String s,
  ) {
    return Text(
      s,
      style: context.highlightTextTheme.bodyLarge?.copyWith(height: 1.5),
    );
  }
}
