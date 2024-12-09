import 'package:ween_blaqe/controller/provider_controllers/statuses/alert_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/core/widgets/alirt_class_widget.dart';
import 'package:flutter/material.dart';

class AlertNotifier extends StateNotifier<AlertState> {
  AlertNotifier() : super(AlertState());

  void normalAlert(
      {required BuildContext context,
      required String title,
      required String message,
      required String textOfOkButton}) {
    state = state.copyWith(
        title: title, message: message, textOfOkButton: textOfOkButton);
    NormalAlert.show(context, state.title ?? "", state.message ?? "",
        state.textOfOkButton ?? "");
  }

  void alertWithTwoBtn(
      {required BuildContext context,
      required String title,
      required String message,
      required String textOfOkButton,
      required String textOfCancelButton,
      required Function onClickOkBtn}) {
    state = state.copyWith(
        title: title,
        message: message,
        textOfOkButton: textOfOkButton,
        textOfCancelButton: textOfCancelButton,
        onClicked: onClickOkBtn);
    AlertWithTwoBtn.show(
        context,
        state.title ?? "",
        state.message ?? "",
        state.textOfOkButton ?? "",
        state.textOfCancelButton ?? "",
        state.onClickOkBtn ?? () {});
  }
}
