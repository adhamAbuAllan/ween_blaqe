import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/update_apartment_state.dart';

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
