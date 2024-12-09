import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../constants/coordination.dart';
import '../../../../../../constants/get_it_controller.dart';
import '../../../../../../constants/localization.dart';
import '../../../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../../common_widgets/containers_widgets/container_field_widget.dart';

class RoomsFieldWidget extends ConsumerWidget {
  const RoomsFieldWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: getIt<AppDimension>().isSmallScreen(context) ? 0 : 10),
      child: ContainerFieldWidget(
        title:
            SetLocalization.of(context)!.getTranslateValue("number_of_rooms"),
        hintInput: "0",
        inputType: TextInputType.number,
        controller: ref.read(countOfRoomsController),
      ),
    );
  }
}