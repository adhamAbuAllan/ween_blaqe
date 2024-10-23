import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/nums.dart';
import '../../../core/utils/styles/button.dart';

class SocialMediaConnectionButton extends StatefulWidget {
  const SocialMediaConnectionButton({
    super.key,
    required this.isActive,
    required this.soicalName,
    required this.socialIcon,
  });

  final IconData? socialIcon;
  final String soicalName;
  final bool isActive;

  @override
  State<SocialMediaConnectionButton> createState() =>
      _SocialMediaConnectionButtonState();
}

class _SocialMediaConnectionButtonState
    extends State<SocialMediaConnectionButton> {
  @override
  Widget build(BuildContext context) {
    return Container(  // Wrap the button in a Container
      constraints: const BoxConstraints(maxWidth: double.infinity), // Set max width
      child: OutlinedButton(
        onPressed: () async {},
        style: outlinedButton(themeMode: themeMode).copyWith(
          padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
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
          padding: const EdgeInsets.all(8.0),
          child: Wrap(  // Use Wrap instead of Row
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 8, 0), // Add spacing
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
              Text(
                widget.soicalName, // Use soicalName property
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
            ],
          ),
        ),
      ),
    );
  }
}