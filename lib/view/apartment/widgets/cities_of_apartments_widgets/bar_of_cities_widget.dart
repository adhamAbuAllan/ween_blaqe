import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ween_blaqe/api/cities.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/auth_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../core/utils/styles/button.dart';
import 'button_of_city_widget.dart';

class CitiesBarWidget extends ConsumerStatefulWidget {
  const CitiesBarWidget({super.key, this.onClick, this.onLocationPress});

  final Function()? onClick;
  final Function()? onLocationPress;

  @override
  ConsumerState createState() => _CitiesBarWidgetState();
}

class _CitiesBarWidgetState extends ConsumerState<CitiesBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      scrollDirection: Axis.horizontal,
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          children: [
            ref.watch(mapStateProvider).loadingLocation
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CircularProgressIndicator(
                      color: ref
                          .read(themeModeNotifier.notifier)
                          .primaryTheme(ref: ref),
                    ),
                  )
                : CityButtonWidget(
                    city: City(),
                    onClick: widget.onLocationPress!,
                    context: context,
                    style: ref.watch(fetchApartmentNotifier).apartmentsList
                        .data?.first.distance_in_meters != null
                        ? fullButton(
                                backgroundColor: ref
                                    .read(themeModeNotifier.notifier)
                                    .primaryTheme(ref: ref))
                            .copyWith(
                            foregroundColor:
                                WidgetStateProperty.all<Color>(Colors.white),
                          )
                        : null,
                    child: const Icon(Icons.location_on),
                  ),

            // Generate city buttons from the cities list
            ...ref.watch(cityNotifier).cities.map((c) => CityButtonWidget(
                  context: context,
                  onClick: () async {
                    debugPrint("c.id : ${c.id}");
                    debugPrint(
                        "ref.read(selectedCityIdToFilter.notifier).state : ${ref.read(selectedCityIdToFilter.notifier).state}");
                    if (widget.onClick != null) {
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        ref.read(selectedCityIdToFilter.notifier).state == c.id
                            ? ref.read(selectedCityIdToFilter.notifier).state =
                                0
                            : ref.read(selectedCityIdToFilter.notifier).state =
                                c.id!;
                        await ref
                            .read(fetchApartmentNotifier.notifier)
                            .fetchApartments(
                                isOwnerApartments: false,
                                type: ref.read(isAllTypesOfApartmentNotifier)
                                    ? null
                                    : ref
                                        .read(apartmentTypeNotifier.notifier)
                                        .state,
                                isAll: ref.read(isAllTypesOfApartmentNotifier),
                                cityId: ref
                                    .read(selectedCityIdToFilter.notifier)
                                    .state);
                      });
                    }
                  },
                  style: c.id ==
                              ref.read(selectedCityIdToFilter.notifier).state &&
                          ref.read(selectedCityIdToFilter.notifier).state != 0
                      ? fullButton(
                              backgroundColor: ref
                                  .read(themeModeNotifier.notifier)
                                  .primaryTheme(ref: ref))
                          .copyWith(
                          foregroundColor:
                              WidgetStateProperty.all<Color>(Colors.white),
                        )
                      : outlinedButton(
                          primaryColor: ref
                              .read(themeModeNotifier.notifier)
                              .primaryTheme(ref: ref),
                          containerColor: ref
                              .read(themeModeNotifier.notifier)
                              .containerTheme(ref: ref),
                          context: context),
                  city: c,
                )),
            // Add the custom button at the end of the list
          ],
        ),
      ),
    );
  }
}
