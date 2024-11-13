import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../constants/localization.dart';
import '../../../../core/widgets/apartments/create_apartment/container_classes_widget/input_text_class_widget/container_input_text_class_widget.dart';
import '../../../user/provider/auth_provider.dart';

class PhoneLoginCompletedWidget extends ConsumerWidget {
   const PhoneLoginCompletedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formLoginPhoneKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: ContainerInputTextClassWidget(
          autoFocus: true,
          // errorText: ref.watch(formFieldsProvider)['phone']?.error,
          validator: (value) {


            return ref.read(formFieldsProvider)['phone']?.error;
          },
          // onChanged: (value){
          //
          //   ref.watch(formFieldsProvider)['phone']?.error;
          //   ref.watch(formFieldsProvider)['password']?.error;
          //
          // },
          hintMaxLines: 1,
          title: SetLocalization.of(context)!.getTranslateValue("phone_number"),
          controller: ref.read(phoneController),
          hintInput: SetLocalization.of(context)!
              .getTranslateValue("enter_number_with_country_code"),
          inputType: TextInputType.phone,
        ),
      ),
    );
  }
}
