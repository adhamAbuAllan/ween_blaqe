import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/widgets/apartments/create_apartment/container_classes_widget/input_text_class_widget/container_input_text_class_widget.dart';
import 'package:ween_blaqe/features/user/owner/widgets/update_user_data_widgets/appbar_update_user_data_widget.dart';
import 'package:ween_blaqe/features/user/owner/widgets/update_user_data_widgets/title_update_user_data_widget.dart';
import 'package:ween_blaqe/features/user/owner/widgets/update_user_data_widgets/update_user_password_container_widget.dart';
import 'package:ween_blaqe/features/user/provider/auth_provider.dart';
import 'package:ween_blaqe/features/widgets_before_user_reg/widgets/registration_widgets/phone_completed_widget.dart';
import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';
import '../../../constants/localization.dart';
import '../../../constants/nums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateUserData extends ConsumerWidget {
  const UpdateUserData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ColorfulSafeArea(
        bottomColor: Colors.transparent,
        color:
            themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        child: Scaffold(
          backgroundColor: themeMode.isLight
              ? kBackgroundAppColorLightMode
              : kBackgroundAppColorDarkMode,
          appBar: const AppBarUpdateUserDataWidget(),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  const TitleUpdateUserDataWidget(),
                  SizedBox(
                    height: getIt<AppDimension>().isSmallScreen(context)
                        ? 50 / 2.1
                        : 50,
                  ),

                  //change name container
                  Form(
                    key: ref.watch(updateUserNameValidate.notifier).state !=
                        null ? updateUsernameFormKey : null,
                    child: ContainerInputTextClassWidget(
                      validator: (value) {
                        if (ref.read(updateUserNameValidate.notifier).state ==
                            null) {
                          return null;
                        }
                        return ref.watch(updateUserNameValidate);
                      },
                      title: SetLocalization.of(context)!
                          .getTranslateValue("full_name"),
                      hintInput: "",
                      inputType: TextInputType.name,
                      controller: ref.watch(updateUsernameController),
                      autoFocus: true,
                    ),
                  ),
                  SizedBox(
                    height: getIt<AppDimension>().isSmallScreen(context)
                        ? 20 / 1.6
                        : 20,
                  ),
                  //change phone container
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 2, 10, 0),
                    // height: 140,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: themeMode.isLight
                          ? kContainerColorLightMode
                          : kContainerColorDarkMode,
                    ),
                    child: Form(
                      key:ref.watch(updatePhoneValidate.notifier).state !=
                          null ? updatePhoneNumberFormKey : null ,
                      child: PhoneCompletedWidget(
                        validateValue: ref.watch(updatePhoneValidate),
                        controller: ref.watch(
                          updatePhoneNumberController,
                        ),
                        isPhoneRegTextField: true,
                      ),
                    ),
                  ),

                  // change password container
                  const UpdateUserPasswordContainerWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
