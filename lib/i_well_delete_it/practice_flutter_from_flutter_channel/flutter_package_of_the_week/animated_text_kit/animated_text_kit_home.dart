// import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextKitHome extends StatelessWidget {
  const AnimatedTextKitHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(

        child: AnimatedTextKit(animatedTexts: [
          FadeAnimatedText("and that "),

        ],)),);
  }
}
