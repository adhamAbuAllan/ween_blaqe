import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/methods/local_methods/no_internet_notifier.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/no_internet_state.dart';

final noInternetNotfierProvider =
    StateNotifierProvider<NoInternetNotifier, NoInternetState>((ref) {
  return NoInternetNotifier();
});

// Booleans

/// should be an state.

///should be an state.

/// should be an state.

/// should be an state.

/// should be an state.

/// should be an state.

/// should be an state.

// Integers
final sephaCounterProvider = StateProvider<int>((ref) => 0);

///should be an state.
final indexProvider = StateProvider<int>((ref) => 0);
final totalProvider = StateProvider<int>((ref) => 0);

/// should be an state.
final onLongPressCounterProvider =
StateProvider<int>((ref) => 17);

// Controller
final carouselSliderControllerProvider =
    StateProvider<CarouselSliderController>(
        (ref) => CarouselSliderController());

// List of Strings
final sephaTextProvider = StateProvider<List<String>>((ref) => [
      "سبحان الله",
      "الحمد لله",
      "لا إله إلا الله",
      "الله اكبر",
      "سبحان الله وبحمده",
      "سبحان الله العظيم",
      "استغفر الله",
      "ولا حول ولا قوة إلا بالله",
    ]);
