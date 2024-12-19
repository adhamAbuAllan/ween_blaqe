import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/auth_provider.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../constants/nums.dart';
import '../../../../view/common_widgets/text_form_field_widgets/text_form_filed_widget.dart';

class UserNameWidget extends ConsumerWidget {
  const UserNameWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return  TextFormFieldWidget(
      fontSize: getIt<AppDimension>().isSmallScreen(context) ? 15 : 16,
      labelName: SetLocalization.of(context)!
          .getTranslateValue("full_name"),
      autoFocus: true,
      errorText: ref.watch(formFieldsNotifier)['username']?.error,
      onChanged: (value) {
        ref.read(formFieldsNotifier.notifier).updateValue('username', value,
            context: context);
      },      controller: ref.read(userNameController),
      keyboardType: TextInputType.name,);
  }
}

class HintUnderUserNameField extends StatelessWidget {
  const HintUnderUserNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
      child: Text(
        SetLocalization.of(context)!
            .getTranslateValue("identity_verification"),
        style: TextStyle(
          color: themeMode.isLight
              ? kTextColorLightMode
              : kTextColorDarkMode,
          fontSize: 14,
        ),
        softWrap: true,
      ),
    );
  }
}

