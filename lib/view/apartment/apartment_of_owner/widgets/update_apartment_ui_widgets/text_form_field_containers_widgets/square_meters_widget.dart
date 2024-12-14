import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants/coordination.dart';
import '../../../../../../constants/get_it_controller.dart';
import '../../../../../../constants/localization.dart';
import '../../../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../../common_widgets/containers_widgets/container_field_widget.dart';

class SquareMetersFieldWidget extends ConsumerWidget {
  const SquareMetersFieldWidget({super.key, this.originalSquareMeters});
  final String? originalSquareMeters;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
          bottom:
          getIt<AppDimension>().isSmallScreen(context)
              ? 0
              : 10),
      child: ContainerFieldWidget(
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
