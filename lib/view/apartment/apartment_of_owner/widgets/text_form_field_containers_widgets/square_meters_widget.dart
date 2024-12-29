import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/localization.dart';
import '../../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../common_widgets/containers_widgets/container_field_widget.dart';

class SquareMetersFieldWidget extends ConsumerWidget {
  const SquareMetersFieldWidget({super.key, this.originalSquareMeters});
  final String? originalSquareMeters;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: ref.read(apartmentSquareMeterValidate.notifier).state != null
          ? formApartmentSquareMeterValidateKey
          : null,
      child: ContainerFieldWidget(
        validator: (value){
          if (ref.read(apartmentSquareMeterValidate.notifier).state == null) {
            return null;
          }
          return ref.watch(apartmentSquareMeterValidate);
        },
        title: SetLocalization.of(context)!
            .getTranslateValue("apartment_size"),
        hintInput: '0',
        controller: ref.read(squareMetersController),
        inputType: TextInputType.number,
        originalValue: originalSquareMeters,
      ),
    );
  }
}
