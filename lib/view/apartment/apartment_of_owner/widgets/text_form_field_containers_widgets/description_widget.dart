import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/localization.dart';
import '../../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../common_widgets/containers_widgets/container_field_widget.dart';

class DescriptionFieldWidget extends ConsumerWidget {
  const DescriptionFieldWidget({super.key, this.originalDescription});

  final String? originalDescription;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: ref.watch(apartmentDescriptionValidate.notifier).state != null
          ? formApartmentDescriptionValidateKey
          : null,
      child: ContainerFieldWidget(
        validator: (value) {
          if (ref.watch(apartmentDescriptionValidate.notifier).state == null) {
            return null;
          }
          return ref.watch(apartmentDescriptionValidate);
        },
        title: SetLocalization.of(context)!
            .getTranslateValue("apartment_overview"),
        controller: ref.read(descriptionController),
        hintInput: SetLocalization.of(context)!
            .getTranslateValue("private_student_apartment"),
        inputType: TextInputType.text,
        maxLength: 255,
        hintMaxLines: 7,
        originalValue: originalDescription,
      ),
    );
  }
}
