import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/no_internet_provider.dart';
import 'package:ween_blaqe/view/no_internet_feature/no_internet_widgets/total_text_widgets/total_animated_text_widget.dart';

class TotalTextWidget extends ConsumerWidget {
  const TotalTextWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
        bool isAnimate = ref.read(isAnimateProvider.notifier).state;

    return AnimatedAlign(
      duration: const Duration(milliseconds: 2900),
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            isAnimate
                ? const SizedBox(
                    height: 28,
                    child: TotalAnimatedTextWidget(),
                  )
                : const TotalTextWithoutAnimate()
          ],
        ),
      ),
    );
  }
}
class TotalTextWithoutAnimate extends ConsumerWidget {
  const TotalTextWithoutAnimate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
        int total = ref.read(totalProvider.notifier).state;

    return Text("$total+",
                    style: TextStyle(
                      color: ref
                          .read(themeModeNotifier.notifier)
                          .primaryTheme(ref: ref),
                    ));
  }
}