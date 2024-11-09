import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../../../../constants/localization.dart';
import '../../../../constants/nums.dart';
import '../../../../core/widgets/buttons/lines_buttons/line_buttons.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';

class SystemBooking extends StatelessWidget {
  const SystemBooking({super.key});

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
          title:  Text(
            SetLocalization.of(context)!
                .getTranslateValue("reservation"),
            style: const TextStyle(
                fontWeight: FontWeight.w600),
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
                    children: [
                      askForHelpButton(() {
                        myPushName(
                            context, MyPagesRoutes.howCouldBookingApartment);
                      },
                          SetLocalization.of(context)!
                              .getTranslateValue("how_to_book_apartment"),context),
                      // aline,
                      // askForHelpButton(() {
                      //   myPushName(context, MyPagesRoutes.couldICancelABooking);
                      // }, "هل يمكنني إلغاء الحجز؟"),
                      // aline,
                      // askForHelpButton(() {
                      //   myPushName(context,
                      //       MyPagesRoutes.howLongIsTheReservationAvailable);
                      // }, "ما هي مدة الحجز المتاحة؟")
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class HowCouldBookingApartment extends StatelessWidget {
  const HowCouldBookingApartment({super.key});

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              //title of what is system paying is allowed
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 50, 25, 10),
                child: Text(
                  SetLocalization.of(context)!
                      .getTranslateValue("how_to_book_apartment"),
                  style: TextStyle(
                    fontSize: 20.0,
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
                    
                    fontWeight: FontWeight.w800,

                    inherit: true,
                  ),
                softWrap: true,
                ),

              ),
              //paragraph of how user booking apartment
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                child: Text(
                  // "يتطلب حجز شقة على تطبيق 'وين بلاقي' تسجيل دخول المستخدم أولاً ثم إتباع الخطوات التالية",
                  "${SetLocalization.of(context)!.getTranslateValue("booking_steps")}:",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode.withOpacity(.8),
                    
                    fontWeight: FontWeight.w700,
                    inherit: true,
                  ),
                ),
              ),
              //step 1 text
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  SetLocalization.of(context)!
                      .getTranslateValue("step_one_go_to_homepage"),
                  style: TextStyle(
                      fontSize: 18.0,
                      
                      fontWeight: FontWeight.w600,
                      inherit: true,
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode),
                ),
              ),
              //paragraph step 1
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  // "بعد إختيارك لأعلان ما اظغط على زر احجز الان",
                  SetLocalization.of(context)!
                      .getTranslateValue("navigate_to_homepage"),
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

              //step 2 text
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  SetLocalization.of(context)!
                      .getTranslateValue("step_two_find_apartment"),
                  style: TextStyle(
                      fontSize: 18.0,
                      
                      fontWeight: FontWeight.w600,
                      inherit: true,
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode),
                ),
              ),
              //paragraph step 2
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  // "إختر مدة إقامتك من خلال إضافة عدد الأشهر ",
                  SetLocalization.of(context)!
                      .getTranslateValue("step_two_details"),
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
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: RichText(
                  softWrap: true,

                  // "إختر مدة إقامتك من خلال إضافة عدد الأشهر ",
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text:
                            "${SetLocalization.of(context)!.getTranslateValue("tip")}:",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: themeMode.isLight
                              ? kPrimaryColorLightMode
                              : kPrimaryColorDarkMode,
                          
                          fontWeight: FontWeight.w600,
                          inherit: true,
                        )),
                    TextSpan(
                        text: " ${SetLocalization.of(context)!
                            .getTranslateValue("tip_contact_owner")}",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: themeMode.isLight
                              ? kTextColorLightMode
                              : kTextColorDarkMode.withOpacity(.7),
                          
                          fontWeight: FontWeight.w500,
                          inherit: true,
                        ))
                  ]),
                ),
              ),

              //step 3 text
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  SetLocalization.of(context)!
                      .getTranslateValue("step_three_view_more_details"),
                  style: TextStyle(
                      fontSize: 18.0,
                      
                      fontWeight: FontWeight.w600,
                      inherit: true,
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode),
                ),
              ),
              //paragraph step 3
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  // "إضغط على زر 'تأكيد الحجز'",
                  SetLocalization.of(context)!
                      .getTranslateValue("step_three_details"),
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
              //step 4 text
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  SetLocalization.of(context)!
                      .getTranslateValue("step_four_select_contact_method"),
                  style: TextStyle(
                      fontSize: 18.0,
                      
                      inherit: true,
                      fontWeight: FontWeight.w600,
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode),
                ),
              ),
              //paragraph step 4
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  // "ستظهر لك رسالة لتأكيد طلب الحجز ،إضغط على زر 'نعم،متابعة'",
                  SetLocalization.of(context)!
                      .getTranslateValue("step_four_details"),
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
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  // "تم إرسال الطلب",
                  SetLocalization.of(context)!
                      .getTranslateValue("step_five_contact_owner_to_book"),
                  style: TextStyle(
                      fontSize: 18.0,
                      
                      inherit: true,
                      fontWeight: FontWeight.w600,
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode),
                ),
              ),
              //what next
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  // "سيرسل طلبك إلى المؤجر الذي بدوره يقبل الطلب أو يرفضه، في كلا الحالتين سيصلك إشعار عن الإجراء الذي إتخذه المؤجر.",
                  SetLocalization.of(context)!
                      .getTranslateValue("step_five_details"),
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
      ),
    );
  }
}

//could I cancel a booking ?
class CouldICancelABooking extends StatelessWidget {
  const CouldICancelABooking({super.key});

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
          children: [
            //title of what is system paying is allowed
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 50, 25, 10),
                  child: Text(
                    SetLocalization.of(context)!
                        .getTranslateValue("booking_cancellation"),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                      
                      inherit: true,
                    ),
                  ),
                ),
                const Expanded(child: Text("")),
              ],
            ),
            //paragraph of what is system paying is allowed
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Text(
                "",
                style: TextStyle(
                  fontSize: 16.0,
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode.withOpacity(.8),
                  
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

//ما مدة الحجز المتاحة
//How long is the reservation available
class HowLongIsTheReservationAvailable extends StatelessWidget {
  const HowLongIsTheReservationAvailable({super.key});

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
          children: [
            //title of what is system paying is allowed
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 50, 25, 10),
                  child: Text(
                    SetLocalization.of(context)!
                        .getTranslateValue("booking_duration_info"),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                      
                      inherit: true,
                    ),
                  ),
                ),
                const Expanded(child: Text("")),
              ],
            ),
            //paragraph of what is system paying is allowed
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Text(
                SetLocalization.of(context)!
                    .getTranslateValue("booking_duration_details"),
                style: TextStyle(
                  fontSize: 16.0,
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode.withOpacity(.8),
                  
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
