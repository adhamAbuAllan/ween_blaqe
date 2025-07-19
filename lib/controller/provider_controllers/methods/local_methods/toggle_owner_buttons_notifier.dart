import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/status_of_apartment/update_apartment_state.dart';
/// a [ToggleOwnerButtonsNotifier] make a change between delete mode and 
/// edit mode. if both of delete mode and edit mode is false that mean 
/// a bookmark button will show but that show only in two UIs home and bookmark.
class ToggleOwnerButtonsNotifier extends StateNotifier<UpdateApartmentState> {
  ToggleOwnerButtonsNotifier() : super(UpdateApartmentState());

  void toggleDeleteMode(AnimationController animationController) {

    state = state.copyWith(isDelete: !state.isDelete);
      if (
      state.isDelete
      ) {

        state = state.copyWith(isEdit: false);
        animationController.forward();
      } else {
        state = state.copyWith(isEdit: true);

        animationController.reverse();
      }
  }
}
