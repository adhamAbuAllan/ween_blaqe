import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ween_blaqe/constants/nums.dart';

import '../../../constants/localization.dart';
import '../../../controller/provider_controllers/providers/color_provider.dart';

class WhatIsMeanSSUi extends ConsumerWidget {
  const WhatIsMeanSSUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color:
      ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),


      child: Scaffold(
        backgroundColor: ref.read(themeModeNotifier.notifier)
            .backgroundAppTheme(ref: ref),

        appBar: AppBar(
          backgroundColor:
          ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),


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
                    color: ref.read(themeModeNotifier.notifier).textTheme(
                        ref: ref),


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
              child: Text(SetLocalization.of(context)!.getTranslateValue(
                  "shekel_per_month_note")
                ,
                style: TextStyle(
                  fontSize: 16.0,
                  color: ref.read(themeModeNotifier.notifier).textTheme(
                      ref: ref),

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
