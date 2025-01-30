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
    bool isAnimate = ref.read(isAnimateProvider.notifier).state;
    bool isFirstAnimate = ref.read(isFirstAnimateProvider.notifier).state;
    int total = ref.read(totalProvider.notifier).state;
    int onLongPressCounter =
        ref.read(onLongPressCounterProvider.notifier).state;
    CarouselSliderController controller =
        ref.read(carouselSliderControllerProvider.notifier).state;
    int index = ref.watch(indexProvider.notifier).state;
    List<String> sephaText = ref.read(sephaTextProvider.notifier).state;
    return ElevatedButtonWidget(
        onLongPress: () {
          setState(() {
            ref.read(isLongPressProvider.notifier).state = true;
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
        onPressed: () async {
          setState(() {
            onLongPressCounter = 17;
            ref.read(isLongPressProvider.notifier).state = false;
            Vibration.vibrate(duration: 10);

            if (index <= sephaText.length) {
              ref.read(isSephaCountrEndProvider.notifier).state = false;
              isAnimate = false;
              isFirstAnimate = false;
              ref.read(isSecondAnimateProvider.notifier).state = false;
              return setState(() {
                controller.animateToPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                    index);
                total++;
                saveTotal(total);
                total % 10 == 0 ? isAnimate = true : false;
                isAnimate ?  ref.read(isSephaCountrEndProvider.notifier).state = true :  ref.read(isSephaCountrEndProvider.notifier).state = false;
                isAnimate ? isFirstAnimate = true : isFirstAnimate = false;
                !isFirstAnimate
                    ? ref.read(isSecondAnimateProvider.notifier).state = true
                    : ref.read(isSecondAnimateProvider.notifier).state = false;
              });
            }
          });
        },
        context: context,
        child: Text(
          SetLocalization.of(context)!.getTranslateValue("tasbih"),
          style: TextStyle(color: Colors.white.withOpacity(.95)),
        ));
  }
}
