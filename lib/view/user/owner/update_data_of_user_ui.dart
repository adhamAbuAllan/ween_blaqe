import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/view/common_widgets/containers_widgets'
    '/container_field_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/update_user_data_widgets'
    '/appbar_update_user_data_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/update_user_data_widgets'
    '/title_update_user_data_widget.dart';
import 'package:ween_blaqe/view/user/owner/widgets/update_user_data_widgets'
    '/update_user_password_container_widget.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/auth_provider.dart';
import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';
import '../../../constants/localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../authorization_ui/widgets/registration_widgets/phone_completed_widget.dart';
import '../../common_widgets/containers_widgets/container_widget.dart';

class UpdateUserDataUi extends ConsumerWidget {
  const UpdateUserDataUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ColorfulSafeArea(
        bottomColor: Colors.transparent,
        color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
        child: Scaffold(
          backgroundColor:
              ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
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
                    key:
                        ref.watch(updateUserNameValidate.notifier).state != null
                            ? updateUsernameFormKey
                            : null,
                    child: ContainerFieldWidget(
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
                  ContainerWidget(
                    horizontalPadding: 20,
                    child: Form(
                      key: ref.watch(updatePhoneValidate.notifier).state != null
                          ? updatePhoneNumberFormKey
                          : null,
                      child: PhoneCompletedWidget(
                        hasContainer: true,
                        validateValue: ref.watch(updatePhoneValidate),
                        controller: ref.watch(
                          updatePhoneNumberController,
                        ),
                        isPhoneRegTextField: true,
                      ),
                    ),
                  ),
                  //change phone container

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
