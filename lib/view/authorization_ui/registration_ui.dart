import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/view/authorization_ui/widgets/registration_widgets/drop_down_user_type_widget.dart';

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

class RegistrationUi extends ConsumerStatefulWidget {
  const RegistrationUi({super.key});

  @override
  ConsumerState createState() => _RegistrationUiState();
}

class _RegistrationUiState extends ConsumerState<RegistrationUi> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(isObscure.notifier).state = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
      child: Scaffold(
          backgroundColor:
              ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: BackButtonWidget(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  height: getIt<AppDimension>().isSmallScreen(context)
                      ? 20 / 3
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
                          SizedBox(
                            height: getIt<AppDimension>().isSmallScreen(context)
                                ? 10
                                : 20,
                          ),
                          DropDownUserTypeWidget(
                            stringValues: ref.read(typeOfUser),
                          ),
                          SizedBox(
                            height: getIt<AppDimension>().isSmallScreen(context)
                                ? 10
                                : 30,
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
                          SizedBox(
                            height: getIt<AppDimension>().isSmallScreen(context)
                                ? 0
                                : 10,
                          ),
                          const PasswordRegCompletedWidget(),
                          // HintUnderPhoneNumberField(),
                          SizedBox(
                            height: getIt<AppDimension>().isSmallScreen(context)
                                ? 0
                                : 20,
                          ),
                          // PasswordWidget(),
                          const PrivacyPolicyTextWidget(),
                          const ButtonRegCompletedWidget()
                        ])),
              ],
            )),
          )),
    );
  }
}
