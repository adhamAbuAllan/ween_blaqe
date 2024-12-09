import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import 'package:ween_blaqe/constants/nums.dart';

import '../../../constants/localization.dart';
class WhatIsMeanSS extends StatelessWidget {
  const WhatIsMeanSS({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent ,
      color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: Scaffold(
        backgroundColor: themeMode.isLight ? kBackgroundAppColorLightMode : kBackgroundAppColorDarkMode,

        appBar: AppBar(
          backgroundColor: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title of what is system paying is allowed
             Padding(
               padding: const EdgeInsets.fromLTRB(25, 50, 25, 10),
               child: Text(
                 SetLocalization.of(context)!.getTranslateValue("what_is_ss"),
                 style: TextStyle(
                   fontSize: 20.0,
                   color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
                   
                   fontWeight: FontWeight.w600 ,
                   inherit: true,
                 ),
               softWrap: true,
               ),
             ),
            //paragraph of what is system paying is allowed
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Text(SetLocalization.of(context)!.getTranslateValue("shekel_per_month_note")
                ,
                style: TextStyle(
                  fontSize: 16.0,
                  color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode.withOpacity(.8),
                  
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

// class CouldBeOwnerAndStudentInOneTime extends StatelessWidget {
//   const CouldBeOwnerAndStudentInOneTime({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ColorfulSafeArea(
// bottomColor: Colors.transparent ,
//       color: kPrimaryColor,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: kPrimaryColor,
//         ),
//         body: Column(
//           children: [
//             //title of what is system paying is allowed
//             Container(
//               margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//               padding: const EdgeInsets.fromLTRB(0, 50, 25, 10),
//               child: const Text(
//                 "هل يمكن أن اكون مؤجر و مستأجر في نفس الوقت؟",
//                 style: TextStyle(
//                   fontSize: 20.0,
//                   color: Colors.black87,
//                   
//                   inherit: false,
//                 ),
//               ),
//             ),
//             // Container(
//             //   padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
//             //
//             //   child: Text(
//             //     "هل يمكن أن اكون مؤجر",
//             //
//             //     style: TextStyle(
//             //
//             //       fontSize: 20.0,
//             //       color: Colors.black87,
//             //       
//             //       inherit: false,
//             //     ),
//             //   ),
//             // ),
//             //paragraph of what is system paying is allowed
//             Container(
//               width: double.infinity,
//               margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
//               child: Text(
//                 "نعم، حيث يسمح لك تطبيق 'وين بلاقي' أن تقوم بإنشاء "
//                 "إعلانك الخاص و حجز شقة في نفس الوقت ، دون تغيير حسابك الاصلي. ",
//                 style: TextStyle(
//                   fontSize: 16.0,
//                   color: Colors.grey.shade800,
//                   
//                   inherit: true,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
