import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ween_blaqe/view/common_widgets/button_widgets/back_button_widget.dart';
import '../../constants/coordination.dart';
import '../../constants/get_it_controller.dart';
import '../../controller/provider_controllers/providers/auth_provider.dart';
import '../../controller/provider_controllers/providers/color_provider.dart';
import '../common_widgets/privacy_policy_text_widget.dart';
import 'widgets/registration_widgets/button_reg_completed_widget.dart';
import 'widgets/registration_widgets/password_reg_completed_widget.dart';
import 'widgets/registration_widgets/phone_completed_widget.dart';
import 'widgets/registration_widgets/title_reg_completed_widget.dart';
import 'widgets/registration_widgets/user_name_reg_completed_widget.dart';

class RegistrationUi extends ConsumerWidget {
  const RegistrationUi({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color:
      ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
      child: Scaffold(
          backgroundColor: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),

          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: BackButtonWidget(),
                ),
                SizedBox(
                  height: getIt<AppDimension>().isSmallScreen(context)
                      ? 20 / 1.6
                      : 20,
                ),
                const TitleRegCompletedWidget(),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getIt<AppDimension>().isSmallScreen(context)
                            ? 15
                            : 25),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // UserNameWidget(),
                          const UserNameRegCompletedWidget(),
                          // HintUnderUserNameField(),
                          const SizedBox(
                            height: 20,
                          ),
                          Form(
                              key: formPhoneKey,
                              child: PhoneCompletedWidget(
                                validateValue: ref
                                        .watch(formFieldsNotifier)[
                                            'phoneNumberRegistration']
                                        ?.error ??
                                    "no error have",
                                controller: ref.read(phoneRegController),
                                isPhoneRegTextField: true,
                              )),
                          // PhoneNumberWidget(),
                          const SizedBox(
                            height: 10,
                          ),
                          const PasswordRegCompletedWidget(),
                          // HintUnderPhoneNumberField(),
                          const SizedBox(
                            height: 20,
                          ),
                          // PasswordWidget(),
                          const PrivacyPolicyTextWidget(),
                          const ButtonRegCompletedWidget()
                        ])),
              ],
            )),
          )),
    );
// );
  }
}
