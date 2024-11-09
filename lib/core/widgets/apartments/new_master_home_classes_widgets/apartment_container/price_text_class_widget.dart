import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/controller/function_controller/change_theme_mode.dart';

class ApartmentPriceText extends StatefulWidget {
  const ApartmentPriceText(
      {super.key, required this.index, required this.apartmentsRes});

  final OneApartment apartmentsRes;
  final int index;

  @override
  State<ApartmentPriceText> createState() => _ApartmentPriceTextState();
}

class _ApartmentPriceTextState extends State<ApartmentPriceText> {
  ChangeThemeMode themeMode = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
          child: Text(
            "${SetLocalization.of(context)!.getTranslateValue("rent")}: "
                "${widget.apartmentsRes.data?[widget.index].price ?? ""
            // data.

            } ",
            style: TextStyle(
              color: themeMode.isLight
                  ? kPrimaryColorLightMode
                  : kPrimaryColorDarkMode,
              fontWeight: FontWeight.w600,
              
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 3, 10),
          child: Text(SetLocalization.of(context)!.getTranslateValue("shekel_per_month"),
              style: TextStyle(
                color: themeMode.isLight
                    ? kPrimaryColorLightMode
                    : kPrimaryColorDarkMode,
                fontWeight: FontWeight.w300 ,
                fontSize: 15,
                
              )),
        ),
      ],
    );
  }
}
