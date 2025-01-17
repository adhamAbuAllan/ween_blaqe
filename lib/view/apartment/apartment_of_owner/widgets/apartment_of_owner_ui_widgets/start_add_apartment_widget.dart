import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/localization.dart';
import '../../../../common_widgets/empty_screen_widget.dart';

class StartAddApartmentWidget extends ConsumerWidget {
  const StartAddApartmentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return EmptyScreenWidget(
      centerIcon: Icons.apartment,
      centerText: SetLocalization.of(context)!
          .getTranslateValue("your_ads_displayed_here"),
      centerIconInUnderCenterText: Icons.add_home_outlined,
      underCenterTextBeforeIcon: SetLocalization.of(context)!
          .getTranslateValue("click_on_the_button"),
      underCenterTextAfterIcon: SetLocalization.of(context)!
          .getTranslateValue("to_create_new_ad"),
    )
    ;
  }
}
