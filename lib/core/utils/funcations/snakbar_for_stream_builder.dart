import 'package:flutter/cupertino.dart';
import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';

void showSnakBarInStreamBuilder(BuildContext context, String text,
    {bool? isIcon, IconData? icon, bool? isConnect,bool ? isStart }) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showSnakBar(context, text,
        isIcon: isIcon, icon: icon, isConnect: isConnect,seconds: 0);
    isStart = false;
  });
}
