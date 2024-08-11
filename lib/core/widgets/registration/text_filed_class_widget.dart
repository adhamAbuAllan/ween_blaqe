import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';

import 'package:ween_blaqe/constants/nums.dart';

import '../../../constants/coordination.dart';
import '../../../constants/injection.dart';




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
    this.autoFocus,Z
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: TextFormField(
          controller: controller,

          textInputAction: TextInputAction.next,

          autofocus: autoFocus ?? false,
          // focusNode: foucsNode,
          keyboardType: textInputType,
          style:  TextStyle(fontFamily: 'IBM',color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode),

          decoration: InputDecoration(

              contentPadding:  EdgeInsets.symmetric(vertical:
              getIt<AppDimension>().isSmallScreen(context) ? 20/2 : 20,
                  horizontal: 10),
              labelText: labelName,
              labelStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'IBM',
                  fontSize: fontSize),
              // alignLabelWithHint: true,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              border: InputBorder.none,
              focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color:themeMode.isDark ? kPrimaryColorLightMode: kPrimaryColorDarkMode,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide:  BorderSide(
                    width: 0.5,
                    color: themeMode.isDark ? kPrimaryColor300LightMode:kPrimaryColor300DarkMode,
                  ),
                  borderRadius: BorderRadius.circular(7))),
        ));
  }
}
