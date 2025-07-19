import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/view/common_widgets/animations_widgets/build_animation_widget.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/back_button_widget.dart';
import '../../controller/provider_controllers/providers/color_provider.dart';
import 'widgets/login_widgets/button_login_completed_widget.dart';
import 'widgets/login_widgets/button_nav_to_reg_completed_widget.dart';
import 'widgets/login_widgets/password_login_completed_widget.dart';
import 'widgets/login_widgets/phone_login_completed_widget.dart';
import 'widgets/login_widgets/title_login_completed_widget.dart';

class LoginUi extends ConsumerWidget {
  const LoginUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColorfulSafeArea(
      color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
      child: Scaffold(
        backgroundColor:
            ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: FadeInOnVisible(
                      direction:SlideDirection.x,
                      child: BackButtonWidget()),
                ),
                FadeInOnVisible(
                    direction: SlideDirection.x,
                    child: TitleLoginCompletedWidget()),
                FadeInOnVisible(

                    child: PhoneLoginCompletedWidget()),
                FadeInOnVisible(child: PasswordLoginCompletedWidget()),
                FadeInOnVisible(
                    direction: SlideDirection.y,
                    child: ButtonLoginCompletedWidget()),
                FadeInOnVisible(
                    direction: SlideDirection.y,
                    child: ButtonNavToRegCompletedWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
