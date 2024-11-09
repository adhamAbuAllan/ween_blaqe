import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';
class DescriptionOfApartmentContainerWidget extends StatefulWidget {
  const DescriptionOfApartmentContainerWidget({super.key, required this.oneApartment});
final DataOfOneApartment oneApartment;
  @override
  State<DescriptionOfApartmentContainerWidget> createState() => _DescriptionOfApartmentContainerWidgetState();
}

class _DescriptionOfApartmentContainerWidgetState extends State<DescriptionOfApartmentContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(
          10,
          getIt<AppDimension>().isSmallScreen(context) ? 15 : 20,
          10,
          0),
      // discription.length.toDouble() * 2,
      //decoration of show apartment style
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: themeMode.isLight
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 10, horizontal: 20),
            child: Text(
                SetLocalization.of(context)!
                    .getTranslateValue("apartment_description"),
                style: TextStyle(
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                  fontSize:
                  getIt<AppDimension>().isSmallScreen(context)
                      ? 18
                      : 20,
                  fontWeight: FontWeight.w600,
                )),
          ),
          //description
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Text(widget.oneApartment.description ?? "",
                style: TextStyle(
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
                    fontSize:
                    getIt<AppDimension>().isSmallScreen(context)
                        ? 15
                        : 16,
                    height: 1.6,
                    wordSpacing: 1.3)),
          ),
        ],
      ),
    );
  }
}
