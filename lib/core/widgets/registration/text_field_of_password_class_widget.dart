import 'package:flutter/material.dart';

import 'package:ween_blaqe/constants/nums.dart';

import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';
// import '../../../controller/auth_provider.dart';

//text filed password for registration
class TextFieldOfPasswordClassWidget extends StatefulWidget {
  final TextInputType? inputType;
  final Function? onFieldSubmitted;
  final String? labelInput;
  final FocusNode? focusNode;
  final bool? autoFocus;
  late  bool? hide;
  late  String? displayText;
  final Function(String)? checkPass;
  late  double? strength;
  final bool isObscure;
  final String? Function(String?)? validator;

  final void Function(bool) onObscureChanged;
  final TextEditingController? controller;
  final String ? helperText;
  final String ? errorText;

   TextFieldOfPasswordClassWidget(
      {super.key,
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
      required this.onObscureChanged,
      this.validator,  this.helperText, this.errorText});

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

  @override
  Widget build(BuildContext context) {

    return Padding(

        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: TextFormField(
          validator: widget.validator,
         controller: widget.controller,
          obscureText: widget.isObscure,
          style: TextStyle(
              
              color:
                  themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode),
          keyboardType: widget.inputType,
          decoration: InputDecoration(
            errorText: widget.errorText,
            contentPadding: EdgeInsets.symmetric(
                vertical:
                    getIt<AppDimension>().isSmallScreen(context) ? 20 / 2 : 20,
                horizontal: 10),
            labelText: widget.labelInput,
            labelStyle: TextStyle(
                color: Colors.grey.shade500,  fontSize: 16),
            suffixIcon: IconButton(
              icon: widget.isObscure
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              color:
                  themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
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
                color: themeMode.isLight
                    ? kPrimaryColorLightMode
                    : kPrimaryColorDarkMode,
              ),
            ),

            enabledBorder: OutlineInputBorder(

                borderSide: BorderSide(
                  width: 0.5,
                  color: themeMode.isLight
                      ? kPrimaryColor300LightMode
                      : kPrimaryColor300DarkMode,
                ),
                borderRadius: BorderRadius.circular(7)),
            helperText: widget.helperText,
            errorBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.red), // Set error border color
            ),

            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.red, width: 2.0), // Set focused error border
            ),
            errorStyle: const TextStyle(
                color: Colors.red), // Customize error text style
          ),
        ));
  }

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

}
