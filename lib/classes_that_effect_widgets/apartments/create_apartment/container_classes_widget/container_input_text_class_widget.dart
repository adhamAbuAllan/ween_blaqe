// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ween_blaqe/styles/text_field_form_style.dart';
String errorText = "";

//container input text class widget
class ContainerInputTextClassWidget extends StatefulWidget {
  String title;
  String hintInput;
  TextInputType inputType;
  FocusNode? focusNode;
  String? value;
  Function? onFieldSubmitted;
  String ? errorText;
  // TextInputAction? textInputAction;
  bool? autoFocus;
  TextEditingController? controller;

  ContainerInputTextClassWidget({
    Key? key,
    required this.title,
    required this.hintInput,
    required this.inputType,
    this.focusNode,
    this.onFieldSubmitted,
    this.value,
    this.autoFocus,
    // this.textInputAction,
    this.controller,

     // this.errorText
  }) : super(key: key);

  @override
  State<ContainerInputTextClassWidget> createState() =>
      _ContainerInputTextClassWidgetState();
}

class _ContainerInputTextClassWidgetState
    extends State<ContainerInputTextClassWidget> {
  @override
  Widget build(BuildContext context) {
    var title = widget.title;
    var contoller = widget.controller;
    var hintInput = widget.hintInput;
    var inputType = widget.inputType;
    var focusNode = widget.focusNode;
    var value = widget.value;
    // var autoFocus = widget.autoFocus;
    var is_first = false;
    var symboles = "()!@#%^&*_+-=?><~|`;'{}][:/,؟’";

    return Container(
      margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
      // height: 140,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white70,
      ),

      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 18,
                    fontFamily: 'IBM',
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 10, 10),
            child: TextFormField(
              //
              // onChanged: (value) {
              //   // autoFocus = false;
              //   setState(() {
              //     if (value.contains(' ')) {
              //       autoFocus = true;
              //       errorText ="أزل الفراعات من الحقل";
              //     }
              //     else {
              //       if (value.isEmpty) {
              //         autoFocus = true;
              //         errorText = "حقل مطلوب";
              //       }
              //       else {
              //           for (int i = 0; i < symboles.length; i++) {
              //             if (
              //             value.contains(symboles)!=true
              //             ){
              //               // autoFocus = true;
              //               errorText = "لا يمكن إدخال رموز";
              //
              //             }
              //             else{
              //               errorText = "";
              //               // autoFocus = false;
              //
              //             }
              //           }
              //         }
              //     }
              //     //
              //   });
              // },
              textInputAction: TextInputAction.next,
              controller: contoller,
              initialValue: value,
              // maxLength: 55,
              textDirection: TextDirection.rtl,
              keyboardType: inputType,
              autofocus: widget.autoFocus ?? false,
              // focusNode: focusNode,
              decoration: InputDecoration(
                  errorText: errorText.isEmpty ? null : errorText,
                  hintTextDirection: TextDirection.rtl,
                  hintText: hintInput,
                  border: InputBorder.none,
                  hintMaxLines: 1,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
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
              style: TextStyle(
                fontFamily: 'IBM',
                fontSize: 16,
                color: Colors.grey.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// container input (long) text class widget
class ContainerInputLongTextClassWidget extends StatefulWidget {
  String title;
  String hintInput;
  TextInputType inputType;
  FocusNode ?focusNode;
  int ? index;
  TextEditingController? controller ;


  ContainerInputLongTextClassWidget({
    Key? key,
    required this.title,
    required this.hintInput,
     this.index,
    required this.inputType,
     this.focusNode,
    this.controller
  }) : super(key: key);

  @override
  State<ContainerInputLongTextClassWidget> createState() =>
      _ContainerInputLongTextClassWidgetState();
}

class _ContainerInputLongTextClassWidgetState
    extends State<ContainerInputLongTextClassWidget> {
  @override
  Widget build(BuildContext context) {
    var title = widget.title;
    var hihtInput = widget.hintInput;
    var inputType = widget.inputType;
    var focusNode = widget.focusNode;
    return Container(
      margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
      width: double.infinity,
      // height: 140,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white70,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 18,
                    fontFamily: 'IBM',
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
            child: TextFormField(
              maxLength: 255,
              maxLines: 7,
              textDirection: TextDirection.rtl,
              keyboardType: inputType,
              focusNode: focusNode,
              controller: widget.controller,
              decoration: InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  hintText: hihtInput,
                  border: InputBorder.none,
                  hintMaxLines: 7,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
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
              style: TextStyle(
                fontFamily: 'IBM',
                fontSize: 16,
                color: Colors.grey.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
