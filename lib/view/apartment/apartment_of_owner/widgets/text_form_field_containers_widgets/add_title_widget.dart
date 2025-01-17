import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../common_widgets/containers_widgets/container_field_widget.dart';

class AddTitleFieldWidget extends ConsumerWidget {
  const AddTitleFieldWidget({super.key, this.originalTitle});

  final String? originalTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0, 0, 0, getIt<AppDimension>().isSmallScreen(context) ? 0 : 10),
      child: Form(
          key: ref.watch(titleValidate.notifier).state != null
              ? formTitleValidateKey
              : null,
        child: ContainerFieldWidget(
          validator: (value){
            if (ref.watch(titleValidate.notifier).state == null) {
              return null;
            }
            return ref.watch(titleValidate);

          },
          title: SetLocalization.of(context)!.getTranslateValue("add_address"),
          controller: ref.read(titleController),
          hintInput: SetLocalization.of(context)!
              .getTranslateValue("furnished_student_housing"),
          inputType: TextInputType.text,
          originalValue: originalTitle,
        ),
      ),
    );
  }
}
