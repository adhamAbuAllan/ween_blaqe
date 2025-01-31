import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/no_internet_provider.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/elevated_button_widget.dart';
import 'package:ween_blaqe/view/no_internet_feature/no_internet_ui.dart';

class ElevatedButtonSebhaWidget extends ConsumerStatefulWidget {
  const ElevatedButtonSebhaWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ElevatedButtonSebhaWidgetState();
}

class _ElevatedButtonSebhaWidgetState
    extends ConsumerState<ElevatedButtonSebhaWidget> {
  @override
  Widget build(BuildContext context) {
    bool isAnimate = ref.watch(isAnimateProvider.notifier).state;
    bool isFirstAnimate = ref.watch(isFirstAnimateProvider.notifier).state;
    int onLongPressCounter =
        ref.watch(onLongPressCounterProvider.notifier).state;
    var controller = ref.read(carouselSliderControllerProvider.notifier).state;
    int index = ref.watch(indexProvider.notifier).state;
    List<String> sephaText = ref.watch(sephaTextProvider.notifier).state;
    return ElevatedButtonWidget(
        onLongPress: () {
          setState(() {
            ref.watch(isLongPressProvider.notifier).state = true;
            onLongPressCounter++;
            controller.animateToPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
                onLongPressCounter);
            debugPrint("longPressCounter = $onLongPressCounter");
          });
          Duration(milliseconds: onLongPressCounter);
          Vibration.vibrate(duration: onLongPressCounter);
          setState(() {
            ref.watch(sephaCounterProvider.notifier).state++;
          });
        },
        onPressed: () {
          setState(() {
            ref.watch(noInternetNotfierProvider.notifier).onPressSebha(
                ref: ref,
                index: index,
                onLongPressCounter: onLongPressCounter,
                sephaText: sephaText,
                isAnimate: isAnimate,
                isFirstAnimate: isFirstAnimate,
                controller: controller);
          });
        },
        context: context,
        child: Text(
          SetLocalization.of(context)!.getTranslateValue("tasbih"),
          style: TextStyle(color: Colors.white.withOpacity(.95)),
        ));
  }
}
