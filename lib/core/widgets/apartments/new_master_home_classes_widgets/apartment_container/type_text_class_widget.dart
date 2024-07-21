import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/constants/nums.dart';

import 'bookmark_button_class_widget.dart';

class ApartmentTypeText extends StatefulWidget {
 const ApartmentTypeText({super.key, required this.index, required this.apartmentsRes});
  final OneApartment apartmentsRes;
  final int index;

  @override
  State<ApartmentTypeText> createState() => _ApartmentTypeTextState();
}

class _ApartmentTypeTextState extends State<ApartmentTypeText> {
  @override
  Widget build(BuildContext context) {
    return           Row(
      children: [
        Padding(
          padding:  const EdgeInsets.all(8.0),
          child: Text(
            " سكن ${widget.apartmentsRes.data?[widget.index].type?.name ?? ""}",
            style:  TextStyle(
                fontSize: 14,
                fontFamily: 'IBM',
                color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode),
          ),
        ),
        const Expanded(child: Text("")),
        BookmarkButton(apartmentIndex: widget.index),
      ],
    );
  }
}
