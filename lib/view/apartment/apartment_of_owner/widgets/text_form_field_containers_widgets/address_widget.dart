import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../common_widgets/containers_widgets/container_field_widget.dart';

class AddressFieldWidget extends ConsumerWidget {
  const AddressFieldWidget({super.key, this.originalAddress, this.validator,
    // this.controller
  });

  final String ? originalAddress;
  final String? Function(String?)? validator;

// final TextEditingController? controller;
  ///here should put a validate parameter to update the ui currently
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: getIt<AppDimension>().isSmallScreen(context) ? 0 : 10),
      child: Form(
        key: ref
            .watch(addressValidate.notifier)
            .state != null
            ? formAddressKey
            : null,
        child: ContainerFieldWidget(
          validator: (value) {
            if (ref
                .watch(addressValidate.notifier)
                .state == null) {
              return null;
            }
            return ref.watch(addressValidate);
          },
          title: SetLocalization.of(context)!.getTranslateValue("address"),
          hintInput: SetLocalization.of(context)!
              .getTranslateValue("example_apartment_address"),
          inputType: TextInputType.text,
          controller: ref.watch(addressController),
          helperText:"مثال: واد الهرية بالقرب من جامعة بولتكنك",
          originalValue: originalAddress,
        ),
      ),
    );
  }
}
