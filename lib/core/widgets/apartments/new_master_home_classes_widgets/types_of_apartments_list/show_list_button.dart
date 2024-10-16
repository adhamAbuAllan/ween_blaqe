import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/controller/function_controller/change_theme_mode.dart';

import '../../../../utils/styles/button.dart';


class ApartmentShowTypesButton extends StatefulWidget {
  final void Function()? onPressed;
  final String ? text;

 const ApartmentShowTypesButton({super.key, this.onPressed,this.text });

  @override
  State<ApartmentShowTypesButton> createState() =>
      _ApartmentShowTypesButtonState();
}

class _ApartmentShowTypesButtonState extends State<ApartmentShowTypesButton> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .95,
      child: BtnShowTypesOfApartments(
        onPressed: widget.onPressed,
        text:widget.text ,

      ),
    );
  }
}
//
class BtnShowTypesOfApartments extends StatefulWidget {
  const BtnShowTypesOfApartments({super.key,required this.onPressed, this.text});
  final void Function()? onPressed;
  final String ? text;

  @override
  State<BtnShowTypesOfApartments> createState() => _BtnShowTypesOfApartmentsState();
}

class _BtnShowTypesOfApartmentsState extends State<BtnShowTypesOfApartments> {
  ChangeThemeMode themeMode = Get.find();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: outlinedButton(themeMode:themeMode),
        onPressed: widget.onPressed,
        //                              Container(height: 50,width: 100,color: Colors.white,),
        child: Container(
            padding:
            const EdgeInsets.only(
                top: 4),
            // height: 35,
            color:themeMode.isLight ? kContainerColorLightMode : kContainerColorDarkMode,
            child: widget.text?.isNotEmpty??false ? Text(
                " ${widget.text} ") :   const Text(
                " صنف السكن ")));
  }
}

