import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';
import 'package:ween_blaqe/constants/localization.dart';

// import 'package:get/get.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/core/widgets/subtitle_class_widget.dart';
import 'package:ween_blaqe/core/widgets/title_class_widget.dart';

// import '../../../constants/strings.dart';


// import '../../../core/widgets/orders_classs_widget/container_order_student_class_widget.dart';

class OrdersOfStudent extends StatefulWidget {
  const OrdersOfStudent({super.key});

  @override
  State<OrdersOfStudent> createState() => _OrdersOfStudentState();
}

class _OrdersOfStudentState extends State<OrdersOfStudent> {
  var show = false;
  bool isScreenIsReady = false;
  bool isEnd = false;

  @override
  Widget build(BuildContext context) {
    // var title = "شقة للطلاب في مدينة الخليل";
    // var location = "الخليل-واد الهرية";
    // var price = 900;
    // var image = "assets/images/apartments_images/image1.png";
    // var date = "04/14/2020";
    return Scaffold(
      backgroundColor: themeMode.isLight
          ? kBackgroundAppColorLightMode
          : kBackgroundAppColorDarkMode,
      body: UpgradeAlert(
        barrierDismissible: true,
        showReleaseNotes: false,
        upgrader: Upgrader(
          debugDisplayAlways: false,
          languageCode: 'ar',
          // minAppVersion: '3.0.4',
          countryCode: 'ps',
          // debugDisplayAlways: true,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [ 
               TitleClassWidget(title: SetLocalization.of(context)!.getTranslateValue("bookings")),
               SubtitleCalssWidget(subtitle: SetLocalization.of(context)!.getTranslateValue("booking_list")),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Image.asset(
                  "assets/images/mobile-development.png",
                  width: 450 / 1.3,
                  height: 420 / 1.3,
                  color: themeMode.isLight
                      ? kTextColorLightMode
                      : kTextColorDarkMode,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                ),
                child: Text(
                  SetLocalization.of(context)!.getTranslateValue("booking_feature_in_development"),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'IBM',
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode),
                ),
              )

              // (show == false
              //         ? Center(
              //             child: Container(
              //             margin: const EdgeInsets.fromLTRB(25, 200, 25, 0),
              //             child: TextButton(
              //               onPressed: () {
              //                 setState(() {
              //                   show = true;
              //                 });
              //               },
              //               child: Text("لم تقم بحجز أي شقة حتى الان",
              //                   style: TextStyle(
              //                     fontFamily: "IBM",
              //                     color: Colors.grey.shade800,
              //                     fontSize: 16,
              //                   )),
              //             ),
              //           ))
              //         : ContainerOrderOfStudentClassWidget(
              //             title: title,
              //             image: image,
              //             price: price,
              //             location: location,
              //             dateOfBooking: date)
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
