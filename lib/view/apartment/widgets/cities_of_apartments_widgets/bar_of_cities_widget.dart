import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/api/cities.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';
import 'package:ween_blaqe/view/common_widgets/animations_widgets/build_animation_widget.dart';

import '../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../core/utils/styles/button.dart';
import 'button_of_city_widget.dart';

class CitiesBarWidget extends ConsumerStatefulWidget {
  const CitiesBarWidget({
    super.key,
    this.onClick,
    this.onLocationPress,
    this.onTypePress,
  });

  final Function()? onClick;
  final Function()? onLocationPress;
  final Function()? onTypePress;

  @override
  ConsumerState createState() => _CitiesBarWidgetState();
}

class _CitiesBarWidgetState extends ConsumerState<CitiesBarWidget> {
  @override
  Widget build(BuildContext context) {
    final List<String> buttonLabels = [
      "مالك",
      "مكتب عقاري",
    ];
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      scrollDirection: Axis.horizontal,
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          children: [
            // ref.watch(mapStateProvider).loadingLocation
            //     ? Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 15),
            //         child: CircularProgressIndicator(
            //           color: ref
            //               .read(themeModeNotifier.notifier)
            //               .primaryTheme(ref: ref),
            //         ),
            //       )
            //     : CityButtonWidget(
            //         city: City(),
            //         onClick: widget.onLocationPress!,
            //         context: context,
            //         style: ref
            //                     .watch(fetchApartmentNotifier)
            //                     .apartmentsList
            //                     .data
            //                     ?.first
            //                     .distance_in_meters !=
            //                 null
            //             ? fullButton(
            //                     backgroundColor: ref
            //                         .read(themeModeNotifier.notifier)
            //                         .primaryTheme(ref: ref))
            //                 .copyWith(
            //                 foregroundColor:
            //                     WidgetStateProperty.all<Color>(Colors.white),
            //               )
            //             : null,
            //         child: const Icon(Icons.location_on),
            //       ),

            // Generate city buttons from the cities list


            Row(
              children: List.generate(ref.watch(cityNotifier).cities.length,
                      (index) {
                int indexPlusOne = index + 1;
                final isSelected = ref.watch(selectedCityIdToFilter) == indexPlusOne;
                debugPrint("index: $index, isSelected: $isSelected");
                return ref.watch(selectedCityIdToFilter) == 0 ||
                    ref.watch(selectedCityIdToFilter) == indexPlusOne
                    ? FadeInOnVisible(
                  delay: Duration(milliseconds: indexPlusOne + 1 * 300),
                  //for owner type id
                  child: CityButtonWidget(
                    city: City(),
                    onClick: () async {
                      if (indexPlusOne !=
                          ref.read(selectedCityIdToFilter.notifier).state) {
                        ref.read(selectedCityIdToFilter.notifier).state =
                            indexPlusOne;

                      } else {
                        ref.read(selectedCityIdToFilter.notifier).state = 0;
                      }
                      await widget.onClick?.call();
                      debugPrint("a value of city id: ${ref.read
                        (selectedCityIdToFilter.notifier).state}");
                    },
                    context: context,
                    style: isSelected
                        ? fullButton(
                        backgroundColor: ref
                            .read(themeModeNotifier.notifier)
                            .primaryTheme(ref: ref))
                        .copyWith(
                      foregroundColor:
                      WidgetStateProperty.all<Color>(
                          Colors.white),
                    )
                        : null,
                    child: Text(ref.watch(cityNotifier).cities[index].name
                        .toString()),
                  ),
                )
                    : const SizedBox();
              }),
            ),
            // ...ref.watch(cityNotifier).cities.map((c) => FadeInOnVisible(
            //       delay: Duration(milliseconds: c.id! * 100),
            //   child: CityButtonWidget(
            //         context: context,
            //         onClick: () async {
            //           debugPrint("c.id : ${c.id}");
            //           debugPrint(
            //               "ref.read(selectedCityIdToFilter.notifier).state : ${ref.read(selectedCityIdToFilter.notifier).state}");
            //           if (widget.onClick != null) {
            //             WidgetsBinding.instance.addPostFrameCallback((_) async {
            //               ref.read(selectedCityIdToFilter.notifier).state == c.id
            //                   ? ref.read(selectedCityIdToFilter.notifier).state =
            //                       0
            //                   : ref.read(selectedCityIdToFilter.notifier).state =
            //                       c.id??0;
            //               await ref
            //                   .read(fetchApartmentNotifier.notifier)
            //                   .fetchApartments(
            //                 ref: ref,
            //                       isOwnerApartments: false,
            //                   typeId: ref.read(isAllTypesOfApartmentNotifier)
            //                           ? null
            //                           : ref
            //                               .read(apartmentTypeNotifier.notifier)
            //                               .state,
            //                       isAll: ref.read(isAllTypesOfApartmentNotifier),
            //                       cityId: ref
            //                           .read(selectedCityIdToFilter.notifier)
            //                           .state);
            //             });
            //           }
            //         },
            //         style: c.id ==
            //                     ref.read(selectedCityIdToFilter.notifier).state &&
            //                 ref.read(selectedCityIdToFilter.notifier).state != 0
            //             ? fullButton(
            //                     backgroundColor: ref
            //                         .read(themeModeNotifier.notifier)
            //                         .primaryTheme(ref: ref))
            //                 .copyWith(
            //                 foregroundColor:
            //                     WidgetStateProperty.all<Color>(Colors.white),
            //               )
            //             : outlinedButton(
            //                 primaryColor: ref
            //                     .read(themeModeNotifier.notifier)
            //                     .primaryTheme(ref: ref),
            //                 containerColor: ref
            //                     .read(themeModeNotifier.notifier)
            //                     .containerTheme(ref: ref),
            //                 context: context),
            //         city: c,
            //       ),
            // )),

            // Add the custom button at the end of the list
            FadeInOnVisible(
              delay: Duration(milliseconds: buttonLabels.length * 200),
              direction: SlideDirection.y,
              child: VerticalDivider(
                width: 15,
                thickness: 1,
                color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                indent: 5,
                endIndent: 5,
              ),
            ),

            Row(
              children: List.generate(buttonLabels.length, (index) {
                final isSelected = ref.watch(selectedTypeOwnerId) == index;
                debugPrint("index: $index, isSelected: $isSelected");
                return ref.watch(selectedTypeOwnerId) == -1 ||
                        ref.watch(selectedTypeOwnerId) == index
                    ? FadeInOnVisible(
                        delay: Duration(milliseconds: index + 1 * 300),
                        //for owner type id
                        child: CityButtonWidget(
                          city: City(),
                          onClick: () async {
                            if (index !=
                                ref.read(selectedTypeOwnerId.notifier).state) {
                              ref.read(selectedTypeOwnerId.notifier).state =
                                  index;
                            } else {
                              ref.read(selectedTypeOwnerId.notifier).state = -1;
                            }
                            await widget.onTypePress?.call();
                          },
                          context: context,
                          style: isSelected
                              ? fullButton(
                                      backgroundColor: ref
                                          .read(themeModeNotifier.notifier)
                                          .primaryTheme(ref: ref))
                                  .copyWith(
                                  foregroundColor:
                                      WidgetStateProperty.all<Color>(
                                          Colors.white),
                                )
                              : null,
                          child: Text(buttonLabels[index]),
                        ),
                      )
                    : const SizedBox();
              }),
            ),
            FadeInOnVisible(
              delay: Duration(milliseconds: buttonLabels.length * 200),
              direction: SlideDirection.y,
              child: VerticalDivider(
                width: 15,
                thickness: 1,
                color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                indent: 5,
                endIndent: 5,
              ),
            ),
            Row(
              children: List.generate(5, (index) {
                int indexPlusOne = index + 1;
                final isSelected =
                    ref.watch(selectedStudentReminding) == indexPlusOne;
                debugPrint("index: $index, isSelected: $isSelected");
                return ref.watch(selectedStudentReminding) == 0 ||
                        ref.watch(selectedStudentReminding) == indexPlusOne
                    ? FadeInOnVisible(
                        isUIHaveScroll: false,
                        delay: const Duration(milliseconds: 800),
                        child: CityButtonWidget(
                          city: City(),
                          onClick: () async {
                            if (ref.watch(selectedStudentReminding) ==
                                indexPlusOne) {
                              ref
                                  .read(selectedStudentReminding.notifier)
                                  .state = 0;
                            } else {
                              ref
                                  .read(selectedStudentReminding.notifier)
                                  .state = indexPlusOne;
                            }
                            await widget.onTypePress?.call();
                          },
                          context: context,
                          style: isSelected
                              ? fullButton(
                                      backgroundColor: ref
                                          .read(themeModeNotifier.notifier)
                                          .primaryTheme(ref: ref))
                                  .copyWith(
                                  foregroundColor:
                                      WidgetStateProperty.all<Color>(
                                          Colors.white),
                                )
                              : null,
                          child: Text(indexPlusOne.toString()),
                        ),
                      )
                    : const SizedBox();
              }),
            ),
            // Add the custom button at the end of the list
          ],
        ),
      ),
    );
  }
}
