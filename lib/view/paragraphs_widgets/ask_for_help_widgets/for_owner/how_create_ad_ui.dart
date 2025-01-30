import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../controller/provider_controllers/providers/color_provider.dart';

class HowCreateAdUi extends ConsumerWidget {
  const HowCreateAdUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColorfulSafeArea(
      // bottomColor: Colors.transparent ,
      color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),

      child: Scaffold(
        backgroundColor:
            ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),
        appBar: AppBar(
          backgroundColor:
              ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                //title of what is system paying is allowed
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 25, 10),
                      child: Text(
                        " كيف أنشئ إعلان؟",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: ref
                              .read(themeModeNotifier.notifier)
                              .textTheme(ref: ref),
                          inherit: true,
                        ),
                      ),
                    ),
                    const Expanded(child: Text("")),
                  ],
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(25, 30, 30, 10),
                  child: Text(
                    // "يتطلب إنشاء إعلان على تطبيق 'وين بلاقي' تسجيل الدخول ، و من ثم الضغط على كملة إنشاء أو من خلال الدائرة في اسفل الشاشة  ثم إتباع الخظوات الاربعة لإتمام عملية النشر.",
                    "لإنشاء إعلان خاص بك على تطبيق وين بلاقي ، إذهب إلى الصفحة الرئيسية",
                    style: TextStyle(
                      fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                      color: ref
                          .read(themeModeNotifier.notifier)
                          .textTheme(ref: ref, withOpacity: 0.8),
                      inherit: true,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/images/apartments_images/Simulator Screenshot - iPhone 15 Pro Max - 2023-12-05 at 14.48.13.png",
                  width: 300,
                  height: 400,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(25, 50, 30, 10),
                  child: Text(
                    "إضعط على زر إضافة شقة المتواجد في اسفل الشاشة على اليمين",
                    style: TextStyle(
                      fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                      color: ref
                          .read(themeModeNotifier.notifier)
                          .textTheme(ref: ref, withOpacity: .8),
                      inherit: true,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/images/apartments_images/Simulator Screenshot - iPhone 15 Pro Max - 2023-12-05 at 14.32.35.png",
                  width: 300,
                  height: 400,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(25, 50, 30, 10),
                  child: Text(
                    // " في حال"
                    // " كنت مسجل في حساب طالب ، يمكنك نشر إعلانك ، فالتطبيق"
                    // " يسهل على المستخدم حجز او نشر شقة في نفس الوقت",
                    "ثم أضغط على زر 'اطلب الإشتراك عبر واتس أب'",
                    style: TextStyle(
                      fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                      color: ref
                          .read(themeModeNotifier.notifier)
                          .textTheme(ref: ref, withOpacity: .8),
                      inherit: true,
                    ),
                  ),
                ),

                Image.asset(
                  "assets/images/apartments_images/Simulator Screenshot - iPhone 15 Pro Max - 2023-12-05 at 14.27.36.png",
                  width: 300,
                  height: 400,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(25, 5, 30, 10),
                  child: Text(
                    // " في حال"
                    // " كنت مسجل في حساب طالب ، يمكنك نشر إعلانك ، فالتطبيق"
                    // " يسهل على المستخدم حجز او نشر شقة في نفس الوقت",
                    "وسيتم الرد على رسالتك خلال بضع دقائق",
                    style: TextStyle(
                      fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
                      color: ref
                          .read(themeModeNotifier.notifier)
                          .textTheme(ref: ref, withOpacity: .8),
                      inherit: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
