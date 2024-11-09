import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';

import '../../../../constants/localization.dart';
import '../../../../constants/nums.dart';
import '../../../../core/widgets/buttons/lines_buttons/line_buttons.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';

//this class have buttons that go to paragraphs
class SystemPaying extends StatelessWidget {
  const SystemPaying({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: Scaffold(
        backgroundColor: themeMode.isLight
            ? kBackgroundAppColorLightMode
            : kBackgroundAppColorDarkMode,
        appBar: AppBar(
          title: Text(
            SetLocalization.of(context)!.getTranslateValue("payment"),
            style:
                const TextStyle(
                    fontWeight: FontWeight.w600
                ),
          ),
          backgroundColor: themeMode.isLight
              ? kPrimaryColorLightMode
              : kPrimaryColorDarkMode,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: themeMode.isLight
                        ? kContainerColorLightMode
                        : kContainerColorDarkMode,
                  ),
                  child: Column(
                    //cancel
                    children: [
                      askForHelpButton(() {
                        myPushName(
                            context, MyPagesRoutes.whatIsSystemPayingAllow);
                      },
                          SetLocalization.of(context)!
                              .getTranslateValue("accepted_payment_methods"),
                          context),
                      aline,
                      askForHelpButton(() {
                        myPushName(context, MyPagesRoutes.couldIPayByDeposit);
                      },
                          SetLocalization.of(context)!
                              .getTranslateValue("can_i_pay_deposit"),
                          context),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

//what_is_system_paying_allow?
class WhatIsSystemPayingAllow extends StatelessWidget {
  const WhatIsSystemPayingAllow({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: Scaffold(
        backgroundColor: themeMode.isLight
            ? kBackgroundAppColorLightMode
            : kBackgroundAppColorDarkMode,
        appBar: AppBar(
          backgroundColor: themeMode.isLight
              ? kPrimaryColorLightMode
              : kPrimaryColorDarkMode,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title of what is system paying is allowed
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              child: Text(
                SetLocalization.of(context)!
                    .getTranslateValue("accepted_payment_methods"),
                style: TextStyle(
                  fontSize: 20.0,
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                  
                  fontWeight: FontWeight.w600,
                  inherit: false,
                ),
                softWrap: true,
              ),
            ),
            //paragraph of what is system paying is allowed
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Text(
                SetLocalization.of(context)!
                    .getTranslateValue("payment_by_agreement"),
                style: TextStyle(
                  fontSize: 16.0,
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode.withOpacity(.8),
                  
                  fontWeight: FontWeight.w500,
                  inherit: true,
                ),
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
            //   child: Text(
            //     "سيتم العمل على إجاد طرق اخرى للدفع مثل"
            //     " البطاقات الإتمانية و غيرها من الطرق مسقبلاً بإذن الله",
            //     style: TextStyle(
            //         fontSize: 16.0,
            //         
            //         inherit: true,
            //         color: themeMode.isLight
            //             ? kTextColorLightMode
            //             : kTextColorDarkMode.withOpacity(.7)),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

//could pay deposit?
class CouldIPayByDeposit extends StatelessWidget {
  const CouldIPayByDeposit({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: Scaffold(
        backgroundColor: themeMode.isLight
            ? kBackgroundAppColorLightMode
            : kBackgroundAppColorDarkMode,
        appBar: AppBar(
          backgroundColor: themeMode.isLight
              ? kPrimaryColorLightMode
              : kPrimaryColorDarkMode,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title of what is system paying is allowed
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 10),
              child: Text(
                SetLocalization.of(context)!
                    .getTranslateValue("can_i_pay_deposit"),
                style: TextStyle(
                  fontSize: 20.0,
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                  fontWeight: FontWeight.w600,
                  
                  inherit: true,
                ),
                softWrap: true,
              ),
            ),
            //paragraph of what is system paying is allowed
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Text(
                SetLocalization.of(context)!
                    .getTranslateValue("deposit_payment_agreement"),
                style: TextStyle(
                  fontSize: 16.0,
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode.withOpacity(.8),
                  fontWeight: FontWeight.w500,
                  
                  inherit: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
