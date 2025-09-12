import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../controller/provider_controllers/providers/apartment_provider.dart';

class TitleNotFoundWidget extends ConsumerWidget {
  const TitleNotFoundWidget({
    super.key,
  });

  String ?typeName(int typeId) {
    switch (typeId) {
      case 1:
        return "عائلات";
      case 2:
        return "طلاب";
      case 3:
        return "طالبات";

    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var type = ref.watch(apartmentTypeNotifier.notifier).state;
    String ?typeNameUI = typeName(type);
    return Row(
      children: [
        //this container have 6 Text Widgets that in Row because
        // they tow items container and expanded widget
        Column(children: [
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
                " ${SetLocalization.of(context)!.getTranslateValue
                  ("housing_type")}$typeNameUI ${SetLocalization.of(context)!
                    .getTranslateValue("not_available")} ",
                style: TextStyle(
                  fontSize:
                      getIt<AppDimension>().isSmallScreen(context) ? 16 : 18,
                  inherit: true,
                  color: ref
                      .read(themeModeNotifier.notifier)
                      .textTheme(ref: ref, withOpacity: .6),
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
                "  ${SetLocalization.of(context)!.getTranslateValue("apartments_will_be_added")}$typeNameUI "
                "${SetLocalization.of(context)!.getTranslateValue("coming_soon")} ",
                style: TextStyle(
                  fontSize:
                      getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                  inherit: true,
                  color: ref
                      .read(themeModeNotifier.notifier)
                      .textTheme(ref: ref, withOpacity: .8),
                )),
          ),
        ]),
        const Expanded(
          child: Text(""),
        ),
      ],
    );
  }
}
