import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import 'package:ween_blaqe/constants/nums.dart';

 


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
      bottomColor: Colors.transparent ,
      color: kPrimaryColor,
      child: Scaffold(
        backgroundColor: kBackgroundAppColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //title
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 20, 30),
                    child: Text(
                      "سياسة الخصوصية",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontFamily: 'IBM',
                        inherit: true,
color:kTextColor,
                      ),
                    ),
                  ),
                  Expanded(child: Text("")),
                ],
              ),
              //title of info and use that
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 25, 10),
                    child: Text(
                      "جمع المعلومات و استخدامها",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontFamily: 'IBM',
                        inherit: true,
color:kTextColor,
                      ),
                    ),
                  ),
                  Expanded(child: Text("")),
                ],
              ),
              //paragraph of info and use that
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                child: const Text(
                  "نتحمل المسؤولية كاملة فيما يتعلق بحماية معلوماتك الشخصية ونضعها فوق"
                  " كل إعتبار. توضح هذه السياسة كيف نستخدم المعلومات الشخصية التي "
                  "نتلقاها منك، وعند استخدامك للتطبيق الذي يضم منصات الهواتف الذكية "
                  "'اندرويد' و 'ios' تكون بذلك موافقًا على استخدام تلك المعلومات ",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'IBM',
                    inherit: true,
color:kTextColor,
                  ),
                ),
              ),
              //title of into that get from user
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(0, 0, 25, 10),
                child: const Text(
                  "العلومات التي نحصل عليها:",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: 'IBM',
                    inherit: true,
color:kTextColor,
                  ),
                ),
              ),
              //paragraph of info that get them from user
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                child: const Text(
                  // "معلومات شخصية و معلومات الحجز",
                  "معلومات المالك",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'IBM',
                    inherit: true,
color:kTextColor,
                  ),
                ),
              ),
              //title of info that app use
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(0, 0, 25, 5),
                child: const Text(
                  "استخدام العلومات ",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: 'IBM',
                    inherit: true,
color:kTextColor,
                  ),
                ),
              ),
              //subtitle that what info we use
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                child: const Text(
                  // "نسخدم العلومات لكل من المالك و الطالب كما يلي ",
                  "نستخدم معلومات المالك كما يلي",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'IBM',
                    inherit: true,
color:kTextColor,
                  ),
                ),
              ),
              //info of owner
              // Container(
              //   width: double.infinity,
              //   padding: const EdgeInsets.fromLTRB(0, 0, 25, 10),
              //   child: const Text(
              //     "معلومات المالك ",
              //     style: TextStyle(
              //       fontSize: 22.0,
              //       fontFamily: 'IBM',
              //       inherit: true,
// color:kTextColor,
              //     ),
              //   ),
              // ),
              //use phone number of owner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(0, 0, 25, 10),
                child: const Text(
                  "الهاتف",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'IBM',
                    inherit: true,
color:kTextColor,
                  ),
                ),
              ),
              //paragraph way app use phone number of owner
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                child: const Text(
                  "يُستخدم رقم الهاتف الخاص بك ليستطيع المستخدم التواصل معك في حال أراد الاستفسار عن الإعلان الخاص بك",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'IBM',
                    inherit: true,
color:kTextColor,
                  ),
                ),
              ),
              //paragraph2 way app use phone number of owner
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                child: const Text(
                  "كذلك نستخدم رقم الهاتف الخاص بالمالك في حال وجود بعض النشاطات الغير مرغوب فيها ",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'IBM',
                    inherit: true,
color:kTextColor,
                  ),
                ),
              ),

              //info of student
              // Container(
              //   width: double.infinity,
              //   padding: const EdgeInsets.fromLTRB(0, 0, 25, 10),
              //   child: const Text(
              //     "معلومات الطالب ",
              //     style: TextStyle(
              //       fontSize: 22.0,
              //       fontFamily: 'IBM',
              //       inherit: true,
// color:kTextColor,
              //     ),
              //   ),
              // ),
              //use phone number of student
              // Container(
              //   width: double.infinity,
              //   padding: const EdgeInsets.fromLTRB(0, 0, 25, 10),
              //   child: const Text(
              //     "الهاتف",
              //     style: TextStyle(
              //       fontSize: 18.0,
              //       fontFamily: 'IBM',
              //       inherit: true,
// color:kTextColor,
              //     ),
              //   ),
              // ),
              //paragraph way app use phone number of student
              // Container(
              //   width: double.infinity,
              //   margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
              //   child: const Text(
              //     " نستخدم رقم الهاتف الخاص بالطالب"
              //     " في حال وجود بعض النشاطات الغير مرغوب فيها ",
              //     style: TextStyle(
              //       fontSize: 16.0,
              //       fontFamily: 'IBM',
              //       inherit: true,
// color:kTextColor,
              //     ),
              //   ),
              // ),
              //use info of university of student
              // Container(
              //   width: double.infinity,
              //   padding: const EdgeInsets.fromLTRB(0, 0, 25, 10),
              //   child: const Text(
              //     "الجامعة",
              //     style: TextStyle(
              //       fontSize: 18.0,
              //       fontFamily: 'IBM',
              //       inherit: true,
// color:kTextColor,
              //     ),
              //   ),
              // ),
              //paragraph way app use info of university of student
              // Container(
              //   width: double.infinity,
              //   margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
              //   child: const Text(
              //     "  من خلال تحديد الطالب الجامعة "
              //     "التي يدرس بها فإننا نعرض على الطالب الشقق "
              //     "المتواجدة في المدينة التي تتواجد بها الجامعة ",
              //     style: TextStyle(
              //       fontSize: 16.0,
              //       fontFamily: 'IBM',
              //       inherit: true,
// color:kTextColor,
              //     ),
              //   ),
              // ),
              //use gender of student
              // Container(
              //   width: double.infinity,
              //   padding: const EdgeInsets.fromLTRB(0, 0, 25, 10),
              //   child: const Text(
              //     "الجنس",
              //     style: TextStyle(
              //       fontSize: 18.0,
              //       fontFamily: 'IBM',
              //       inherit: true,
// color:kTextColor,
              //     ),
              //   ),
              // ),
              //paragraph way app use info of gender of student
              // Container(
              //   width: double.infinity,
              //   margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
              //   child: const Text(
              //     "نقوم بعرض الشقق له/لها حسب جنس الطالب ",
              //     style: TextStyle(
              //       fontSize: 16.0,
              //       fontFamily: 'IBM',
              //       inherit: true,
// color:kTextColor,
              //     ),
              //   ),
              // ),

              //apartment info
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(0, 0, 25, 10),
                child: const Text(
                  "معلومات شقة المالك",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: 'IBM',
                    inherit: true,
color:kTextColor,
                  ),
                ),
              ),
              //paragraph way app use info of apartment
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                child: const Text(
                  "تستخدم معلومات"
                  " الشقة الخاصة بالمالك ليتمكن المستخدم من معرفة"
                  " تفاصيل الشقة الخاص بالمالك بشكل أفضل من خلال "
                  "البيانات المدخلة عند إنشاء الإعلان الخاص بالشقة",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'IBM',
                    inherit: true,
color:kTextColor,
                  ),
                ),
              ),

              //data of users that app get from them
              // Container(
              //   width: double.infinity,
              //   padding: const EdgeInsets.fromLTRB(0, 0, 25, 10),
              //   child: const Text(
              //     "البيانات التي نجمعها من التطبيق",
              //     style: TextStyle(
              //       fontSize: 22.0,
              //       fontFamily: 'IBM',
              //       inherit: true,
// color:kTextColor,
              //     ),
              //   ),
              // ),
              // Container(
              //   width: double.infinity,
              //   margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
              //   child: const Text(
              //     "العلومات التي قمت بإدخالها عند إنشاء حسابك على"
              //     " التطبيق مثل المعلومات الشخصية ، والتي تتضمن "
              //     "رقم هاتفك ، و اسمك و معرَّف الجهاز، وعنوان الIP",
              //     style: TextStyle(
              //       fontSize: 16.0,
              //       fontFamily: 'IBM',
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
