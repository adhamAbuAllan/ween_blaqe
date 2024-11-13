import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/controller/provider_controllers/hybrid_methods/validator_and_registratoin.dart';
import 'package:ween_blaqe/core/widgets/registration/complete_widget/password_widget.dart';
import 'package:ween_blaqe/core/widgets/registration/complete_widget/phone_number_widget.dart';
import 'package:ween_blaqe/core/widgets/registration/complete_widget/privacy_policy_text_widget.dart';
import 'package:ween_blaqe/core/widgets/registration/complete_widget/register_button_widget.dart';
import 'package:ween_blaqe/core/widgets/registration/complete_widget/title_screen_widget.dart';
import 'package:ween_blaqe/features/common_widgets/back_button_widget.dart';
import '../../constants/coordination.dart';
import '../../constants/get_it_controller.dart';
// import '../../constants/localization.dart';
// import '../../controller/get_controllers.dart';
// import '../../core/utils/function_that_effect_widgets/remove_plus_from_phone_number.dart';
// import '../../core/widgets/alirt_class_widget.dart';
import '../../core/widgets/registration/complete_widget/user_name_widget.dart';
import '../user/provider/auth_provider.dart';


class Register extends ConsumerWidget {
  const Register({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: Scaffold(
          backgroundColor: themeMode.isLight
              ? kBackgroundAppColorLightMode
              : kBackgroundAppColorDarkMode,
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: BackButtonWidget(

                  ),
                ),
                SizedBox(
                  height: getIt<AppDimension>().isSmallScreen(context)
                      ? 20 / 1.6
                      : 20,
                ),
                const TitleScreenWidget(),
                const NameOfApp(),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getIt<AppDimension>().isSmallScreen(context)
                            ? 15
                            : 25),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const UserNameWidget(),
                          const HintUnderUserNameField(),
                          const SizedBox(
                            height: 20,
                          ),
                          const PhoneNumberWidget(),
                          const HintUnderPhoneNumberField(),
                          const SizedBox(
                            height: 20,
                          ),
                          const PasswordWidget(),
                          const PrivacyPolicyTextWidget(),
                          RegisterButtonWidget(onPressed: () async {
                            final username =
                                ref.
                                read(formFieldsProvider)
                                ['username']?.value
                                    ?? '';
                            final phone =
                                ref.
                                read(formFieldsProvider)
                                ['phoneNumberRegistration']?.value
                                    ?? '';
                            final password =
                                ref.read(formFieldsProvider)['password']?.value ??
                                    '';

                            validateAndRegistration(ref, username, phone,
                                password, context);
                          }
                    //

                              )
                        ])),
              ],
            )),
          )),
    );
// );
  }
}
