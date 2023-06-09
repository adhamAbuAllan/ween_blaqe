import 'package:flutter/material.dart';

class TextFieldClassWdiget extends StatelessWidget {
  String labelName;
  double  fontSize;
  TextInputType  textInputType;
  FocusNode  ?foucsNode;
  Function ? onFieldSubmitted;
  bool ? autoFocus;

  TextEditingController ? controller;

   TextFieldClassWdiget
   ({Key? key,
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
          textInputAction: TextInputAction.next ,

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
                  fontSize: fontSize
              ),
              // alignLabelWithHint: true,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              border: InputBorder.none,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.orange,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                    color: Colors.orange.shade300,
                  ),
                  borderRadius: BorderRadius.circular(7))),
        ));

  }
}
