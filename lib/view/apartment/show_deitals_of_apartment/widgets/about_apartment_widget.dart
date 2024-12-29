import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/color_provider.dart';

import '../../../../api/apartments_api/apartments.dart';
import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../core/utils/styles/button.dart';

class AboutApartmentWidget extends ConsumerWidget {
  const AboutApartmentWidget({
    super.key,
    required this.oneApartment,
    required this.imageAboutApartmentRoom,
  });

  final DataOfOneApartment oneApartment;
  final String imageAboutApartmentRoom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          10, getIt<AppDimension>().isSmallScreen(context) ? 15 : 20, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // about apartment text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              SetLocalization.of(context)!.getTranslateValue("about_apartment"),
              style: TextStyle(
                fontSize:
                    getIt<AppDimension>().isSmallScreen(context) ? 18 : 20,
                fontWeight: FontWeight.w600,
                color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
              ),
            ),
          ),

          // about apartment items
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 90,
                  width: 10,
                ),
                Flexible(
                  child: AnimateRoomBox(
                    oneApartment: oneApartment,
                    imageAboutApartmentRoom: imageAboutApartmentRoom,
                  ),
                ),
                Flexible(
                  child: AnimateBathRoomBox(oneApartment: oneApartment),
                ),
                Flexible(
                  child: AnimateAreaBox(oneApartment: oneApartment),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Define providers for each state
class AnimateRoomBox extends ConsumerWidget {
  const AnimateRoomBox({
    super.key,
    required this.oneApartment,
    required this.imageAboutApartmentRoom,
  });

  final DataOfOneApartment oneApartment;
  final String imageAboutApartmentRoom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRoomSizeChange = ref.watch(roomSizeChangeProvider);

    return Padding(
      padding: const EdgeInsets.all(5),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          border: Border.all(
            color: isRoomSizeChange
                ? (ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref))
                : (ref
                    .read(themeModeNotifier.notifier)
                    .primary300Theme(ref: ref)),
            width: isRoomSizeChange ? 1.5 : .5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: OutlinedButton(
          onPressed: () {
            ref.read(roomSizeChangeProvider.notifier).state = !isRoomSizeChange;
          },
          style: outlinedButton(
                  primaryColor: ref
                      .read(themeModeNotifier.notifier)
                      .primaryTheme(ref: ref),
                  containerColor: ref
                      .read(themeModeNotifier.notifier)
                      .containerTheme(ref: ref),
                  context: context)
              .copyWith(
            padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          ),
          child: Column(
            children: [
              Text(
                SetLocalization.of(context)!.getTranslateValue("rooms"),
                style: TextStyle(
                  color:
                      ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) => ScaleTransition(
                        scale: animation,
                        child: child,
                      ),
                      child: isRoomSizeChange
                          ? Text(
                              "${oneApartment.rooms ?? 0}",
                              key: const ValueKey('roomsCount'),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ref
                                    .read(themeModeNotifier.notifier)
                                    .primaryTheme(ref: ref),
                              ),
                            )
                          : Text(
                              "${oneApartment.rooms ?? 0}",
                              key: const ValueKey('roomsCountStatic'),
                              style: TextStyle(
                                color: ref
                                    .read(themeModeNotifier.notifier)
                                    .textTheme(ref: ref),
                              ),
                            ),
                    ),
                  ),
                  Image(
                    image: AssetImage(imageAboutApartmentRoom),
                    width: 32,
                    height: 32,
                    color: ref
                        .read(themeModeNotifier.notifier)
                        .textTheme(ref: ref),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimateBathRoomBox extends ConsumerWidget {
  const AnimateBathRoomBox({
    super.key,
    required this.oneApartment,
  });

  final DataOfOneApartment oneApartment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRoomBathSizeChange = ref.watch(bathSizeChangeProvider);

    return Padding(
      padding: const EdgeInsets.all(5),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          border: Border.all(
            color: isRoomBathSizeChange
                ? (ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref))
                : (ref
                    .read(themeModeNotifier.notifier)
                    .primary300Theme(ref: ref)),
            width: isRoomBathSizeChange ? 1.5 : .5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: OutlinedButton(
          onPressed: () {
            ref.read(bathSizeChangeProvider.notifier).state =
                !isRoomBathSizeChange;
          },
          style: outlinedButton(
                  primaryColor: ref
                      .read(themeModeNotifier.notifier)
                      .primaryTheme(ref: ref),
                  containerColor: ref
                      .read(themeModeNotifier.notifier)
                      .containerTheme(ref: ref),
                  context: context)
              .copyWith(
            padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          ),
          child: Column(
            children: [
              Text(
                SetLocalization.of(context)!.getTranslateValue("bathrooms"),
                style: TextStyle(
                  color:
                      ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) => ScaleTransition(
                        scale: animation,
                        child: child,
                      ),
                      child: isRoomBathSizeChange
                          ? Text(
                              "${oneApartment.bathrooms ?? 0}",
                              key: const ValueKey('bathroomsCount'),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ref
                                    .read(themeModeNotifier.notifier)
                                    .primaryTheme(ref: ref),
                              ),
                            )
                          : Text(
                              "${oneApartment.bathrooms ?? 0}",
                              key: const ValueKey('bathroomsCountStatic'),
                              style: TextStyle(
                                color: ref
                                    .read(themeModeNotifier.notifier)
                                    .textTheme(ref: ref),
                              ),
                            ),
                    ),
                  ),
                  Image(
                    image: const AssetImage(
                        "assets/images/apartments_images/about_apartment/bathroom.png"),
                    width: 32,
                    height: 32,
                    color: ref
                        .read(themeModeNotifier.notifier)
                        .textTheme(ref: ref),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimateAreaBox extends ConsumerWidget {
  const AnimateAreaBox({
    super.key,
    required this.oneApartment,
  });

  final DataOfOneApartment oneApartment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAreaSizeChange = ref.watch(areaSizeChangeProvider);

    return Padding(
      padding: const EdgeInsets.all(5),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          border: Border.all(
            color: isAreaSizeChange
                ? (ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref))
                : (ref
                    .read(themeModeNotifier.notifier)
                    .primary300Theme(ref: ref)),
            width: isAreaSizeChange ? 1.5 : .5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: OutlinedButton(
          onPressed: () {
            ref.read(areaSizeChangeProvider.notifier).state = !isAreaSizeChange;
          },
          style: outlinedButton(
                  primaryColor: ref
                      .read(themeModeNotifier.notifier)
                      .primaryTheme(ref: ref),
                  containerColor: ref
                      .read(themeModeNotifier.notifier)
                      .containerTheme(ref: ref),
                  context: context)
              .copyWith(
            padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          ),
          child: Column(
            children: [
              Text(
                SetLocalization.of(context)!.getTranslateValue("area"),
                style: TextStyle(
                  color:
                      ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) => ScaleTransition(
                        scale: animation,
                        child: child,
                      ),
                      child: isAreaSizeChange
                          ? Text(
                              "${oneApartment.squareMeters ?? 0} ${SetLocalization.of(context)!.getTranslateValue("m2")}",
                              key: const ValueKey('areaSize'),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ref
                                    .read(themeModeNotifier.notifier)
                                    .primaryTheme(ref: ref),
                              ),
                            )
                          : Text(
                              "${oneApartment.squareMeters ?? 0} ${SetLocalization.of(context)!.getTranslateValue("m2")}",
                              key: const ValueKey('areaSizeStatic'),
                              style: TextStyle(
                                color: ref
                                    .read(themeModeNotifier.notifier)
                                    .textTheme(ref: ref),
                              ),
                            ),
                    ),
                  ),
                  Image(
                    image: const AssetImage(
                        "assets/images/apartments_images/about_apartment/area.png"),
                    width: 32,
                    height: 32,
                    color: ref
                        .read(themeModeNotifier.notifier)
                        .textTheme(ref: ref),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
