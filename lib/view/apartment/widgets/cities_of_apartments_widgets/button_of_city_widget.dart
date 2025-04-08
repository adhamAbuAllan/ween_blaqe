import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/constants/get_it_controller.dart';

import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/outline_button_widget.dart';

import '../../../../api/cities.dart';

class CityButtonWidget extends ConsumerWidget {
  final City city;
  final Function onClick;
  final ButtonStyle? style;
  final BuildContext context;
  final Widget? child;

  const CityButtonWidget(
      {super.key,
      required this.city,
      required this.onClick,
      this.style,
      required this.context,
      this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the selected city state (if you're using state management)

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: getIt<AppDimension>().isSmallScreen(context) ? 35 : 40,
        child: OutlinedButtonWidget(
          buttonStyle: style,
          onPressed: () async {

            onClick.call();
          },
          child: child ??
              Text(
                city.name ??
                    SetLocalization.of(context)!
                        .getTranslateValue("loading..."),
              ),
        ),
      ),
    );
  }
}
