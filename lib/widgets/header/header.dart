import 'package:flutter/material.dart';
import 'package:sarkari_yojna_flutter/data/models/scheme_category.dart';
import 'package:sarkari_yojna_flutter/utils/text_themes.dart';

typedef OnHeaderSeeAllClick = void Function(SchemeCategory headerId);

class Header extends StatelessWidget {
  final SchemeCategory id;
  final String title;
  final OnHeaderSeeAllClick seeAllClick;
  final bool showSeeAllButton;

  const Header({
    super.key,
    required this.id,
    required this.title,
    required this.seeAllClick,
    this.showSeeAllButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.highlightTextTheme.labelLarge?.copyWith(
            letterSpacing: 1,
          ),
        ),
        TextButton(
            onPressed: () {
              seeAllClick(id);
            },
            child: const Text("VIEW ALL"))
      ],
    );
  }
}
