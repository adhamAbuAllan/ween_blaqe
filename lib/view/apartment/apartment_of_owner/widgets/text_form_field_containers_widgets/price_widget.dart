import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/localization.dart';
import '../../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../common_widgets/containers_widgets/container_field_widget.dart';

class PriceWidget extends ConsumerWidget {
  const PriceWidget({super.key, this.originalPrice});

  final String? originalPrice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: ref.watch(priceValidate.notifier).state != null
          ? formPriceValidateKey
          : null,
      child: ContainerFieldWidget(
        validator: (value) {
          if (ref.watch(priceValidate.notifier).state == null) {
            return null;
          }
          return ref.watch(priceValidate);
        },
        title: SetLocalization.of(context)!.getTranslateValue("price"),
        hintInput: SetLocalization.of(context)!
            .getTranslateValue("enter_monthly_rent"),
        controller: ref.read(priceController),
        inputType: TextInputType.number,
        originalValue: originalPrice,
      ),
    );
  }
}
