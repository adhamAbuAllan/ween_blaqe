import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';

void showSnakBarInStreamBuilder(
  BuildContext context,
  String text, {
  IconData? icon,
  bool? withButton,
  String? textOfButton,
  void Function()? onPressed,
}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showSnakBar(context, text,
        icon: icon,
        onPressed: onPressed,
        textOfButton: textOfButton,
        withButton: withButton);

  });
}
