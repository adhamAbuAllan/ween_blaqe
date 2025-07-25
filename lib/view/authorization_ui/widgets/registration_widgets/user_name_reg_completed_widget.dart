import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/view/common_widgets/animations_widgets/build_animation_widget.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';
import '../../../common_widgets/text_form_field_widgets/text_form_filed_widget.dart';
import '../../../../controller/provider_controllers/providers/auth_provider.dart';

class UserNameRegCompletedWidget extends ConsumerWidget {
  const UserNameRegCompletedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInOnVisible(
          isUIHaveScroll: false,
          direction: SlideDirection.x,
          child: TextFormFieldWidget(
            isPhoneRegTextField: true,
            fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
            labelName: SetLocalization.of(context)!.getTranslateValue("full_name"),
            autoFocus: true,
            errorText: ref.watch(formFieldsNotifier)['username']?.error,
            controller: ref.read(userNameController),
            keyboardType: TextInputType.name,
            validator: (value) {
              return ref.watch(formFieldsNotifier)['username']?.error;
            },
          ),
        ),
        FadeInOnVisible(
          direction: SlideDirection.y,
            isUIHaveScroll: false,
            child: const HintUnderUserNameField())
      ],
    );
  }
}
class HintUnderUserNameField extends ConsumerWidget {
  const HintUnderUserNameField({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
      child: Text(
        SetLocalization.of(context)!
            .getTranslateValue("identity_verification"),
        style: TextStyle(
          color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

          fontSize: getIt<AppDimension>().isSmallScreen(context) ? 12 : 14,
        ),
        softWrap: true,
      ),
    );
  }
}

