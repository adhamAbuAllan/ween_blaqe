import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:ween_blaqe/sesstion/new_session.dart';
// import 'package:ween_blaqe/features/widgets_before_user_reg/account_before_login.dart';

import '../../../constants/nums.dart';

import '../../../core/utils/styles/button.dart';

class SocialMediaConnectionButton extends StatefulWidget {
  const SocialMediaConnectionButton({
    super.key,
    required this.isActive,
    required this.socialName,
    required this.socialIcon,
    this.userName,
    this.socialDialogName,
    this.labelUserName,
    this.controller,
    this.onChanged,
    this.onSaved, this.check,
  });

  final IconData? socialIcon;
  final String socialName;
  final bool isActive;
  final String? userName;
  final String? socialDialogName;
  final String? labelUserName;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onSaved;
  final void Function()? check;

  @override
  State<SocialMediaConnectionButton> createState() =>
      _SocialMediaConnectionButtonState();
}

class _SocialMediaConnectionButtonState
    extends State<SocialMediaConnectionButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        showInputDialog(context,
            labelUserName: widget.labelUserName,
            socialName: widget.socialDialogName,
            userName: widget.userName,
            controller: widget.controller,
            onChanged: widget.onChanged,
            onSaved: widget.onSaved,
        check: widget.check
        );
      },
      style: outlinedButton(themeMode: themeMode).copyWith(
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        side: WidgetStatePropertyAll(
          BorderSide(
            color: widget.isActive
                ? (themeMode.isLight
                    ? kPrimaryColorLightMode
                    : kPrimaryColorDarkMode)
                : (themeMode.isLight
                    ? kPrimaryColor300LightMode
                    : kPrimaryColor300DarkMode),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Wrap(

          // Use Wrap instead of Row
          children: [
            Padding(
              padding: const EdgeInsets.all(5), // Add spacing
              child: FaIcon(
                widget.socialIcon,
                color: widget.isActive
                    ? (themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode)
                    : Colors.grey,
                size: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                widget.socialName, // Use soicalName property
                style: TextStyle(
                  color: widget.isActive
                      ? (themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode)
                      : (Colors.grey),
                  fontSize: 16,
                  fontFamily: 'IBM',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showInputDialog(BuildContext context,
    {String? userName,
    String? socialName,
    String? labelUserName,
    TextEditingController? controller,
    required void Function()? onSaved,
      final void Function()? check,
    void Function(String)? onChanged}) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: themeMode.isLight
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
          side: BorderSide(
            color: themeMode.isLight
                ? kPrimaryColorLightMode
                : kPrimaryColorDarkMode,
            strokeAlign: 0,
            width: 0.5,
          ),
        ),
        actionsPadding: const EdgeInsets.fromLTRB(120, 0, 10, 0),
        title: Text(
          socialName ?? "",
          style: TextStyle(
            color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
            fontFamily: 'IBM',
            fontSize: 18,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment:  MainAxisAlignment.end,
          crossAxisAlignment:   CrossAxisAlignment.end,
          children: <Widget>[
            TextFormField(

              decoration: InputDecoration(
                labelText: labelUserName ?? "",
                labelStyle: TextStyle(
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                  fontFamily: 'IBM',
                  fontSize: 16,
                ),
              ),
              // initialValue:  socialName,
              controller: controller,
              onChanged: onChanged,

              //     (value) {
              //   controller?.text = value;
              //   userName = value;
              // },

              style: TextStyle(
                color: themeMode.isLight
                    ? kTextColorLightMode
                    : kTextColorDarkMode,
                fontFamily: 'IBM',
                fontSize: 16,
              ),
            ),
          check != null ? TextButton(onPressed: check, child: const Text("تحقق",style:
          TextStyle(fontFamily: 'IBM',color: Colors.blue),)):const SizedBox()
          ],
          
        ),
        actions: <Widget>[
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: outlinedButton(),
            child:  const Text(
              'إلغاء',
              style: TextStyle(fontFamily: 'IBM',),
            ),
          ),
          ElevatedButton(
            onPressed: onSaved,
            style: fullButton(),
            child:  const Text(
              'حفظ',
              style: TextStyle(fontFamily: 'IBM',),
            ),
          ),
        ],
      );
    },
  );
}
