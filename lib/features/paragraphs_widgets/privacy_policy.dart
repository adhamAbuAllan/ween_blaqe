import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/localization.dart';

import '../../constants/nums.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  void initState() {
    super.initState();
  }

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
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
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

                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
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
                    fontSize: 16.0,
                    
                    inherit: true,
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
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
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
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
                    fontSize: 16.0,
                    
                    inherit: true,
                    fontWeight: FontWeight.w600,

                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
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
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
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
                    fontSize: 16.0,
                    
                    inherit: true,
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
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
                    fontSize: 18.0,
                    
                    fontWeight: FontWeight.w600,

                    inherit: true,
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
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
                    fontSize: 16.0,
                    
                    inherit: true,
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
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
                    fontSize: 16.0,
                    
                    inherit: true,
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
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
              //       fontSize: 18.0,
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
              //       fontSize: 16.0,
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
              //       fontSize: 18.0,
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
              //       fontSize: 16.0,
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
              //       fontSize: 18.0,
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
              //       fontSize: 16.0,
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
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
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
                    fontSize: 16.0,
                    
                    inherit: true,
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode,
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
              //       fontSize: 16.0,
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
