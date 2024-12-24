import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../constants/localization.dart';
import '../../../common_widgets/containers_widgets/container_field_widget.dart';
import '../../../../controller/provider_controllers/providers/auth_provider.dart';

class PhoneLoginCompletedWidget extends ConsumerWidget {
  const PhoneLoginCompletedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formLoginPhoneKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: ContainerFieldWidget(
          autoFocus: true,
          // errorText: ref.watch(formFieldsProvider)['phone']?.error,
          validator: (value) {
            return ref.read(formFieldsNotifier)['phone']?.error;
          },
          // onChanged: (value){
          //
          //   ref.watch(formFieldsProvider)['phone']?.error;
          //   ref.watch(formFieldsProvider)['password']?.error;
          //
          // },
          hintMaxLines: 1,
          title: SetLocalization.of(context)!.getTranslateValue("phone_number"),
          controller: ref.read(phoneLoginController),
          hintInput: SetLocalization.of(context)!
              .getTranslateValue("enter_number_with_country_code"),
          inputType: TextInputType.phone,
        ),
      ),
    );
  }
}
