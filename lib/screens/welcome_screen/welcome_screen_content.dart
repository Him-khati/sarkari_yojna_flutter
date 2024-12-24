import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:sarkari_yojna_flutter/utils/text_themes.dart';

import '../../gen/assets.gen.dart';

class WelcomeScreenContent extends StatefulWidget {
  const WelcomeScreenContent({super.key});

  @override
  State<WelcomeScreenContent> createState() => _WelcomeScreenContentState();
}

class _WelcomeScreenContentState extends State<WelcomeScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 1),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: AspectRatio(
            aspectRatio: 1,
            child: RiveAnimation.asset(
              Assets.riveAnimations.welcomeAnimation,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        const Spacer(flex: 2),
        Text(
          "Hello and Welcome",
          style: context.highlightTextTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        const SizedBox(height: 16),
        Text(
            "We're setting things up for you. This will only take a moment.",
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge),
        const Spacer(flex: 2),
      ],
    );
  }
}
