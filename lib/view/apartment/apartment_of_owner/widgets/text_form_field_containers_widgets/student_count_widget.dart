import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/localization.dart';
import '../../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../common_widgets/containers_widgets/container_field_widget.dart';

class StudentCountFieldWidget extends ConsumerWidget {
  const StudentCountFieldWidget({super.key, this.originalStudentCount});
  final String? originalStudentCount;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: ref.watch(studentCountValidate.notifier).state != null
          ? formStudentCountValidateKey
          : null,
      child: ContainerFieldWidget(
        title: ref.watch(typesNotifier).selectedType?.id == 1 ||
            ref.watch(typesNotifier).selectedType?.id == null
            ? SetLocalization.of(context)!.getTranslateValue("allowed_people_count")
            : SetLocalization.of(context)!
                .getTranslateValue("allowed_students"),
        hintInput: '0',
        validator: (value) {
          if (ref.watch(studentCountValidate.notifier).state == null) {
            return null;
          }
          return ref.watch(studentCountValidate);
        },
        controller: ref.read(countOfStudentController),
        inputType: TextInputType.number,
        originalValue: originalStudentCount,
      ),
    );
  }
}
