import 'package:flutter/material.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import '../../../constants/localization.dart';
import '../../../constants/nums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/provider_controllers/providers/auth_provider.dart';

class BottomNavigationBarWidget extends ConsumerWidget {
  final ScrollController? scrollController;

  const BottomNavigationBarWidget({
    super.key,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexNotifier = ref.read(btmNavBarIndexNotifier);

    return BottomNavigationBar(
      selectedLabelStyle: const TextStyle(fontFamily: 'IBM'),
      unselectedLabelStyle: const TextStyle(),
      backgroundColor: themeMode.isLight
          ? kContainerColorLightMode
          : kContainerColorDarkMode,
      selectedItemColor:
      themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      iconSize: 30,
      elevation: 0,
      currentIndex: indexNotifier,
      onTap: (i) {
        if (i == 0 && indexNotifier == 0) {
          debugPrint("hasApartmentChanged -- ${ref.watch
            (isApartmentDataChangedNotifier.notifier).hasAnyChange(ref)}");
          debugPrint("scrollController offset is ${scrollController?.offset}");
          // Scroll to top when already on the home page
          if (scrollController != null && scrollController!.offset > 400) {
            scrollController!.animateTo(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          } else if (i == 0 &&
              indexNotifier == 0 &&
              scrollController!.offset < 100) {
            ref.read(isAllTypesOfApartmentNotifier.notifier).state =
            true;
            ref.watch(cityNotifier).cityId = 0;
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await ref
                  .read(fetchApartmentNotifier.notifier)
                  .fetchApartments(
                  isOwnerApartments: false,
                  isAll: true,
                  cityId: 0);
            });
            ref.read(isBoyStudentNotifier.notifier).state = false;
            ref.read(isGirlStudentNotifier.notifier).state = false;
            ref.read(isFamiliesNotifier.notifier).state = false;

          }
        }
        ref.read(btmNavBarIndexNotifier.notifier).changeTo(i);
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
          label: SetLocalization.of(context)!.getTranslateValue("home"),
          activeIcon: const Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_repair_service_outlined),
          label: SetLocalization.of(context)!.getTranslateValue("orders"),
          activeIcon: const Icon(Icons.home_repair_service),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person_2_outlined),
          label: SetLocalization.of(context)!.getTranslateValue("my_account"),
          activeIcon: const Icon(Icons.person_2),
        ),
      ],
    );
  }
}
