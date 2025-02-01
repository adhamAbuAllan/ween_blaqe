import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/no_internet_provider.dart';

class SebhaCarouselSliderWidget extends ConsumerWidget {
  const SebhaCarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> sephaText = ref.read(sephaTextProvider.notifier).state;


    return CarouselSlider(
      items: sephaText.asMap().entries.map((entry) {
        return Builder(builder: (BuildContext context) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            ref.watch(indexProvider.notifier).state = entry.key;
          });
          // ref.read(indexProvider.notifier).state = entry.key;
          debugPrint(entry.value);
          return Align(
              alignment: Alignment.center,
              child: Text(
                entry.value,
                style: TextStyle(
                  fontSize: 24,
                  color:
                      ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                ),
              ));
        });
      }).toList(),
      controller: ref.watch(carouselSliderControllerProvider.notifier).state,
      options: CarouselOptions(scrollDirection: Axis.vertical, height: 50),
    );
  }
}
