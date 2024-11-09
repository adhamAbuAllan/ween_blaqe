import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/types_of_apartments_list/pointer_of_type.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/types_of_apartments_list/type_item_button.dart';

import '../../../../../controller/get_controllers.dart';

class ApartmentShowTypesContainer extends StatelessWidget {
  const ApartmentShowTypesContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 55.0, horizontal: 10),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 7,
                color: themeMode.isLight
                    ? kBackgroundAppColorLightMode
                    : kBackgroundAppColorDarkMode,
                strokeAlign: BorderSide.strokeAlignOutside),
            color: themeMode.isLight
                ? kContainerColorLightMode
                : kContainerColorDarkMode,
            borderRadius: BorderRadiusDirectional.circular(7),
          ),
          height: 200,
          width: 150,
          child: child),
    );
  }
}

class TypeRowOfBoyStudent extends StatelessWidget {
  const TypeRowOfBoyStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ApartmentShowTypesTextButton(
          textType: SetLocalization.of(context)!.getTranslateValue("students"),
          onPressed: () {
            apartmentModelController.isLoading.value = false;
            apartmentModelController.apartmentType.value = "طلاب";

            apartmentModelController.fetchApartments(
                isOwnerApartments: false,
                isAll: false,
                type: apartmentModelController.apartmentType.value,
                cityId: cityModelController.cityId.value);

            apartmentModelController.isBoyStudent.value = true;
            apartmentModelController.isGirlStudent.value = false;
            apartmentModelController.isFamilies.value = false;
            apartmentModelController.isAllTypesOfApartment.value = false;
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: AnimatedOpacity(
              opacity: apartmentModelController.isBoyStudent.value ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: Obx(() => apartmentModelController.isBoyStudent.value
                  ? const ApartmentShowTypesPointer()
                  : const SizedBox())),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}

class TypeRowOfGirlStudent extends StatelessWidget {
  const TypeRowOfGirlStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ApartmentShowTypesTextButton(
          textType: SetLocalization.of(context)!.getTranslateValue("female_students"),
          onPressed: () {
            apartmentModelController.isLoading.value = false;

            apartmentModelController.apartmentType.value = "طالبات";

            apartmentModelController.fetchApartments(
                isOwnerApartments: false,
                isAll: false,
                type: apartmentModelController.apartmentType.value,
                cityId: cityModelController.cityId.value);

            apartmentModelController.isBoyStudent.value = false;
            apartmentModelController.isGirlStudent.value = true;
            apartmentModelController.isFamilies.value = false;
            apartmentModelController.isAllTypesOfApartment.value = false;
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: AnimatedOpacity(
              opacity: apartmentModelController.isGirlStudent.value ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: Obx(() => apartmentModelController.isGirlStudent.value
                  ? const ApartmentShowTypesPointer()
                  : const SizedBox())),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}

class TypeRowOfFamilies extends StatelessWidget {
  const TypeRowOfFamilies({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ApartmentShowTypesTextButton(
          textType: SetLocalization.of(context)!.getTranslateValue("families"),
          onPressed: () {
            apartmentModelController.isLoading.value = false;

            apartmentModelController.apartmentType.value = "عائلات";

            apartmentModelController.fetchApartments(
                isOwnerApartments: false,
                isAll: false,
                type: apartmentModelController.apartmentType.value,
                cityId: cityModelController.cityId.value);
            apartmentModelController.isBoyStudent.value = false;
            apartmentModelController.isGirlStudent.value = false;
            apartmentModelController.isFamilies.value = true;
            apartmentModelController.isAllTypesOfApartment.value = false;
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: AnimatedOpacity(
              opacity: apartmentModelController.isFamilies.value ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child:Obx(() => apartmentModelController.isFamilies.value
                  ? const ApartmentShowTypesPointer()
                  : const SizedBox()) ),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}

class TypeRowOfAllTypes extends StatelessWidget {
  const TypeRowOfAllTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        ApartmentShowTypesTextButton(
          textType: SetLocalization.of(context)!.getTranslateValue("all_types"),
          onPressed: () {
            apartmentModelController.isLoading.value = false;

            apartmentModelController.fetchApartments(
              isAll: true,
              cityId: cityModelController.cityId.value,
              isOwnerApartments: false,
            );

            // Reset other apartment types
            apartmentModelController.isBoyStudent.value = false;
            apartmentModelController.isGirlStudent.value = false;
            apartmentModelController.isFamilies.value = false;
            apartmentModelController.isAllTypesOfApartment.value = true;
          },
        ),
        
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Obx(() => apartmentModelController.isAllTypesOfApartment.value
              ? const ApartmentShowTypesPointer()
              : const SizedBox()),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
