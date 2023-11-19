import 'package:flutter/material.dart';

import '../../../../utils/styles/button.dart';


class ApartmentShowTypesButton extends StatefulWidget {
  final void Function()? onPressed;

 const ApartmentShowTypesButton({super.key, this.onPressed});

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
      ),
    );
  }
}
//
class BtnShowTypesOfApartments extends StatefulWidget {
  const BtnShowTypesOfApartments({super.key,required this.onPressed});
  final void Function()? onPressed;
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
            child: const Text(
                " صنف السكن ")));
  }
}

