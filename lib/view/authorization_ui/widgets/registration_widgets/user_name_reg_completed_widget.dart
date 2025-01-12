import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        TextFormFieldWidget(
          fontSize: getIt<AppDimension>().isSmallScreen(context) ? 15 : 16,
          labelName: SetLocalization.of(context)!.getTranslateValue("full_name"),
          autoFocus: true,
          errorText: ref.watch(formFieldsNotifier)['username']?.error,
          controller: ref.read(userNameController),
          keyboardType: TextInputType.name,
          validator: (value) {
            return ref.watch(formFieldsNotifier)['username']?.error;
          },
        ),
        const HintUnderUserNameField()
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

          fontSize: 14,
        ),
        softWrap: true,
      ),
    );
  }
}

