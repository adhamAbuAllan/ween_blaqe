import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';



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
          10, getIt<AppDimension>().isSmallScreen(context) ? 15 : 20, 10, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
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
                  color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                  fontSize: getIt<AppDimension>().isSmallScreen(context) ? 18 : 20,
                  fontWeight: FontWeight.w600,
                )),
          ),
          // Display description
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Text(apartment.description ?? "",
                style: TextStyle(
                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                    fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                    height: 1.6,
                    wordSpacing: 1.3)),
          ),
        ],
      ),
    );
  }
}
