import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../core/utils/styles/button.dart';
import '../show_all_advantages_ui.dart';

class ShowAllAdvantagesButtonWidget extends ConsumerWidget {
  const ShowAllAdvantagesButtonWidget({super.key,
  required this.oneApartment
  });
final DataOfOneApartment  oneApartment;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var advantages = oneApartment.advantages;
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
      child: SizedBox(
        width: double.infinity,
        height: getIt<AppDimension>().isSmallScreen(context)
            ? 55 / 1.2
            : 55,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return ShowAllAdvantagesUi(oneApartment: oneApartment,);
              }),
            );
          },
          style: fullButton(),
          child: Text(
            "${SetLocalization.of(context)!.getTranslateValue(
                "view_other_advantages")} ${(advantages?.length ?? 0) -
                10} ${SetLocalization.of(context)!.getTranslateValue(
                "other")}",
            style: TextStyle(
              fontSize: getIt<AppDimension>().isSmallScreen(context)
                  ? 15
                  : null,
            ),
          ),
        ),
      ),
    );

  }
}
