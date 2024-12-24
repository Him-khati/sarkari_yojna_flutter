import 'package:flutter/material.dart';

class SyZoomableView extends StatelessWidget {
  final Widget child;

  const SyZoomableView({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
        panEnabled: true,
        child: child,
    );
  }
}
