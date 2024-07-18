import 'package:flutter/material.dart';

import 'package:ween_blaqe/constants/nums.dart';

//text filed password for registration
class TextFieldOfPasswordClassWidget extends StatefulWidget {
  final TextInputType? inputType;
  final Function? onFieldSubmitted;
  final String? labelInput;
  final FocusNode? focusNode;
  final bool? autoFocus;
  late final bool? hide;
  late final String? displayText;
  final Function(String)? checkPass;
  late final double? strength;
  final bool isObscure;
  final void Function(bool) onObscureChanged;
  final TextEditingController? controller;

  TextFieldOfPasswordClassWidget(
      {Key? key,
      this.inputType,
      this.labelInput,
      this.onFieldSubmitted,
      this.displayText,
      this.strength,
      this.focusNode,
      this.hide,
      this.autoFocus,
      this.checkPass,
      this.controller,
      required this.isObscure,
      required this.onObscureChanged})
      : super(key: key);

  @override
  State<TextFieldOfPasswordClassWidget> createState() =>
      _TextFieldOfPasswordClassWidgetState();
}

class _TextFieldOfPasswordClassWidgetState
    extends State<TextFieldOfPasswordClassWidget> {
  // late String password;

  // bool isObscure = false;
  // double strength = 0;
  // 0: No password
  // 1/4: Weak
  // 2/4: Medium
  // 3/4: Strong
  // 1: Great

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  // displayText = 'الرجاء إدخال كلمة المرور ';

  void checkPassword(String value) {
    widget.controller?.text = value.trim();

    if (widget.controller!.text.isEmpty) {
      setState(() {
        widget.strength = 0;
        widget.displayText = 'الرجاء إدخال كلمة المرور';
      });
    } else if (widget.controller!.text.length < 6) {
      setState(() {
        widget.strength = 1 / 4;
        widget.displayText = 'كلمة المرور الخاصة بك قصيرة';
      });
    } else if (widget.controller!.text.length < 8) {
      setState(() {
        widget.strength = 2 / 4;
        widget.displayText = 'كلمة المرور الخاصة بك مقبولة ولكنها ليست قوية';
      });
    } else {
      if (!letterReg.hasMatch(widget.controller!.text) ||
          !numReg.hasMatch(widget.controller!.text)) {
        setState(() {
          widget.strength = 3 / 4;
          widget.displayText = 'كلمة المرور الخاصة بك قوية';
        });
      } else {
        setState(() {
          widget.strength = 1;
          widget.displayText = 'كلمة المرور الخاصة بك ممتازة';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // IconData invisible_ic = Icons.visibility_off;
    // IconData visible_ic = Icons.visibility;
    // IconData currentIcon = Icons.visibility_off;

    var labelInput = widget.labelInput;
    var inputType = widget.inputType;
    // bool visible = false;
    // var focusNode = FocusNode();
    return Padding(
        // padding: const EdgeInsets.fromLTRB(25, 0, 25, 12),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: TextFormField(
          // onChanged: (value) => checkPassword(value),
          // onChanged: (v) => widget.checkPass!(widget.displayText??v),
          controller: widget.controller,
          // autofocus: widget.autoFocus ?? false,

          // textInputAction: TextInputAction.next,
          obscureText: widget.isObscure,
          style:  TextStyle(fontFamily: 'IBM',color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode),
          // focusNode: focusNode,
          keyboardType: inputType,
          decoration: InputDecoration(
              labelText: labelInput,
              labelStyle: TextStyle(
                  color: Colors.grey.shade500, fontFamily: 'IBM', fontSize: 16),
              suffixIcon: IconButton(
                icon: widget.isObscure
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                color: themeMode.isDark ? kTextColorLightMode : kTextColorDarkMode,
                onPressed: () {
                  setState(() {
                    widget.onObscureChanged(!widget.isObscure);
                  });
                },
              ),
              hintStyle: const TextStyle(color: Colors.grey),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: themeMode.isDark
                      ? kPrimaryColorLightMode
                      : kPrimaryColorDarkMode,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                    color: themeMode.isDark
                        ? kPrimaryColor300LightMode
                        : kPrimaryColor300DarkMode,
                  ),
                  borderRadius: BorderRadius.circular(7))),
        ));
  }

  checkTowFieldPassword(String firstValue, String secondValue) {
    // var  errorText = '';
    (value) {
      //  setState(() {
      // if(firstValue!=secondValue){
      //   errorText = "كلمتي المرور غير متطالبقتين";
      // }
      //  });
    };
  }
}
