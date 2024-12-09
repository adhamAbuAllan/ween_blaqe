import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/language_proivder.dart';

import '../../../../../constants/coordination.dart';
import '../../../../../constants/get_it_controller.dart';
import '../../../../../constants/localization.dart';
import '../../../../../constants/nums.dart';
import '../../../../../core/utils/funcations/route_pages/push_routes.dart';
import '../../../../../session/new_session.dart';

class LanguageSwitcherWidget extends ConsumerWidget {
  const LanguageSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

          /// buttons
          const ArabicButton(),
          const SizedBox(width: 10),

          const EnglishButton(),
          // Spacing between buttons

          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}

class ArabicButton extends ConsumerWidget {
  const ArabicButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///  inActive width button
   var inActiveWidthButton =  ref.read
     (widthSizeWithActiveArButtonInSmallScreen); // normal screen size
   var activeWidthButton =  ref.read
     (widthSizeWithActiveArButtonInSmallScreen);//small screen size

   /// Active height button
   var inActiveHeightButton =  ref.read
     (widthSizeWithInActiveArButton); // normal screen size
   var activeHeightButton =  ref.read
     (widthSizeWithInActiveArButton);//small screen size


    return SizedBox(
      width: getIt<AppDimension>().isSmallScreen(context)
          ? activeWidthButton
          : inActiveWidthButton,
      height: getIt<AppDimension>().isSmallScreen(context)
          ? activeHeightButton
          : inActiveHeightButton,
      child: ElevatedButton(
        onPressed: () async {
          if (NewSession.get("language", "ar") == "ar") {
            return;
          }
          await myPushNameAnimation(context);

          NewSession.save("language", "ar");

          /// languageController.changeLanguage("ar", context);

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
        child: Text('ar',
            style: TextStyle(
                fontSize:
                    getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                color: Colors.white)),
      ),
    );
  }
}

class EnglishButton extends ConsumerWidget {
  const EnglishButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///  inActive width button
    var inActiveWidthButton =  ref.read
      (widthSizeWithActiveEnButtonInSmallScreen); // normal screen size
    var activeWidthButton =  ref.read
      (widthSizeWithActiveEnButtonInSmallScreen);//small screen size

    /// Active height button
    var inActiveHeightButton =  ref.read
      (widthSizeWithInActiveEnButton); // normal screen size
    var activeHeightButton =  ref.read
      (widthSizeWithInActiveEnButton);//small screen size


    return SizedBox(
      width: getIt<AppDimension>().isSmallScreen(context)
          ? activeWidthButton
          : inActiveWidthButton,
      height: getIt<AppDimension>().isSmallScreen(context)
          ? activeHeightButton
          : inActiveHeightButton,
      child: ElevatedButton(
        onPressed: () async {
          if (NewSession.get("language", "en") == "en") {
            return;
          }

          await myPushNameAnimation(context);
          NewSession.save("language", "en");

          /// languageController.changeLanguage("en", context);
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
        child: Text('en',
            style: TextStyle(
                fontSize:
                    getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                color: Colors.white)),
      ),
    );
  }
}
