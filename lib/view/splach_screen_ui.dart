import 'dart:async';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/language_proivder.dart';
import 'package:ween_blaqe/view/common_widgets/animations_widgets/build_animation_widget.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await ref.watch(mapStateProvider.notifier).getUserLocation(ref: ref);

      ref.read(languageNotifier.notifier);
      if (NewSession.get(PrefKeys.language, "").isEmpty) {
        NewSession.save(PrefKeys.language, "ar");
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
          color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
          child: SingleChildScrollView(
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                buildAnimatedWidget(child :Image(
                  image: AssetImage(
                      "assets/images/splash screen heigh qulity with large size.png"),
                ))
                    .fadeIn()
                    .untint(color: Colors.white)
                    .blurXY(begin: 64)
                    .scaleXY(begin: 3.6),
              ]))),
        ));
  }

  Future<void> navigateToHome() async {
    Future.delayed(const Duration(milliseconds: 2250), () {
      NewSession.get("PrefKeys.isFirstTime", "") != "OK"
          ? NewSession.save(PrefKeys.language, "ar")
          : null;
      NewSession.get('PrefKeys.isFirstTime', "") != "OK"
          ? Navigator.pushReplacementNamed(context, MyPagesRoutes.introScreen)
          : Navigator.pushReplacementNamed(context, MyPagesRoutes.main);
    });
  }
}
