import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';

// import 'package:ween_blaqe/controller/auth_provider.dart';
import 'package:ween_blaqe/main.dart';
// import 'package:ween_blaqe/session/sesstion_of_user.dart';

import '../constants/localization.dart';
import '../controller/provider_controllers/providers/color_provider.dart';

// import '../constants/strings.dart';
// import '../core/utils/funcations/route_pages/push_routes.dart';
// import '../session/new_session.dart';
class IntroScreenUi extends ConsumerStatefulWidget {
  const IntroScreenUi({super.key});

  @override
  ConsumerState createState() => _IntroScreenUiState();
}

class _IntroScreenUiState extends ConsumerState<IntroScreenUi> {
  Widget _buildFullscreenImage(String imageAssetName) {
    return Image.asset(
      imageAssetName,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      pageColor: Colors.grey,
      imagePadding: EdgeInsets.zero,
    );

    return ColorfulSafeArea(
      color: ref.read
        (primaryColorDark),
      child: IntroductionScreen(
        // key: introKey,

          baseBtnStyle:  ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(ref.read
                (primaryColorDark))),
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      // infiniteAutoScroll: true,

      pages: [
        PageViewModel(
          reverse: false,
          useRowInLandscape: true,
          useScrollView: false,
          titleWidget: const SizedBox(),
          bodyWidget: const SizedBox(),
          image: _buildFullscreenImage(
              'assets/images/intro_images/intro_screen2.png'),
          decoration: pageDecoration.copyWith(
            // contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 0,
            imageFlex: 1,
          ),
        ),
        PageViewModel(
          reverse: false,
          useRowInLandscape: true,
          useScrollView: false,
          titleWidget: const SizedBox(),
          bodyWidget: const SizedBox(),
          image: _buildFullscreenImage(
              'assets/images/intro_images/splash_screen3.png'),
          decoration: pageDecoration.copyWith(
            // contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 0,
            imageFlex: 1,
          ),
        ),
        PageViewModel(
          reverse: false,
          useRowInLandscape: true,
          useScrollView: false,
          titleWidget: const SizedBox(),
          bodyWidget: const SizedBox(),
          image: _buildFullscreenImage(
              'assets/images/intro_images/splash_screen4.png'),
          decoration: pageDecoration.copyWith(
            // contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 0,
            imageFlex: 1,
          ),
        ),
        PageViewModel(
          reverse: false,
          useRowInLandscape: true,
          useScrollView: false,
          titleWidget: const SizedBox(),
          bodyWidget: const SizedBox(),
          image: _buildFullscreenImage(
              'assets/images/intro_images/splash_screen5.png'),
          decoration: pageDecoration.copyWith(
            // contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 0,
            imageFlex: 1,
          ),
        ),

      ],
      globalBackgroundColor: Colors.orange,

      onDone: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Main()));
      },
      onSkip: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Main()));
      },
      // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,

      rtl: true,
      // Display as right-to-left
      back: const Icon(Icons.arrow_forward),

      skip: Text(SetLocalization.of(context)!.getTranslateValue("skip")
          ,
          style: const TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_back),
      done: Text(SetLocalization.of(context)!.getTranslateValue("done"),
          style: const TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.fromLTRB(16, 0, 16, 30),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator:  DotsDecorator(
        spacing: const EdgeInsets.all(6),
        activeColor: ref.read
          (primaryColorDark),
        size: const Size(10.0, 10.0),
        color: const Color(0xFFBDBDBD),
        activeSize: const Size(22.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),

      dotsContainerDecorator: const ShapeDecoration(
        shadows: [
          BoxShadow(color: Color(0xc0303030)),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
        ),
      ),
    )
    ,
    );
  }
}


