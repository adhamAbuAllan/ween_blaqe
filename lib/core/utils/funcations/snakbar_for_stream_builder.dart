import 'package:flutter/cupertino.dart';
import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';

void showSnakBarInStreamBuilder(BuildContext context, String text,
    {bool? isIcon, IconData? icon, bool? isConnect,bool ? isStart , bool ?withButton,String ?textOfButton,void Function()? onPressed, }) {
  WidgetsBinding.instance.addPostFrameCallback((_) {

    showSnakBar(context, text,
        isIcon: isIcon, icon: icon, isConnect: isConnect,seconds: 0,onPressed: onPressed,textOfButton: textOfButton,withButton:withButton );
    isStart = false;
  });
}
