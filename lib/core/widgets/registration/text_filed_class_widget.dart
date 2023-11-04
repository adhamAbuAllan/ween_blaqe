import 'package:flutter/material.dart';

import 'package:ween_blaqe/constants/nums.dart';

 


class TextFieldClassWdiget extends StatelessWidget {
  final String labelName;
  final double fontSize;
  final TextInputType textInputType;
  final FocusNode? foucsNode;
  final Function? onFieldSubmitted;
  final bool? autoFocus;
  final TextEditingController? controller;

  const TextFieldClassWdiget({
    Key? key,
    required this.labelName,
    required this.textInputType,
    required this.fontSize,
    this.foucsNode,
    this.onFieldSubmitted,
    this.controller,
    this.autoFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: TextFormField(
          controller: controller,
          textInputAction: TextInputAction.next,

          autofocus: autoFocus ?? false,
          // focusNode: foucsNode,
          keyboardType: textInputType,
          style: const TextStyle(fontFamily: 'IBM'),

          decoration: InputDecoration(
              // contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
              labelText: labelName,
              labelStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontFamily: 'IBM',
                  fontSize: fontSize),
              // alignLabelWithHint: true,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              border: InputBorder.none,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: kPrimaryColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: kPrimaryColor300,
                  ),
                  borderRadius: BorderRadius.circular(7))),
        ));
  }
}
