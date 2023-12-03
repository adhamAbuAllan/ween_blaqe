// import 'package:colorful_safe_area/colorful_safe_area.dart';
// import 'package:flutter/material.dart';
// import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';
//
// import '../constants/nums.dart';
// import '../constants/strings.dart';
// import '../core/utils/funcations/route_pages/push_routes.dart';
// import '../core/widgets/buttons/lines_buttons/line_buttons.dart';
//
// class ScreensWillAddFuture extends StatelessWidget {
//   const ScreensWillAddFuture({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ColorfulSafeArea(
// bottomColor: Colors.transparent ,
//       color: kPrimaryColor,
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade200,
//         body: Center(
//           child: Column(
//             children: [
//               const Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(0, 50, 10, 0),
//                     child: Text(
//                       "شاشات سيتم إضافتها مستقبلاً",
//                       style: TextStyle(
//                         fontSize: 22.0,
//                         fontFamily: 'IBM',
//                         inherit: true,
//                       ),
//                     ),
//                   ),
//                   Expanded(child: Text("")),
//                 ],
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               buttonGoToPage(() {
//                 myPushName(context, MyPagesRoutes.searchFilter);
//               }, "التصفية"),
//               aline,
//               buttonGoToPage(() {
//                 myPushName(context, MyPagesRoutes.noInternet);
//               }, "لا يوجد إنترنت"),
//               aline,
//               buttonGoToPage(() {
//                 myPushName(context, MyPagesRoutes.searchNotFound);
//               }, "نتيجة بحث غير موجودة"),
//               aline,
//               buttonGoToPage(() {
//                 myPushName(context, MyPagesRoutes.refactorApartment);
//               }, "تعديل إعلان"),
//               aline,
//               buttonGoToPage(() {
//                 myPushName(context, MyPagesRoutes.masterHome);
//               }, "عرض شقق"),
//               aline,
//               buttonGoToPage(() {
//                 myPushName(context, MyPagesRoutes.getStarted);
//               }, "إبدأ الآن"),
//               aline,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
