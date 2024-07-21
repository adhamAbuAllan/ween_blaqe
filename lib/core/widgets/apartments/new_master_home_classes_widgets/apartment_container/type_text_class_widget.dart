import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/constants/nums.dart';

import '../../../buttons/delete_button.dart';
import 'bookmark_button_class_widget.dart';

class ApartmentTypeText extends StatelessWidget {
 const ApartmentTypeText({super.key, required this.index, required this
     .apartmentsRes, required this.isDeleteMode, this.onPressed});
  final OneApartment apartmentsRes;
  final int index;
  final bool isDeleteMode;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return           Row(
      children: [
        Padding(
          padding:  const EdgeInsets.all(8.0),
          child: Text(
            " سكن ${apartmentsRes.data?[index].type?.name ?? ""}",
            style:  TextStyle(
                fontSize: 14,
                fontFamily: 'IBM',
                color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode),
          ),
        ),
        const Expanded(child: Text("")),

        if (isDeleteMode)
          DeleteButton(apartmentId: apartmentsRes.data?[index].id ?? 0,
            onPressed: onPressed,apartmentsRes: apartmentsRes,index: index,)
        else
          BookmarkButton(apartmentId: apartmentsRes.data?[index].id ?? 0),      ],
    );
  }
}
