import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
// import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/main.dart';
// import 'package:ween_blaqe/sesstion/sesstion_of_user.dart';

import '../constants/nums.dart';
// import '../constants/strings.dart';
// import '../core/utils/funcations/route_pages/push_routes.dart';
// import '../sesstion/new_session.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  // void _onIntroEnd(context) {}

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

    return IntroductionScreen(
      // key: introKey,

      baseBtnStyle: const ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(kPrimaryColorDarkMode)),
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
        PageViewModel(
          reverse: false,
          useRowInLandscape: true,
          useScrollView: false,
          titleWidget: const SizedBox(),
          bodyWidget: const SizedBox(),
          image: _buildFullscreenImage(
              'assets/images/intro_images/splash_screen6.png'),
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
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Main()));

      },
      onSkip: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Main()));
      },
      // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,

      rtl: true,
      // Display as right-to-left
      back: const Icon(Icons.arrow_forward),

      skip: const Text('تخطي',
          style: TextStyle(fontFamily: 'IBM', fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_back),
      done: const Text('تم',
          style: TextStyle(fontFamily: 'IBM', fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.fromLTRB(16, 0, 16, 30),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        activeColor: kPrimaryColorDarkMode,
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),

      dotsContainerDecorator: const ShapeDecoration(
        shadows: [BoxShadow(color: kContainerColorDarkMode)],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
