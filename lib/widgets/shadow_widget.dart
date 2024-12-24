
import 'package:flutter/material.dart';

class ShadowWidget extends StatelessWidget {
  final Widget child;
  final BoxShadow? shadow;
  final BoxShape? shape;
  final BorderRadiusGeometry? radius;

  const ShadowWidget({
    super.key,
    required this.child,
    this.shadow,
    this.shape,
    this.radius
  });

  BoxShadow get defaultShadow => BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 1,
    blurRadius: 5,
    offset: const Offset(0, 3), // changes position of shadow
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: shape ?? BoxShape.rectangle,
        borderRadius: radius,
        boxShadow: [
          shadow ?? defaultShadow
        ],
      ),
      child: child,
    );
  }


}
