import 'package:carousel_slider_plus/carousel_controller.dart';

/// create a status of no interent.
//tabnine should be work now !
class NoInternetState {
  final bool isWantToSepha;
  final bool isContExpanding;
  final CarouselSliderController ? controller;
  NoInternetState({this.isWantToSepha = false, this.isContExpanding = false,
    this.controller});

  NoInternetState copyWith({bool? isWantToSepha, bool? isContExpanding,
  CarouselSliderController ?controller
  }) {
    return NoInternetState(
        isWantToSepha: isWantToSepha ?? this.isWantToSepha,
        isContExpanding: isContExpanding ?? this.isContExpanding,controller:
    controller ?? this.controller);
  }
}
