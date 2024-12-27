import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/view/apartment/widgets/types_of_apartments_widgets'
    '/pointer_type_widget.dart';

import '../../../../constants/nums.dart';
import '../../../../controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/constants/coordination.dart';

import '../../../../../constants/get_it_controller.dart';
import '../../../../../session/new_session.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';

class ShowApartmentTypesBoxWidget extends ConsumerWidget {
  const ShowApartmentTypesBoxWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the visibility state of both the box and the list

    var isListOfTypes = ref.watch(isListOfTypesNotifier);
    var isBoxVisible = ref.watch(isSebhaVisibleNotifier);
    return SizedBox(
      child: isListOfTypes && isBoxVisible
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 155.0, horizontal: 15),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 7,
                        color: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref)
                        ,
                        strokeAlign: BorderSide.strokeAlignOutside),
                    color: ref.read(themeModeNotifier.notifier).containerTheme(ref: ref)
                    ,
                    borderRadius: BorderRadiusDirectional.circular(7),
                  ),
                  height: 200,
                  width: 150,
                  child: const Padding(
                      padding: EdgeInsets.only(top: 0, left: 8, right: 8),
                      child: Column(
                        children: [
                          TypeRowOfBoyStudent(),
                          TypeRowOfGirlStudent(),
                          TypeRowOfFamilies(),
                          TypeRowOfAllTypes(),
                        ],
                      ))),
            )
          : null,
    );
  }
}

class ApartmentShowTypesTextButtonWidget extends ConsumerWidget {
  final String textType;
  final void Function()? onPressed;

  const ApartmentShowTypesTextButtonWidget(
      {super.key, this.onPressed, required this.textType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the theme mode from Riverpod state
    // final themeMode = ref.watch(themeModeProvider);

    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 10),
          ),
          alignment: NewSession.get("language", "ar") == "en"
              ? Alignment.centerLeft
              : Alignment.centerRight,
          overlayColor: WidgetStatePropertyAll(
            ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          textType,
          style: TextStyle(
            color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
            fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 15,
            fontFamily: 'IBM',
          ),
        ),
      ),
    );
  }
}

class TypeRowOfBoyStudent extends ConsumerWidget {
  const TypeRowOfBoyStudent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBoyStudent = ref.watch(isBoyStudentNotifier);

    return Row(
      children: [
        ApartmentShowTypesTextButtonWidget(
          textType: "طلاب", // Change this as per localization
          onPressed: () {
            ref.read(isBoyStudentNotifier.notifier).state = true;
            ref.read(isGirlStudentNotifier.notifier).state = false;
            ref.read(isFamiliesNotifier.notifier).state = false;
            ref.read(isAllTypesOfApartmentNotifier.notifier).state = false;

            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await ref.read(fetchApartmentNotifier.notifier).fetchApartments(
                  isOwnerApartments: false,
                  type: "طلاب",
                  isAll: false,
                  cityId: ref.read(selectedCityIdToFilter.notifier).state);
            });
            ref.read(apartmentTypeNotifier.notifier).state = "طلاب";
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: AnimatedOpacity(
            opacity: isBoyStudent ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: isBoyStudent ? const PointerTypeWidget() : const SizedBox(),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}

class TypeRowOfGirlStudent extends ConsumerWidget {
  const TypeRowOfGirlStudent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isGirlStudent = ref.watch(isGirlStudentNotifier);

    return Row(
      children: [
        ApartmentShowTypesTextButtonWidget(
          textType: "طالبات", // Change this as per localization
          onPressed: () {
            ref.read(isBoyStudentNotifier.notifier).state = false;
            ref.read(isGirlStudentNotifier.notifier).state = true;
            ref.read(isFamiliesNotifier.notifier).state = false;
            ref.read(isAllTypesOfApartmentNotifier.notifier).state = false;

            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await ref.read(fetchApartmentNotifier.notifier).fetchApartments(
                  isOwnerApartments: false,
                  type: "طالبات",
                  isAll: false,
                  cityId: ref.read(selectedCityIdToFilter.notifier).state);
            });
            ref.read(apartmentTypeNotifier.notifier).state = "طالبات";
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: AnimatedOpacity(
            opacity: isGirlStudent ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: isGirlStudent ? const PointerTypeWidget() : const SizedBox(),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}

class TypeRowOfFamilies extends ConsumerWidget {
  const TypeRowOfFamilies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFamilies = ref.watch(isFamiliesNotifier);

    return Row(
      children: [
        ApartmentShowTypesTextButtonWidget(
          textType: "عائلات", // Change this as per localization
          onPressed: () {
            ref.read(isFamiliesNotifier.notifier).state = true;
            ref.read(isBoyStudentNotifier.notifier).state = false;
            ref.read(isGirlStudentNotifier.notifier).state = false;
            ref.read(isAllTypesOfApartmentNotifier.notifier).state = false;

            WidgetsBinding.instance.addPostFrameCallback(
              (_) async {
                await ref.read(fetchApartmentNotifier.notifier).fetchApartments(
                      isOwnerApartments: false,
                      type: "عائلات",
                      isAll: false,
                      cityId: ref.read(selectedCityIdToFilter.notifier).state,
                    );
              },
            );
            ref.read(apartmentTypeNotifier.notifier).state = "عائلات";
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: AnimatedOpacity(
            opacity: isFamilies ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: isFamilies ? const PointerTypeWidget() : const SizedBox(),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}

class TypeRowOfAllTypes extends ConsumerWidget {
  const TypeRowOfAllTypes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAllTypesOfApartment = ref.watch(isAllTypesOfApartmentNotifier);

    return Row(
      children: [
        ApartmentShowTypesTextButtonWidget(
          textType: "الكل", // Change this as per localization
          onPressed: () {
            ref.read(isAllTypesOfApartmentNotifier.notifier).state = true;
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await ref.read(fetchApartmentNotifier.notifier).fetchApartments(
                  isOwnerApartments: false, isAll: true, cityId: 0);
            });
            ref.read(isBoyStudentNotifier.notifier).state = false;
            ref.read(isGirlStudentNotifier.notifier).state = false;
            ref.read(isFamiliesNotifier.notifier).state = false;
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: AnimatedOpacity(
            opacity: isAllTypesOfApartment ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: ref.watch(isAllTypesOfApartmentNotifier.notifier).state
                ? const PointerTypeWidget()
                : const SizedBox(),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
