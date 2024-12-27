import 'dart:async';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/language_proivder.dart';
import '../constants/nums.dart';
import '../constants/strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../session/new_session.dart';

class SplashScreenUi extends ConsumerStatefulWidget {
  const SplashScreenUi({super.key});

  @override
  ConsumerState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreenUi> {
  @override
  void initState() {
    super.initState();
    debugPrint("the first time value : --${introController.isFirstTime}");
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(languageNotifier.notifier);
      if(NewSession.get("language", "").isEmpty){
        NewSession.save("language", "ar");
      }
      ref.read(themeModeNotifier.notifier).loadThemeMode();

    });
    themeMode.loadValue();
    navigateToHome();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
        backgroundColor: const Color(0x2ef0f0fe),
        body: ColorfulSafeArea(
          bottomColor: Colors.transparent,
          color: themeMode.isLight
              ? kPrimaryColorLightMode
              : kPrimaryColorDarkMode,
          child: const SingleChildScrollView(
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                Image(
                  image: AssetImage(
                      "assets/images/splash screen heigh qulity with large size.png"),
                )
              ]))),
        ));
  }

  Future<void> navigateToHome() async {
    Future.delayed(const Duration(milliseconds: 1700), () {
      NewSession.get("isFirstTime", "") != "OK"
          ? NewSession.save("language", "ar")
          : null;
      NewSession.get('isFirstTime', "") != "OK"
          ? Navigator.pushReplacementNamed(context, MyPagesRoutes.introScreen)
          : Navigator.pushReplacementNamed(context, MyPagesRoutes.main);
      debugPrint("isFirstTime value in navigateToHome method "
          "${introController.isFirstTime}");
      // checkWifiStatus();
    });
  }
}
