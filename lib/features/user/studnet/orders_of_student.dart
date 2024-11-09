import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';
import 'package:ween_blaqe/constants/localization.dart';

// import 'package:get/get.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/core/widgets/subtitle_class_widget.dart';
import 'package:ween_blaqe/core/widgets/title_class_widget.dart';

import '../../../constants/coordination.dart';
import '../../../constants/get_it_controller.dart';

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
              SizedBox(height: getIt<AppDimension>().isSmallScreen(context) ?
              30 : 50),
              TitleClassWidget(
                  title: SetLocalization.of(context)!
                      .getTranslateValue("bookings")),
              SubtitleWidget(
                  subtitle: SetLocalization.of(context)!
                      .getTranslateValue("booking_list")),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical:
                    getIt<AppDimension>().isSmallScreen(context) ? 0 : 25),
                child: Image.asset(
                    "assets/images/mobile-development.png",
                    height: getIt<AppDimension>().isSmallScreen(context) ?
                    130 * 2 :
                    (420 / 1.1),
                    width: getIt<AppDimension>().isSmallScreen(context) ?
                    130 * 2 : (450 / 1.1),

                    color: themeMode.isLight
                    ? kTextColorLightMode
                        : kTextColorDarkMode,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: getIt<AppDimension>().isSmallScreen(context) ?
                  25: 0

                ),
                child: Text(
                  SetLocalization.of(context)!
                      .getTranslateValue("booking_advantage_in_development"),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16,

                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode),
                softWrap: true,

                  maxLines: 2,
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
              //
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
