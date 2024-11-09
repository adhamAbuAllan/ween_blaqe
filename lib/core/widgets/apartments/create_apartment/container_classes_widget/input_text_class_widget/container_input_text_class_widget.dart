// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/controller/function_controller/change_theme_mode.dart';

import '../../../../../../constants/coordination.dart';
import '../../../../../../constants/get_it_controller.dart';
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
  final bool? expanded;
  final String? Function(String?)? validator;
  final String? helperText;

  // TextInputAction? textInputAction;
  final bool? autoFocus;
  final TextEditingController? controller;

  const ContainerInputTextClassWidget({
    super.key,
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
    this.valueUnderFormTextField,
    this.validator,
    this.helperText,
    // this.errorText
  });

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
        color: themeMode.isLight
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
      ),

      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  title,
                  style: TextStyle(
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
                    fontSize: getIt<AppDimension>().isSmallScreen(context)
                        ? 16
                        :18,
                    
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: TextFormField(
              validator: widget.validator,
              cursorColor: themeMode.isLight
                  ? kPrimaryColorLightMode
                  : kPrimaryColorDarkMode,
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
              // maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
              maxLength: widget.maxLength,
              // textDirection: TextDirection.rtl,
              keyboardType: inputType,
              autofocus: widget.autoFocus ?? false,

              // focusNode: focusNode,
              decoration: buildInputDecoration(hintInput,
                  helperText: widget.helperText),
              style: TextStyle(
                
                fontSize: getIt<AppDimension>().isSmallScreen(context) ? 15 :
                16,
                color: themeMode.isLight
                    ? kTextColorLightMode
                    : kTextColorDarkMode,
              ),
            ),
          ),
          widget.expanded == true
              ? Row(
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
          )
              : const SizedBox(
            height: .1,
            width: .1,
          )
        ],
      ),
    );
  }

  InputDecoration buildInputDecoration(String hintInput, {String? helperText}) {
    ChangeThemeMode themeMode = Get.find();

    return InputDecoration(
        helperStyle: TextStyle(
            color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
            fontFamily: "IBM"),
        helperText: helperText,
        contentPadding: EdgeInsets.symmetric(
            vertical:
            getIt<AppDimension>().isSmallScreen(context) ? 20 / 2 : 20,
            horizontal: 12),
        errorText: errorText.isEmpty ? null : errorText,

        // hintTextDirection: TextDirection.rtl,
        hintText: hintInput,
        border: InputBorder.none,
        hintMaxLines: widget.hintMaxLines,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: themeMode.isLight
                ? kPrimaryColorLightMode
                : kPrimaryColorDarkMode,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: themeMode.isLight
                  ? kPrimaryColorLightMode.withOpacity(.3)
                  : kPrimaryColorDarkMode.withOpacity(.3),
            ),
            borderRadius: BorderRadius.circular(7)),

        // ... your existing decoration properties ...

        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red), // Set error border color
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red, width: 2.0), // Set focused error border
        ),
        errorStyle: const TextStyle(
          color: Colors.red,
          
        ),
        helperMaxLines: 2
      // Customize
      // error text style
    );
  }
}
