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

    debugPrint("isWantToSepha ${state.isWantToSepha}");
    debugPrint("isContExpanding ${state.isContExpanding}");
  }

  onStopSebha() {
    state = state.copyWith(isContExpanding: false);
    // ref.watch(isWantToSephaProvider.notifier).state = false;
    // ref.watch(isContExpandingProvider.notifier).state = false;
  }

  onLongPressSebha({
    required WidgetRef ref,
  }) {
    state = state.copyWith(isLongPress: true);
    state = state.copyWith(sephaCounter: state.sephaCounter + 1);
    ref.read(carouselSliderControllerProvider.notifier).state.animateToPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
        ref.watch(onLongPressCounterProvider));
    Duration(milliseconds: ref.read(onLongPressCounterProvider));
    Vibration.vibrate(duration: ref.read(onLongPressCounterProvider));
  }

  onPressSebha({
    required WidgetRef ref,
    required int index,
    required int onLongPressCounter,
    required List<String> sephaText,
  }) {
    onLongPressCounter = 17;
    state = state.copyWith(isLongPress: false);
    Vibration.vibrate(duration: 10);

    if (index <= sephaText.length) {
      state = state.copyWith(isSephaCountrEnd: false);
      state = state.copyWith(isAnimated: false);
      state = state.copyWith(isFirstAnimate: false);

      state = state.copyWith(isSecondAnimate: false);
      ref.read(carouselSliderControllerProvider.notifier).state.animateToPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
          ref.watch(indexProvider));
      state = state.copyWith(sebhaTotal: state.sebhaTotal + 1);
      saveTotal(state.sebhaTotal);
      state.sebhaTotal % 10 == 0
          ? state = state.copyWith(isAnimated: true)
          : state = state.copyWith(isAnimated: false);
      state.isAnimated
          ? state = state.copyWith(isSephaCountrEnd: true)
          : state = state.copyWith(isSephaCountrEnd: false);
      state.isAnimated
          ? state = state.copyWith(isFirstAnimate: true)
          : state = state.copyWith(isFirstAnimate: false);
      !state.isFirstAnimate
          ? state = state.copyWith(isSecondAnimate: true)
          : state = state.copyWith(isFirstAnimate: false);
    }
    debugPrint("state.sebhaTotal:  => ${state.sebhaTotal}");
    debugPrint("state.sephaCounter:  => ${state.sephaCounter}");
  }

  reset() {
    state = state.copyWith(sebhaTotal: 0);
    saveTotal(state.sebhaTotal);

  }
}
