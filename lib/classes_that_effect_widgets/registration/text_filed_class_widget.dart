import 'package:flutter/material.dart';
class TextFieldClassWdiget extends StatelessWidget {
  String labelName;
  double  fontSize;
  TextInputType  textInputType;
  FocusNode  ?foucsNode;
  Function ? onFieldSubmitted;
  TextEditingController ? controller;

   TextFieldClassWdiget
   ({Key? key,
  required this.labelName,
  required this.textInputType,
  required this.fontSize,
    this.foucsNode,
    this.onFieldSubmitted,
     this.controller

   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: TextFormField(
          controller: controller,
          // focusNode: foucsNode,
          keyboardType: textInputType,
          style: TextStyle(fontFamily: 'IBM'),

          decoration: InputDecoration(
              labelText: labelName,
              labelStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontFamily: 'IBM',
                  fontSize: fontSize
              ),
              // alignLabelWithHint: true,
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
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
