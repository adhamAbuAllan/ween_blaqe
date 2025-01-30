import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/no_internet_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/no_internet_state.dart';
import 'package:flutter/material.dart';

import '../../../../view/no_internet_feature/no_internet_ui.dart';

/// should put no Intrent state and then start to create methods.
class NoInternetNotifier extends StateNotifier<NoInternetState> {
  NoInternetNotifier() : super(NoInternetState());

  onStartSebha({required WidgetRef ref}) {
    state = state.copyWith(isWantToSepha: true, isContExpanding: true);
    ref.watch(isWantToSephaProvider.notifier).state = true;
    ref.watch(isContExpandingProvider.notifier).state = true;

    debugPrint("isWantToSepha ${state.isWantToSepha}");
    debugPrint("isContExpanding ${state.isContExpanding}");
    debugPrint("isWantToSephaProivder ${ref.read(isWantToSephaProvider)}");
    debugPrint("isContExpandingProivder ${ref.read(isContExpandingProvider)}");
  }

  onStopSebha() {
    state = state.copyWith(isContExpanding: false);
    // ref.watch(isWantToSephaProvider.notifier).state = false;
    // ref.watch(isContExpandingProvider.notifier).state = false;
  }

  onPressSebha(
      {required WidgetRef ref,
      required int index,
      required int onLongPressCounter,
      required List<String> sephaText,
      required bool isAnimate,
      required bool isFirstAnimate,
      required CarouselSliderController controller,
      required int total}) {
    onLongPressCounter = 17;
    ref.watch(isLongPressProvider.notifier).state = false;
    Vibration.vibrate(duration: 10);

    if (index <= sephaText.length) {
      ref.watch(isSephaCountrEndProvider.notifier).state = false;
      isAnimate = false;
      isFirstAnimate = false;
      ref.watch(isSecondAnimateProvider.notifier).state = false;

      controller.animateToPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
          index);
      total++;
      saveTotal(total);
      total % 10 == 0 ? isAnimate = true : false;
      isAnimate
          ? ref.watch(isSephaCountrEndProvider.notifier).state = true
          : ref.watch(isSephaCountrEndProvider.notifier).state = false;
      isAnimate ? isFirstAnimate = true : isFirstAnimate = false;
      !isFirstAnimate
          ? ref.watch(isSecondAnimateProvider.notifier).state = true
          : ref.watch(isSecondAnimateProvider.notifier).state = false;
    }
  }
}
