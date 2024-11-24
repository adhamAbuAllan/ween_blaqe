import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';
import '../../../../../session/new_session.dart';

class JoinDateWidget extends ConsumerWidget {
  const JoinDateWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      // height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: themeMode.isLight
            ? kContainerColorLightMode
            : kContainerColorDarkMode,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Row(children: [],),

          Text(SetLocalization.of(context)!.getTranslateValue("joining_time"),
              style: TextStyle(
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  fontFamily: "IBM")),
          const SizedBox(
            height: 15,
          ),
          Text(
              " ${SetLocalization.of(context)!.getTranslateValue("account_created_since")}  ${NewSession.get("createdAt", "def")} ${SetLocalization.of(context)!.getTranslateValue("until_now")}",
              style: TextStyle(
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "IBM")),
        ],
      ),
    );
  }
}
