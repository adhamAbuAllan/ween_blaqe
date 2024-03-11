import 'package:flutter/material.dart';

import 'package:ween_blaqe/constants/nums.dart';




String errorText = '';

class PasswordContainerClassWidget extends StatefulWidget {
  final String title;
  final String hintInput;
  final TextInputType inputType;
  final FocusNode? focusNode;
  final bool? isVisible;
  final bool? isObscure;
  final bool? autoFocus;
  final Function? onFieldSubmitted;
  final Function(bool)? setPassword;
  final TextEditingController? controller;

  const PasswordContainerClassWidget({
    Key? key,
    required this.title,
    this.isObscure,
    required this.hintInput,
    required this.inputType,
    this.focusNode,
    this.onFieldSubmitted,
    this.isVisible,
    this.autoFocus,
    this.controller,
    this.setPassword,

    // this.autoFocus
    // this.autoFocus,
  }) : super(key: key);

  @override
  State<PasswordContainerClassWidget> createState() =>
      _PasswordContainerClassWidgetState();
}

class _PasswordContainerClassWidgetState
    extends State<PasswordContainerClassWidget> {
  @override
  Widget build(BuildContext context) {
    var title = widget.title;
    var hihtInput = widget.hintInput;
    var inputType = widget.inputType;
    var   autoFocus = widget.autoFocus;
    var focusNode = FocusNode();
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: themeMode.isDark ? kContainerColorLightMode:kContainerColorDarkMode,
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
// enableInteractiveSelection:true ,

              obscureText: widget.isObscure ?? true,
              keyboardType: inputType,
              onFieldSubmitted: (value) {
                // FocusScope.of(context).requestFocus(focusNode);
              },
              enableSuggestions: false,
              autocorrect: false,
              focusNode: focusNode,
              autofocus: autoFocus??false,

              textInputAction: TextInputAction.next,
              // onChanged: (value) {
              //   setState(() {
              //     // if(value.contains(' ')|| value.isEmpty
              //     // // || value.contains(symboles)
              //     // ){}
              //     if (value.contains(' ')) {
              //       errorText = "أزل الفراعات من الحقل";
              //       print(errorText);
              //       // autoFocus = true;
              //     }
              //     else {
              //       if (value.isEmpty) {
              //         // autoFocus = true;
              //         errorText = "حقل مطلوب";
              //       }else{
              //         errorText = "";
              //       }
              //       // else {
              //       //   for (int i = 0; i < symboles.length; i++) {
              //       //     if (value.contains(symboles)){
              //       //       autoFocus = true;
              //       //       errorText = "لا يمكن إدخال رموز";
              //       //
              //       //     }
              //       //   }
              //       //   autoFocus = false;
              //       // }
              //     }
              //   });
              // },
              controller: widget.controller,

              decoration: InputDecoration(

                  hintText: hihtInput,
                  // errorText: errorText.isEmpty ? null : errorText,
                  border: InputBorder.none,
                  // suffixIcon: IconButton(
                  //   icon: Icon(
                  //     color: Colors.grey.shade300,
                  //     isVisible != false ? Icons.visibility : Icons.visibility_off,
                  //   ),
                  //   onPressed: () {
                  //     setState(() {
                  //       isVisible = !isVisible!;
                  //     });
                  //   },
                  // ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      widget.isObscure ?? false
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.isObscure != widget.isObscure;
                      });
                    },
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: themeMode.isDark ?kPrimaryColorLightMode:kPrimaryColorDarkMode,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:  BorderSide(
                        width: 0.5,
                        color: themeMode.isDark ?kPrimaryColor300LightMode: kPrimaryColor300DarkMode,
                      ),
                      borderRadius: BorderRadius.circular(7))),
              style: TextStyle(
                  fontFamily: 'IBM', fontSize: 16, color: Colors.grey.shade800),
            ),
          ),
        ],
      ),
    );
  }
}
