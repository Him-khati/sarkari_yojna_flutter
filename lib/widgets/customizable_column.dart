import 'package:flutter/material.dart';

class CustomizableColumn extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double spacing;
  final EdgeInsets? padding;

  const CustomizableColumn({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spacing = 0 ,
    this.padding,
  });

  Widget _generate() {
    final column = Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      spacing: spacing,
      children: children,
    );

    if (padding != null) {
      return Padding(
          padding: padding!,
          child: column,
      );
    } else {
      return column;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _generate();
  }
}
