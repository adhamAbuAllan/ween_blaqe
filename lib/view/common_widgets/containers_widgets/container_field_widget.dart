// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/controller/function_controller/change_theme_mode.dart';
import 'package:ween_blaqe/view/common_widgets/containers_widgets/container_widget.dart';

import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';
import '../../../constants/nums.dart';

//container input text class widget
class ContainerFieldWidget extends ConsumerWidget {
  final String title;
  final String hintInput;
  final TextInputType inputType;
  final FocusNode? focusNode;
  final Function? onFieldSubmitted;
  final String? errorText;
  final int? hintMaxLines;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final String? helperText;
  final bool? autoFocus;
  final TextEditingController? controller;

  const ContainerFieldWidget({
    super.key,
    required this.title,
    required this.hintInput,
    required this.inputType,
    this.focusNode,
    this.maxLines,
    this.hintMaxLines,
    this.maxLength,
    this.onFieldSubmitted,
    this.autoFocus,
    this.controller,
    this.errorText,
    this.validator,
    this.helperText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ContainerWidget(
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
                  fontSize:
                      getIt<AppDimension>().isSmallScreen(context) ? 16 : 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: TextFormField(
            validator: validator,
            cursorColor: themeMode.isLight
                ? kPrimaryColorLightMode
                : kPrimaryColorDarkMode,
            textInputAction: TextInputAction.next,
            controller: controller,
            maxLines: maxLines,
            // maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
            maxLength: maxLength,
            // textDirection: TextDirection.rtl,
            keyboardType: inputType,
            autofocus: autoFocus ?? false,

            // focusNode: focusNode,
            decoration: buildInputDecoration(hintInput, context,
                helperText: helperText),
            style: TextStyle(
              fontSize: getIt<AppDimension>().isSmallScreen(context) ? 15 : 16,
              color:
                  themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
            ),
          ),
        ),
      ],
    ));
  }

  InputDecoration buildInputDecoration(String hintInput, BuildContext context,
      {String? helperText}) {
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
        errorText: errorText,

        // hintTextDirection: TextDirection.rtl,
        hintText: hintInput,
        border: InputBorder.none,
        hintMaxLines: hintMaxLines,
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
