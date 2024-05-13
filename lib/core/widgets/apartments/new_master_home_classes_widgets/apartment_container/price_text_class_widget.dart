import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/controller/function_controller/change_theme_mode.dart';

class ApartmentPriceText extends StatefulWidget {
  const ApartmentPriceText({super.key, required this.index, required this.apartmentsRes});
 final OneApartment apartmentsRes;
   final int index;

  @override
  State<ApartmentPriceText> createState() => _ApartmentPriceTextState();
}

class _ApartmentPriceTextState extends State<ApartmentPriceText> {
  ChangeThemeMode themeMode = Get.find();

  @override
  Widget build(BuildContext context) {
    return               Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 3, 0),
          child:
          Text((widget.apartmentsRes.data?[widget.index].price.toString()) ?? "0",
              style:  TextStyle(
                color: themeMode.isDark ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
                fontSize: 16,
                fontFamily: 'IBM',
              )),
        ),
        //  Padding(
        //   padding: const EdgeInsets.fromLTRB(10, 0, 3, 0),
        //   child: Text("ش/ش",
        //       style: TextStyle(
        //         color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode,
        //         fontSize: 12,
        //         fontFamily: 'IBM',
        //       )),
        // ),
      ],
    );

  }
}
