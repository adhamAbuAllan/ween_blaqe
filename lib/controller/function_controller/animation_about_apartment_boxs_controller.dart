import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/constants/nums.dart';

class AnimationBoxController extends GetxController{
  RxBool isRoomSizeChange = false.obs;
  RxBool isRoomBathSizeChange = false.obs;
  RxBool isAreaSizeChange = false.obs;

    AnimatedTextKit buildAnimatedTextKit(String text) {
    return AnimatedTextKit(
      totalRepeatCount: 3,
      pause: Duration.zero,
      onFinished: () {
          isRoomSizeChange.value = false;
          isRoomBathSizeChange.value = false;
          isAreaSizeChange.value = false;
      },
      //aniatedTextOfCounter
      animatedTexts: [
        FadeAnimatedText(
          text,
          textStyle: TextStyle(
              color: themeMode.isLight
                  ? kPrimaryColorLightMode
                  : kPrimaryColorDarkMode),
          duration: const Duration(
            milliseconds: 100,
          ),
        ),
      ],
    );
  }

}