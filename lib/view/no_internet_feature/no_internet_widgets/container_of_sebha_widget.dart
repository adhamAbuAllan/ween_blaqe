
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/view/no_internet_feature/no_internet_widgets/sebha_carousel_slider_widget.dart';

class ContainerOfSebhaWidget extends ConsumerWidget {
  const ContainerOfSebhaWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(7)),
          border: Border.all(
            width: 1,
            color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
          )),
      height: 100,
      child: const SebhaCarouselSliderWidget(),
    );
  }
}

