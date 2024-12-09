import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../constants/localization.dart';
import '../../../../constants/nums.dart';
import '../../../../controller/provider_controllers/providers/apartment_provider.dart';

class TitleNotFoundWidget extends ConsumerWidget {
  const TitleNotFoundWidget({super.key,});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var type = ref.watch(apartmentTypeNotifier.notifier).state;
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
                  ("housing_type")}$type ${SetLocalization.of(context)!.getTranslateValue("not_available")} ",
                style: TextStyle(
                  fontSize: 18.0,
                  inherit: true,
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode.withOpacity(.6),
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
                "  ${SetLocalization.of(context)!.getTranslateValue
                  ("apartments_will_be_added")}$type "
                "${SetLocalization.of(context)!.getTranslateValue("coming_soon")} ",
                style: TextStyle(
                  fontSize: 16.0,
                  inherit: true,
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode.withOpacity(.8),
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
