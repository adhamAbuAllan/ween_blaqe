import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants/coordination.dart';
import '../../constants/get_it_controller.dart';
import '../../controller/provider_controllers/providers/color_provider.dart';

class PrivacyPolicyUi extends ConsumerStatefulWidget {
  const PrivacyPolicyUi({super.key});

  @override
  ConsumerState createState() => _PrivacyPolicyUiState();
}

class _PrivacyPolicyUiState extends ConsumerState<PrivacyPolicyUi> {
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color:
      ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),

      child: Scaffold(
        backgroundColor: ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),

        appBar: AppBar(
          backgroundColor: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),

        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
                child: Text(
                  SetLocalization.of(context)!
                      .getTranslateValue("privacy_policy"),
                  style: TextStyle(
                    fontSize: 28.0,

                    fontWeight: FontWeight.w800,

                    inherit: true,
                    color:ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                  ),
                  softWrap: true,
                ),
              ),
              //title of info and use that
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                child: Text(
                  SetLocalization.of(context)!
                      .getTranslateValue("collect_and_use_data"),
                  style: TextStyle(
                    fontSize: 22.0,

                    inherit: true,
                    fontWeight: FontWeight.w600,

                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                  ),
                  softWrap: true,
                ),
              ),
              //paragraph of info and use that
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  SetLocalization.of(context)!
                      .getTranslateValue("data_protection_policy"),
                  style: TextStyle(
                    fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,

                    inherit: true,
                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                  ),
                ),
              ),
              //title of into that get from user
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                child: Text(
                  SetLocalization.of(context)!
                      .getTranslateValue("collected_information"),
                  style: TextStyle(
                    fontSize: 22.0,

                    fontWeight: FontWeight.w700,

                    inherit: true,
                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                  ),
                ),
              ),
              //paragraph of info that get them from user
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  // "معلومات شخصية و معلومات الحجز",
                  SetLocalization.of(context)!.getTranslateValue("owner_info"),
                  style: TextStyle(
                    fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,

                    inherit: true,
                    fontWeight: FontWeight.w600,

                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                  ),
                ),
              ),
              //title of info that app use
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 5),
                child: Text(
                  SetLocalization.of(context)!.getTranslateValue("info_usage"),
                  style: TextStyle(
                    fontSize: 22.0,

                    fontWeight: FontWeight.w500,

                    inherit: true,
                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                  ),
                ),
              ),
              //subtitle that what info we use
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  // "نسخدم العلومات لكل من المالك و الطالب كما يلي ",
                  SetLocalization.of(context)!
                      .getTranslateValue("owner_info_usage"),
                  style: TextStyle(
                    fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,

                    inherit: true,
                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                  ),
                ),
              ),
              //info of owner
              // Container(
              //   width: double.infinity,
              //   padding:    EdgeInsets.fromLTRB(0, 0, 25, 10),
              //   child:    Text(
              //     "معلومات المالك ",
              //     style: TextStyle(
              //       fontSize: 22.0,
              //
              //       inherit: true,
// color:kTextColor,
              //     ),
              //   ),
              // ),
              //use phone number of owner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                child: Text(
                  SetLocalization.of(context)!.getTranslateValue("the_phone"),
                  style: TextStyle(
                    fontSize: getIt<AppDimension>().isSmallScreen(context) ? 16 : 18,

                    fontWeight: FontWeight.w600,

                    inherit: true,
                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                  ),
                ),
              ),
              //paragraph way app use phone number of owner
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  SetLocalization.of(context)!.getTranslateValue("phone_usage"),
                  style: TextStyle(
                    fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,

                    inherit: true,
                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                  ),
                ),
              ),
              //paragraph2 way app use phone number of owner
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  SetLocalization.of(context)!.getTranslateValue("info_phone_usage_details"),
                  style: TextStyle(
                    fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,

                    inherit: true,
                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                  ),
                ),
              ),

              //info of student
              // Container(
              //   width: double.infinity,
              //   padding:    EdgeInsets.fromLTRB(0, 0, 25, 10),
              //   child:    Text(
              //     "معلومات الطالب ",
              //     style: TextStyle(
              //       fontSize: 22.0,
              //
              //       inherit: true,
// color:kTextColor,
              //     ),
              //   ),
              // ),
              //use phone number of student
              // Container(
              //   width: double.infinity,
              //   padding:    EdgeInsets.fromLTRB(0, 0, 25, 10),
              //   child:    Text(
              //     "الهاتف",
              //     style: TextStyle(
              //       fontSize: getIt<AppDimension>().isSmallScreen(context) ? 16 : 18,
              //
              //       inherit: true,
// color:kTextColor,
              //     ),
              //   ),
              // ),
              //paragraph way app use phone number of student
              // Container(
              //   width: double.infinity,
              //   margin:    EdgeInsets.fromLTRB(25, 0, 30, 10),
              //   child:    Text(
              //     " نستخدم رقم الهاتف الخاص بالطالب"
              //     " في حال وجود بعض النشاطات الغير مرغوب فيها ",
              //     style: TextStyle(
              //       fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
              //
              //       inherit: true,
// color:kTextColor,
              //     ),
              //   ),
              // ),
              //use info of university of student
              // Container(
              //   width: double.infinity,
              //   padding:    EdgeInsets.fromLTRB(0, 0, 25, 10),
              //   child:    Text(
              //     "الجامعة",
              //     style: TextStyle(
              //       fontSize: getIt<AppDimension>().isSmallScreen(context) ? 16 : 18,
              //
              //       inherit: true,
// color:kTextColor,
              //     ),
              //   ),
              // ),
              //paragraph way app use info of university of student
              // Container(
              //   width: double.infinity,
              //   margin:    EdgeInsets.fromLTRB(25, 0, 30, 10),
              //   child:    Text(
              //     "  من خلال تحديد الطالب الجامعة "
              //     "التي يدرس بها فإننا نعرض على الطالب الشقق "
              //     "المتواجدة في المدينة التي تتواجد بها الجامعة ",
              //     style: TextStyle(
              //       fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
              //
              //       inherit: true,
// color:kTextColor,
              //     ),
              //   ),
              // ),
              //use gender of student
              // Container(
              //   width: double.infinity,
              //   padding:    EdgeInsets.fromLTRB(0, 0, 25, 10),
              //   child:    Text(
              //     "الجنس",
              //     style: TextStyle(
              //       fontSize: getIt<AppDimension>().isSmallScreen(context) ? 16 : 18,
              //
              //       inherit: true,
// color:kTextColor,
              //     ),
              //   ),
              // ),
              //paragraph way app use info of gender of student
              // Container(
              //   width: double.infinity,
              //   margin:    EdgeInsets.fromLTRB(25, 0, 30, 10),
              //   child:    Text(
              //     "نقوم بعرض الشقق له/لها حسب جنس الطالب ",
              //     style: TextStyle(
              //       fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
              //
              //       inherit: true,
// color:kTextColor,
              //     ),
              //   ),
              // ),

              //apartment info
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                child: Text(
                  SetLocalization.of(context)!.getTranslateValue("owner_apartment_info"),
                  style: TextStyle(
                    fontSize: 22.0,

                    fontWeight: FontWeight.w600,

                    inherit: true,
                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                  ),
                ),
              ),
              //paragraph way app use info of apartment
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  SetLocalization.of(context)!.getTranslateValue("owner_apartment_info_usage")
                  ,
                  style: TextStyle(
                    fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,

                    inherit: true,
                    color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                  ),
                ),
              ),

              //data of users that app get from them
              // Container(
              //   width: double.infinity,
              //   padding:    EdgeInsets.fromLTRB(0, 0, 25, 10),
              //   child:    Text(
              //     "البيانات التي نجمعها من التطبيق",
              //     style: TextStyle(
              //       fontSize: 22.0,
              //
              //       inherit: true,
// color:kTextColor,
              //     ),
              //   ),
              // ),
              // Container(
              //   width: double.infinity,
              //   margin:    EdgeInsets.fromLTRB(25, 0, 30, 10),
              //   child:    Text(
              //     "العلومات التي قمت بإدخالها عند إنشاء حسابك على"
              //     " التطبيق مثل المعلومات الشخصية ، والتي تتضمن "
              //     "رقم هاتفك ، و اسمك و معرَّف الجهاز، وعنوان الIP",
              //     style: TextStyle(
              //       fontSize: getIt<AppDimension>().isSmallScreen(context) ? 14 : 16,
              //
              //       inherit: true,
// color:kTextColor,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}


