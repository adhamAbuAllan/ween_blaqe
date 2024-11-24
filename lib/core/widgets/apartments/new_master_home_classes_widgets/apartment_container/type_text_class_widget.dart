import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/apartment_container/edit_button_class_wdiget.dart';

import '../../../buttons/delete_button.dart';
import 'bookmark_button_class_widget.dart';

class ApartmentTypeText extends StatelessWidget {
  const ApartmentTypeText(
      {super.key,
      required this.index,
      required this.apartmentsRes,
      required this.isDeleteMode,
      this.onPressed,
      });

  final Apartments apartmentsRes;
  final int index;
  final bool isDeleteMode;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            " سكن ${apartmentsRes.data?[index].type?.name ?? ""}",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                
                color: themeMode.isLight
                    ? kTextColorLightMode
                    : kTextColorDarkMode),
          ),
        ),
        const Expanded(child: Text("")),
        if (isDeleteMode)
          DeleteButton(
            apartmentId: apartmentsRes.data?[index].id ?? 0,
            onPressed: onPressed,
            apartmentsRes: apartmentsRes,
            index: index,
          )
        else if (apiApartmentController.isEditMode.value)
           EditButtonClassWdiget(apartmentsRes: apartmentsRes,apartmentId:
           index,)
        else if (apiApartmentController.isDeleteMode.value == false &&
          apiApartmentController
              .isEditMode
              .value ==
              false)
          BookmarkButton(apartmentId: apartmentsRes.data?[index].id ?? 0),
      ],
    );
  }
}
