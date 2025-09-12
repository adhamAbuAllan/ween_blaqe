import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoIndexState {
  final int currentPhotoIndex;
  PhotoIndexState({required this.currentPhotoIndex});
}

class PhotoIndexNotifier extends StateNotifier<Map<int, PhotoIndexState>> {
  PhotoIndexNotifier() : super({});

  void updatePhotoIndex(int apartmentId, int newIndex) {
    state = {
      ...state,
      apartmentId: PhotoIndexState(currentPhotoIndex: newIndex),
    };
  }

  int getPhotoIndex(int apartmentId) {
    return state[apartmentId]?.currentPhotoIndex ?? 0;
  }
}

final photoIndexProvider =
StateNotifierProvider<PhotoIndexNotifier, Map<int, PhotoIndexState>>(
        (ref) => PhotoIndexNotifier());
