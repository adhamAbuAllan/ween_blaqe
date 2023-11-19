import 'package:flutter/material.dart';

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
          style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.orange.shade200)),
          onPressed: widget.onPressed,
          child: Text("${widget.textType}           ",
              style: TextStyle(
                  color: Colors.black.withOpacity(.7), fontFamily: 'IBM'))),
    );
  }
}
