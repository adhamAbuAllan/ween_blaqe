import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod
import 'package:ween_blaqe/api/apartments_api/apartments.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';



class ApartmentDescriptionWidget extends ConsumerWidget {
  const ApartmentDescriptionWidget({super.key,
    required this.apartment
  });
  final DataOfOneApartment apartment;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the apartment data from Riverpod

    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(
          10, getIt<AppDimension>().isSmallScreen(context) ? 15 : 20, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: themeMode.isLight
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
                SetLocalization.of(context)!
                    .getTranslateValue("apartment_description"),
                style: TextStyle(
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                  fontSize: getIt<AppDimension>().isSmallScreen(context) ? 18 : 20,
                  fontWeight: FontWeight.w600,
                )),
          ),
          // Display description
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Text(apartment.description ?? "",
                style: TextStyle(
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
                    fontSize: getIt<AppDimension>().isSmallScreen(context) ? 15 : 16,
                    height: 1.6,
                    wordSpacing: 1.3)),
          ),
        ],
      ),
    );
  }
}