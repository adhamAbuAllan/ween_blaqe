import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/no_internet_provider.dart';

class TotalAnimatedTextWidget extends ConsumerStatefulWidget {
  const TotalAnimatedTextWidget({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends ConsumerState<TotalAnimatedTextWidget> {
  @override
  Widget build(BuildContext context) {
    bool isAnimate = ref.read(isAnimateProvider.notifier).state;
    int total = ref.read(totalProvider.notifier).state;
    return AnimatedTextKit(
      totalRepeatCount: 3,
      pause: Duration.zero,
      onFinished: () {
        setState(() {
          isAnimate = false;
        });
      },
      //aniatedTextOfCounter
      animatedTexts: [
        FadeAnimatedText(
          "$total+",
          textStyle: TextStyle(
              color:
                  ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref)),
          duration: const Duration(
            milliseconds: 100,
          ),
        ),
      ],
    );
  }
}
