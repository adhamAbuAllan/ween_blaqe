import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/nums.dart';
import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../controller/provider_controllers/providers/apartment_provider.dart';

class PointerTypeWidget extends ConsumerWidget {
  const PointerTypeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isPointerVisible = ref.watch(isBoyStudentNotifier) ||
        ref.watch(isGirlStudentNotifier) ||
        ref.watch(isFamiliesNotifier) ||
        ref.watch(isAllTypesOfApartmentNotifier);

    // If pointer is visible, render it; otherwise, return SizedBox
    return isPointerVisible
        ? Container(
      width: getIt<AppDimension>().isSmallScreen(context) ? (50 / 3) : (50 / 2.7),
      height: getIt<AppDimension>().isSmallScreen(context) ? (50 / 3) : (50 / 2.7),
      decoration: BoxDecoration(
        color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        borderRadius: BorderRadiusDirectional.circular(
          getIt<AppDimension>().isSmallScreen(context) ? (7 / 2.5) : (7 / 2),
        ),
        border: Border.all(
          color: themeMode.isLight ? kPrimaryColor300LightMode : kPrimaryColor300DarkMode,
          strokeAlign: BorderSide.strokeAlignOutside,
          width: getIt<AppDimension>().isSmallScreen(context) ? (7 / 2.5) : (7 / 2),
        ),
      ),
    )
        : const SizedBox();  // Return an empty box when the pointer is not visible
  }
}
