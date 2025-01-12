import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../constants/localization.dart';
import '../../../../controller/provider_controllers/providers/apartment_provider.dart';

class ButtonNotFoundWidget extends ConsumerWidget {
  const ButtonNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return                 Padding(
      padding: EdgeInsets.fromLTRB(
          0,
          MediaQuery.of(context).size.height < 683.5
              ? MediaQuery.of(context).size.height / 40
              : MediaQuery.of(context).size.height / 9,
          0,
          0),
      child: TextButton(
          child: Text(
            SetLocalization.of(context)!
                .getTranslateValue("reorder"),
            style: TextStyle(
                color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
          onPressed: () async {
            ref.read(isAllTypesOfApartmentNotifier.notifier).state =
            true;
            ref.read(selectedCityIdToFilter.notifier)
                .state = 0;
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await ref
                  .read(fetchApartmentNotifier.notifier)
                  .fetchApartments(
                  isOwnerApartments: false,
                  isAll: true,
                  cityId: 0);
            });
            ref.read(isBoyStudentNotifier.notifier).state = false;
            ref.read(isGirlStudentNotifier.notifier).state = false;
            ref.read(isFamiliesNotifier.notifier).state = false;
          }),
    )
    ;
  }
}
