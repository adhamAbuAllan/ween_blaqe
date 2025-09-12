import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../statuses/status_of_apartment/apartment_state.dart';
class ImageSliderNotifier extends StateNotifier<Map<int, ApartmentState>> {
  ImageSliderNotifier() : super({});

  // Update the current index for a specific apartment
  void updateIndex(int apartmentId, int newIndex) {
    state = {
      ...state,
      apartmentId: state[apartmentId]?.copyWith(currentIndex: newIndex) ??
          ApartmentState(currentIndex: newIndex),
    };
  }

  // Get the current index for an apartment
  int getCurrentIndex(int apartmentId) {
    return state[apartmentId]?.currentIndex ?? 0;
  }
}


