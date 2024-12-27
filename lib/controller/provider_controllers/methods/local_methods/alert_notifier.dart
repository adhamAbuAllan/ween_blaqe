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
      required String textOfOkButton,
        Color? borderColor,
        Color? containerColor,
        Color? textColor,
      }) {
    state = state.copyWith(
        title: title, message: message, textOfOkButton: textOfOkButton);
    NormalAlert.show(
        context: context,
        title: state.title ?? "",
        message: state.message ?? "",
        textOfOkButton: state.textOfOkButton ?? "",
        textColor: textColor,containerColor: containerColor,borderColor: borderColor
    );
  }

  void alertWithTwoBtn({
    required BuildContext context,
    required String title,
    required String message,
    required String textOfOkButton,
    required String textOfCancelButton,
    required Function onClickOkBtn,
    Color? borderColor,
    Color? containerColor,
    Color? textColor,
  }) {
    state = state.copyWith(
        title: title,
        message: message,
        textOfOkButton: textOfOkButton,
        textOfCancelButton: textOfCancelButton,
        onClicked: onClickOkBtn);
    AlertWithTwoBtn.show(
        context: context,
        title: state.title ?? "",
        message: state.message ?? "",
        textOfOkButton: state.textOfOkButton ?? "",
        textOfCancelButton: state.textOfCancelButton ?? "",
        onClicked: state.onClickOkBtn ?? () {},
        borderColor: borderColor,
        containerColor: containerColor,
        textColor: textColor);
  }
}
