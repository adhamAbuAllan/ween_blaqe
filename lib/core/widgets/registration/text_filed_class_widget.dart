import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/constants/nums.dart';
import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';

class TextFieldClassWidget extends ConsumerWidget {
  final String labelName;
  final double fontSize;
  final TextInputType textInputType;
  final FocusNode? focusNode;
  final Function? onFieldSubmitted;
  final bool? autoFocus;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String value)? onChanged;
  final String? errorText;
  final bool? isPhoneRegTextField;
  final String? validateTextValue;

  const TextFieldClassWidget(
      {super.key,
      required this.labelName,
      required this.textInputType,
      required this.fontSize,
      this.focusNode,
      this.onFieldSubmitted,
      this.controller,
      this.autoFocus,
      this.validator,
      this.onChanged,
      this.errorText,
      this.isPhoneRegTextField,
      this.validateTextValue});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // height: 60,  // Set a fixed height for consistency
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ), // Adjust padding

      // as needed
      child: TextFormField(
          validator: validator,
          // textAlign:
          // isPhoneRegTextField??false ?  TextAlign.end:
          // TextAlign.start,
          textDirection: isPhoneRegTextField ?? false
              ? TextDirection.ltr
              : TextDirection.rtl,
          controller: controller,
          autofocus: autoFocus ?? false,
          keyboardType: textInputType,
          style: TextStyle(
            color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
            fontSize: fontSize,
          ),
          decoration: InputDecoration(
            // errorBorder:  validateTextValue != ""
            //     ? const OutlineInputBorder(
            //         borderSide: BorderSide(
            //           color: Colors.red,
            //           width: 1,
            //         ),
            //       )
            //:null,

            isDense: true,

            // Reduces internal padding
            contentPadding: EdgeInsets.symmetric(
                vertical:
                    getIt<AppDimension>().isSmallScreen(context) ? 20 / 2 : 20,
                horizontal: 10),
            labelText: labelName,
            labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: fontSize,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: themeMode.isLight
                    ? kPrimaryColor300LightMode
                    : kPrimaryColor300DarkMode,
                width: 0.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: themeMode.isLight
                    ? kPrimaryColorLightMode
                    : kPrimaryColorDarkMode,
                width: 1,
              ),
            ),
            // errorText: errorText,
            errorStyle: const TextStyle(
              color: Colors.redAccent,
              fontSize: 12.0,
            ),
            error: isPhoneRegTextField ?? false
                ? (validateTextValue != null ? const SizedBox() : null)
                : (errorText != null
                    ? Text(
                        errorText!,
                        style: const TextStyle(
                          color: Colors.redAccent,
                          fontSize: 12.0,
                        ),
                      )
                    : null),
          ),
          onChanged: onChanged),
    );
  }
}
