import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:ween_blaqe/constants/localization.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/nums.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod

import '../../../controller/provider_controllers/providers/color_provider.dart';
import 'widgets/show_all_advantages_widget.dart';

class ShowAllAdvantagesUi extends ConsumerWidget {
  const ShowAllAdvantagesUi({super.key, this.oneApartment});

  final DataOfOneApartment ? oneApartment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the advantages state from Riverpod

    // Check if data is still loading


    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: Scaffold(
        backgroundColor:ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref)
,
        appBar: AppBar(
          title: Text(
              SetLocalization.of(context)!.getTranslateValue("all_advantages"),
              style: TextStyle(
                color: Colors.white,
                fontSize:
                getIt<AppDimension>().isSmallScreen(context) ? 18 : 20,
                fontWeight: FontWeight.w600,
              )),
          backgroundColor: themeMode.isLight
              ? kPrimaryColorLightMode
              : kPrimaryColorDarkMode,
        ),
        body: ShowAllAdvantagesWidget(oneApartment: oneApartment),
      ),
    );
  }
}
