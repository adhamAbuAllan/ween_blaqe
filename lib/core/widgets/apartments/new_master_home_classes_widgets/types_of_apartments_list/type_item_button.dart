import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';

class ApartmentShowTypesTextButton extends StatefulWidget {
  final String textType;
  final void Function()? onPressed;

  const ApartmentShowTypesTextButton(
      {super.key, this.onPressed, required this.textType});

  @override
  State<ApartmentShowTypesTextButton> createState() =>
      _ApartmentShowTypesTextButtonState();
}

class _ApartmentShowTypesTextButtonState
    extends State<ApartmentShowTypesTextButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: TextButton(
          style: const ButtonStyle(
              overlayColor: MaterialStatePropertyAll(kPrimaryColor300)),
          onPressed: widget.onPressed,
          child: Text("${widget.textType}           ",
              style: const TextStyle(
                  color:kTextColor, fontFamily: 'IBM'))),
    );
  }
}
