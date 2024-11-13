import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/features/common_widgets/back_button_widget.dart';
import 'package:ween_blaqe/features/widgets_before_user_reg/widgets/login_widgets/button_login_completed_widget.dart';
import 'package:ween_blaqe/features/widgets_before_user_reg/widgets/login_widgets/password_login_completed_widget.dart';
import 'package:ween_blaqe/features/widgets_before_user_reg/widgets/login_widgets/phone_login_completed_widget.dart';
import 'package:ween_blaqe/features/widgets_before_user_reg/widgets/login_widgets/title_login_completed_widget.dart';
import '../../../../constants/nums.dart';
import '../../../../features/widgets_before_user_reg/widgets/login_widgets/button_nav_to_reg_completed_widget.dart';

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: themeMode.isLight
          ? kBackgroundAppColorLightMode
          : kBackgroundAppColorDarkMode,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //back arrow button
              Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: BackButtonWidget(),
              ),
              TitleLoginCompletedWidget(),
              PhoneLoginCompletedWidget(),
              PasswordLoginCompletedWidget(),
              ButtonLoginCompletedWidget(),
              ButtonNavToRegCompletedWidget()
            ],
          ),
        ),
      ),
    );
  }
}
