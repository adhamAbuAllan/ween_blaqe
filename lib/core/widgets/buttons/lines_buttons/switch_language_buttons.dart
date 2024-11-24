import 'package:flutter/material.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../constants/nums.dart';
import '../../../../controller/get_controllers.dart';
import '../../../../session/new_session.dart';
import '../../../utils/funcations/route_pages/push_routes.dart';

class SwitchLanguageButtons extends StatefulWidget {
  const SwitchLanguageButtons({super.key});

  @override
  State<SwitchLanguageButtons> createState() => _SwitchLanguageButtonsState();
}

class _SwitchLanguageButtonsState extends State<SwitchLanguageButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        // Keep the widget compact
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Icon(
              Icons.language_outlined,
              size: getIt<AppDimension>().isSmallScreen(context) ? 32 - 5 : 32,
              color:
                  themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
            ),
          ),
          const SizedBox(width: 25),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
                SetLocalization.of(context)!.getTranslateValue("language"),
                style: TextStyle(
                    fontSize: 18,

                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode)),
          ),
          const Expanded(child: Text("")),

          SizedBox(
            width:  getIt<AppDimension>().isSmallScreen(context) ?
            (NewSession.get("language", "ar") != "ar" ?50 : 48 ) : (NewSession
                .get("language", "ar") != "ar"? 64:62),
            height:getIt<AppDimension>().isSmallScreen(context) ?
            (NewSession.get("language", "ar") != "ar" ?30 : 28 ) : (NewSession
                .get("language", "ar") != "ar" ?36:34),
            child: ElevatedButton(
              onPressed: () async {
                if (NewSession.get("language", "ar") == "ar") {
                  return;
                }
                await myPushNameAnimation(context);

                NewSession.save("language", "ar");
                languageController.changeLanguage("ar", context);

                // changeLanguage('ar', context);
                // Call your language change function here
                // e.g., changeLanguage('ar', context);
              },
              style: ElevatedButton.styleFrom(
                elevation: NewSession.get("language", "ar") == 'ar' ? 0 : 3.5,
                backgroundColor: NewSession.get(
                            "language",
                            "ar"
                                "") ==
                        'ar'
                    ? (themeMode.isLight
                        ? kPrimaryColorLightMode
                        : kPrimaryColorDarkMode)
                    : Colors.grey, // Highlight selected language
              ),
              child:  Text('ar',
                  style: TextStyle(
                      fontSize: getIt<AppDimension>().isSmallScreen(context) ?
                      14: 16,  color: Colors.white)),
            ),
          ),
          const SizedBox(width: 10),
          // Spacing between buttons
          SizedBox(
            width:  getIt<AppDimension>().isSmallScreen(context) ?
            (NewSession.get("language", "en") != "en" ?50 : 48 ) : (NewSession
                .get("language", "en") != "en"? 64:62),
            height:getIt<AppDimension>().isSmallScreen(context) ?
            (NewSession.get("language", "en") != "en" ?30 : 28 ) : (NewSession
                .get("language", "en") != "en" ?36:34),
            child: ElevatedButton(
              onPressed: () async {
                if (NewSession.get("language", "en") == "en") {
                  return;
                }

                await myPushNameAnimation(context);
                NewSession.save("language", "en");
                languageController.changeLanguage("en", context);
                // Call your language change function here
                // e.g., changeLanguage('en', context);
              },
              style: ElevatedButton.styleFrom(
                elevation: NewSession.get("language", "en") == 'en' ? 0 : 3.5,
                backgroundColor: NewSession.get("language", "en") == 'en'
                    ? (themeMode.isLight
                        ? kPrimaryColorLightMode
                        : kPrimaryColorDarkMode)
                    : Colors.grey, // Highlight selected
                // language
              ),
              child:  Text('en',
                  style: TextStyle(
                      fontSize: getIt<AppDimension>().isSmallScreen(context) ?
                      14:16,  color: Colors.white)),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
