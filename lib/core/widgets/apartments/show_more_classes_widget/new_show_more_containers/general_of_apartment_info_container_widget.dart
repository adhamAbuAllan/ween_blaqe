import 'package:flutter/material.dart';

import '../../../../../api/apartments_api/apartments.dart';
import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';

class GeneralOfApartmentInfoContainerWidget extends StatefulWidget {
  const GeneralOfApartmentInfoContainerWidget({super.key,
    this.oneApartment,
    required this.isGirlStudent,
    required this.isBoyStudent,
    required this.isFamilies});

  final DataOfOneApartment? oneApartment;
  final bool isGirlStudent;

  final bool isBoyStudent;

  final bool isFamilies;

  @override
  State<GeneralOfApartmentInfoContainerWidget> createState() =>
      _GeneralOfApartmentInfoContainerWidgetState();
}

class _GeneralOfApartmentInfoContainerWidgetState
    extends State<GeneralOfApartmentInfoContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: getIt<AppDimension>().isSmallScreen(context) ? 250 : 300,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: themeMode.isLight
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // this children have ( general info that : title, price , and location
        // .
        children: [
          const TitleGeneralInfoTextWidget(),
          //title
          TitleTextWidget(oneApartment: widget.oneApartment,),
          // location
          LocationTextWidget(oneApartment: widget.oneApartment,),
          // count of student
          AccountOfStudentTextWidget(
              oneApartment: widget.oneApartment, isBoyStudent:widget.isBoyStudent,
              isGirlStudent:widget.isGirlStudent,
              isFamilies:widget.isFamilies),
          //type of apartment
          TypeOfApartmentTextWidget(oneApartment: widget.oneApartment,),
          //price
          PriceTextWidget(oneApartment: widget.oneApartment,),
        ],
      ),
    );
  }
}

class TitleGeneralInfoTextWidget extends StatelessWidget {
  const TitleGeneralInfoTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      SetLocalization.of(context)!.getTranslateValue("general_info"),
      style: TextStyle(
          fontSize:
          getIt<AppDimension>().isSmallScreen(context) ? 18 : 20,
          fontWeight: FontWeight.w600,
          color:
          themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode
        //kTextColor
      ),
    );
  }
}

class TitleTextWidget extends StatefulWidget {
  const TitleTextWidget({super.key, this.oneApartment});

  final DataOfOneApartment? oneApartment;

  @override
  State<TitleTextWidget> createState() => _TitleTextWidgetState();
}

class _TitleTextWidgetState extends State<TitleTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
        widget.oneApartment?.title ?? ""
        // data.
        ,
        softWrap: true,
        style: TextStyle(
            color: themeMode.isLight
                ? kTextColorLightMode
                : kTextColorDarkMode,
            fontSize:
            getIt<AppDimension>().isSmallScreen(context) ? 17 : 18,
            fontWeight: FontWeight.w500));
  }
}

class LocationTextWidget extends StatefulWidget {
  const LocationTextWidget({super.key, this.oneApartment});

  final DataOfOneApartment? oneApartment;

  @override
  State<LocationTextWidget> createState() => _LocationTextWidgetState();
}

class _LocationTextWidgetState extends State<LocationTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "${SetLocalization.of(context)!.getTranslateValue("location")}${widget
          .oneApartment?.city?.name ?? ""

      // data.
      }-${widget.oneApartment?.location ?? ""
      // .data

      }",
      softWrap: true,
      // textDirection: TextDirection.rtl,
      style: TextStyle(
        color:
        themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
      ),
    );
  }
}

class AccountOfStudentTextWidget extends StatefulWidget {
  const AccountOfStudentTextWidget(
      {super.key, this.oneApartment, required this.isBoyStudent, required this.isGirlStudent, required this.isFamilies});

  final DataOfOneApartment? oneApartment;
  final bool isBoyStudent;
  final bool isGirlStudent;
  final bool isFamilies;

  @override
  State<AccountOfStudentTextWidget> createState() =>
      _AccountOfStudentTextWidgetState();
}

class _AccountOfStudentTextWidgetState
    extends State<AccountOfStudentTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
        (widget.isBoyStudent
            ? "${SetLocalization.of(context)!.getTranslateValue
          ("allowed_students")}: ${widget.oneApartment?.countOfStudnet ?? 0}"
            : (widget.isGirlStudent ? " عدد الطالبات المسموح "
            "به: ${widget.oneApartment?.countOfStudnet ?? 0}"
            : (widget.isFamilies
            ? "${SetLocalization.of(context)!.getTranslateValue
          ("allowed_people_count")}: ${widget.oneApartment?.countOfStudnet ??
            0}"
            : "${SetLocalization.of(context)!.getTranslateValue
          ("allowed_people_count")}: ${widget.oneApartment?.countOfStudnet ??
            0}"))),
        style: TextStyle(
          color: themeMode.isLight
              ? kTextColorLightMode
              : kTextColorDarkMode,
          fontSize: 16,
        ));
  }
}

class TypeOfApartmentTextWidget extends StatefulWidget {
  const TypeOfApartmentTextWidget({super.key, this.oneApartment});

  final DataOfOneApartment? oneApartment;

  @override
  State<TypeOfApartmentTextWidget> createState() =>
      _TypeOfApartmentTextWidgetState();
}

class _TypeOfApartmentTextWidgetState extends State<TypeOfApartmentTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
        "${SetLocalization.of(context)!.getTranslateValue(
            "housing_type_students")}:${widget.oneApartment?.type?.name ?? ""}",
        style: TextStyle(
          color: themeMode.isLight
              ? kTextColorLightMode
              : kTextColorDarkMode,
          fontSize: 16,
        ));
  }
}

class PriceTextWidget extends StatefulWidget {
  const PriceTextWidget({super.key, this.oneApartment});

  final DataOfOneApartment? oneApartment;

  @override
  State<PriceTextWidget> createState() => _PriceTextWidgetState();
}

class _PriceTextWidgetState extends State<PriceTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        "${SetLocalization.of(context)!.getTranslateValue("rent")}: "
            "${widget.oneApartment?.price ?? ""
        // data.

        }",
        style: TextStyle(
          color: themeMode.isLight
              ? kPrimaryColorLightMode
              : kPrimaryColorDarkMode,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Text(
          SetLocalization.of(context)!
              .getTranslateValue("shekel_per_month"),
          style: TextStyle(
            color: themeMode.isLight
                ? kPrimaryColorLightMode
                : kPrimaryColorDarkMode,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ))
    ]);
  }
}

