import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../../../../constants/nums.dart';
import '../../../../core/widgets/buttons/lines_buttons/line_buttons.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';

class SystemBooking extends StatelessWidget {
  const SystemBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: kPrimaryColor,
      child: Scaffold(
        backgroundColor: kBackgroundAppColor,
        appBar: AppBar(
          title: const Text(
            'طريق الحجز',
            style: TextStyle(fontFamily: 'IBM'),
          ),
          backgroundColor: kPrimaryColor,
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
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      askForHelpButton(() {
                        myPushName(
                            context, MyPagesRoutes.howCouldBookingApartment);
                      }, "كيف يمكنني حجز شقة؟"),
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
  const HowCouldBookingApartment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: kPrimaryColor,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //title of what is system paying is allowed
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 25, 10),
                    child: Text(
                      "كيف يمكنني حجز شقة",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black87,
                        fontFamily: 'IBM',
                        inherit: true,
                      ),
                    ),
                  ),
                  Expanded(child: Text("")),
                ],
              ),
              //paragraph of how user booking apartment
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                child: Text(
                  // "يتطلب حجز شقة على تطبيق 'وين بلاقي' تسجيل دخول المستخدم أولاً ثم إتباع الخطوات التالية",
                  "لحجز شقة إتبع الخطوات التالية:",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey.shade800,
                    fontFamily: 'IBM',
                    inherit: true,
                  ),
                ),
              ),
              //step 1 text
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                child: const Text(
                  "أولًا، إذهب إلى الصفحة الرئيسية",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'IBM',
                    inherit: true,
                  ),
                ),
              ),
              //paragraph step 1
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                child: Text(
                  // "بعد إختيارك لأعلان ما اظغط على زر احجز الان",
                  "إذهب إلى القائمة الرئيسية من خلال الضغط على زر أيقونة المنزل المتواجدة في الجزء السفلي على يمين الواجهة. ",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey.shade800,
                    fontFamily: 'IBM',
                    inherit: true,
                  ),
                ),
              ),

              //step 2 text
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                child: const Text(
                  "ثانيًا: قم بإجاد الشقة المناسبة",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'IBM',
                    inherit: true,
                  ),
                ),
              ),
              //paragraph step 2
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                child: Text(
                  // "إختر مدة إقامتك من خلال إضافة عدد الأشهر ",
                  "إبحث عن الشقة المناسبة لك, يمكنك إختيار الصنف الذي تريده من خلال زر 'صنف السكن' المتواجد على يمين الواجهة في الجزء العلوي منها، ويظهر هذا الزر من خلال التمرير إلى الأسفل و من ثم إلى الأعلى أو من خلال الضغط على أي عنصر في الواجهة الرئيسية.",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey.shade800,
                    fontFamily: 'IBM',
                    inherit: true,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),

                child: RichText(
                  softWrap: true,

                  // "إختر مدة إقامتك من خلال إضافة عدد الأشهر ",
                  text: TextSpan(

                      children: <TextSpan>[

                    const TextSpan(
                        text: "نصيحة:",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.orange,
                          fontFamily: 'IBM',
                          inherit: true,
                        )),
                    TextSpan(

                        text:
                            "في حال لم تجد الشقة المناسبة تواصل مع أي مالك يمتلك شقة في المدينة التي لم تجد فيها الشقة المطلوبة ، فقد يتمكن من مساعدتك للتواصل مع شخص آخر يمتلك الشقة التي تبحث عنها.",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black.withOpacity(.7),
                          fontFamily: 'IBM',
                          inherit: true,
                        ))
                  ]),
                ),
              ),

              //step 3 text
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                child: const Text(
                  "ثالثًا: أعرض المزيد من التفاصيل",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'IBM',
                    inherit: true,
                  ),
                ),
              ),
              //paragraph step 3
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                child: Text(
                  // "إضغط على زر 'تأكيد الحجز'",
                  "قم بضغط على زر عرض المزيد، لعرض المزيد من التفاصيل حول الشقة المطلوبة.",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey.shade800,
                    fontFamily: 'IBM',
                    inherit: true,
                  ),
                ),
              ),
              //step 4 text
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                child: const Text(
                  "رابعًا: إختر وسيلة التواصل المناسبة",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'IBM',
                    inherit: true,
                  ),
                ),
              ),
              //paragraph step 4
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                child: Text(
                  // "ستظهر لك رسالة لتأكيد طلب الحجز ،إضغط على زر 'نعم،متابعة'",
                  "في مربع الأستفسار ، إختر وسيلة التواصل المناسبة لك، لتتمكن من التواصل مع مالك الشقة.",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey.shade800,
                    fontFamily: 'IBM',
                    inherit: true,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                child: const Text(
                  // "تم إرسال الطلب",
                  "خامسًا: تواصل مع المالك للحجز",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'IBM',
                    inherit: true,
                  ),
                ),
              ),
              //what next
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                child: Text(
                  // "سيرسل طلبك إلى المؤجر الذي بدوره يقبل الطلب أو يرفضه، في كلا الحالتين سيصلك إشعار عن الإجراء الذي إتخذه المؤجر.",
                  "قم بتواصل مع مالك الشقة لتحصل على المزيد من التفاصيل حول الشقة و آلية حجزها.",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey.shade800,
                    fontFamily: 'IBM',
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
  const CouldICancelABooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: kPrimaryColor,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
        ),
        body: Column(
          children: [
            //title of what is system paying is allowed
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 25, 10),
                  child: Text(
                    " هل يمكنني إلغاء حجز شقة؟",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black87,
                      fontFamily: 'IBM',
                      inherit: true,
                    ),
                  ),
                ),
                Expanded(child: Text("")),
              ],
            ),
            //paragraph of what is system paying is allowed
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
              child: Text(
                "",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey.shade800,
                  fontFamily: 'IBM',
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
  const HowLongIsTheReservationAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: kPrimaryColor,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
        ),
        body: Column(
          children: [
            //title of what is system paying is allowed
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 25, 10),
                  child: Text(
                    "ما هي مدة الحجز المتاحة؟",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black87,
                      fontFamily: 'IBM',
                      inherit: true,
                    ),
                  ),
                ),
                Expanded(child: Text("")),
              ],
            ),
            //paragraph of what is system paying is allowed
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
              child: Text(
                "تكون مدة الحجز"
                " حسب إختيارك لعدد الإشهر عند طلبك لحجز شقة ما، وقد"
                " يتم الاتفاق بينك و بين المؤجر على مدة الحجز مسبقًا.",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey.shade800,
                  fontFamily: 'IBM',
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
