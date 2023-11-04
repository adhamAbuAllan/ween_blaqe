// import 'dart:html';

import 'package:flutter/material.dart';

import '../../../../../../constants/nums.dart';


const String errorText = "";

//container input text class widget
class ContainerInputTextClassWidget extends StatefulWidget {
  final String title;
  final String hintInput;
  final TextInputType inputType;
  final FocusNode? focusNode;
  final String? value;
  final Function? onFieldSubmitted;
  final String? errorText;
  final int? hintMaxLines;
  final int? maxLines;
  final int? maxLength;
  final Function(String value)? onEdit;
  final Widget? valueUnderFormTextField;
  final bool? expanded ;

  // TextInputAction? textInputAction;
  final bool? autoFocus;
  final TextEditingController? controller;

  const ContainerInputTextClassWidget(
      {Key? key,
      required this.title,
      required this.hintInput,
      required this.inputType,
      this.focusNode,
      this.maxLines,
      this.hintMaxLines,
      this.maxLength,
      this.onFieldSubmitted,
      this.value,
      this.autoFocus,
      // this.textInputAction,
      this.controller,
      this.errorText,
      this.onEdit,
      this.expanded,
      this.valueUnderFormTextField
      // this.errorText
      })
      : super(key: key);

  @override
  State<ContainerInputTextClassWidget> createState() =>
      _ContainerInputTextClassWidgetState();
}

class _ContainerInputTextClassWidgetState
    extends State<ContainerInputTextClassWidget> {
  @override
  Widget build(BuildContext context) {
    var title = widget.title;
    var controller = widget.controller;
    var hintInput = widget.hintInput;
    var inputType = widget.inputType;
    // var focusNode = widget.focusNode;
    var value = widget.value;
    // var autoFocus = widget.autoFocus;
    // var is_first = false;
    // var symboles = "()!@#%^&*_+-=?><~|`;'{}][:/,؟’";
    return Container(
      // transformAlignment: Alignment.bottomCenter,


      margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
      // height: 140,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: kContainerColor,
      ),

      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: kTextColor,
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
              controller: controller,
              initialValue: value,
              onChanged: widget.onEdit,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              textDirection: TextDirection.rtl,
              keyboardType: inputType,
              autofocus: widget.autoFocus ?? false,
              // focusNode: focusNode,
              decoration: buildInputDecoration(hintInput),
              style: TextStyle(
                fontFamily: 'IBM',
                fontSize: 16,
                color: Colors.grey.shade800,
              ),
            ),
          ),
         widget.expanded == true ?  Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: widget.valueUnderFormTextField ??
                    const SizedBox(
                      width: .1,
                      height: .1,
                    ),
              ),
            ],
          ):const SizedBox(height: .1,width: .1,)
        ],
      ),
    );
  }

  InputDecoration buildInputDecoration(String hintInput) {
    return InputDecoration(
        errorText: errorText.isEmpty ? null : errorText,
        hintTextDirection: TextDirection.rtl,
        hintText: hintInput,
        border: InputBorder.none,
        hintMaxLines: widget.hintMaxLines,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
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
            borderRadius: BorderRadius.circular(7)));
  }
}
