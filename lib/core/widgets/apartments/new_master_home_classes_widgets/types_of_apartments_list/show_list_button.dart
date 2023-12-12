import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: outlineButton,
        onPressed: widget.onPressed,
        //                              Container(height: 50,width: 100,color: Colors.white,),
        child: Container(
            padding:
            const EdgeInsets.only(
                top: 4),
            height: 35,
            color: Colors.white,
            child: widget.text?.isNotEmpty??false ? Text(
                " ${widget.text} ") :   Text(
                " صنف السكن ")));
  }
}

