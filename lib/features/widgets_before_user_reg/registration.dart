import 'dart:convert';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/function_that_effect_widgets/remove_zero_from_phone_number.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import '../../api/type_of_user.dart';
 

import 'package:ween_blaqe/constants/nums.dart';
import '../../core/widgets/alirt_class_widget.dart';
import '../../core/widgets/dropdown_classes_widgets/dropdown_type_of_user.dart';
import '../../core/widgets/dropdown_classes_widgets/dropdown_unviversty.dart';
import '../../core/widgets/registration/dropdown_button.dart';
import '../../core/widgets/registration/text_field_of_password_class_widget.dart';
import '../../core/widgets/registration/text_filed_class_widget.dart';
import '../../sesstion/sesstion_of_user.dart';
import '../../urls_of_project/localhost_urls.dart';
import 'package:http/http.dart' as http;
import '/api/users.dart';
import 'login.dart';

// bool visable = false;
DropDownTypeOfUser? testing;
// bool testing.visable;
var test = testing?.test;
bool? isVisible = true;
String errorText = '';

//reg screen
class Register extends StatefulWidget {
  const Register({
    Key? key,
  }) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  // TextEditingController textTypeController = TextEditingController();
  // var focusNodeOfFullName = FocusNode();
  var msg = "";
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // focusNodeOfFullName;
      // FocusScope.of(context).requestFocus();
      // print(testing?.visable);
    });
  }

  // TypeOfUser ? typeId ;
  int typeId = 1;
  int universityId = 1;

  final Future<SharedPreferences> sp = SharedPreferences.getInstance();

  //full name box
  var fullName = "الاسم الكامل";
  var textFormFieldFontsSize = 16.0;
  var textFormFieldType = TextInputType.text;
  //phone box
  TextEditingController phoneController = TextEditingController();
  var phoneBoxName = "رقم الهاتف";
  var textFormFieldTypePhone = TextInputType.phone;
  // var focusNodeOfPhone = FocusNode();
  //password box
  TextEditingController passwordController = TextEditingController();
  var passwordLabelName = "كلمة المرور";
  // var focusNodeOfPassword = FocusNode();
  var textFormFieldTypePassword = TextInputType.visiblePassword;
  //sure password box
  TextEditingController surePasswordController = TextEditingController();
  var surePasswordLabelName = "تأكيد كلمة المرور";
  // var dropdownButtonOfViability = false;
  // var focusNodeOfSurePassword = FocusNode();
  //choose type box
  // TextEditingController typeController = TextEditingController();

  var itemsType = [
    'طالب',
    'مؤجر',
  ];
  var typeOfUser = "طالب";
  // University firstItemOfType;
  // var foucsNodeOfType = FocusNode();

  //university choose box
  /*
 this URL have universities
 https://ar.wikipedia.org/wiki/%D9%82%D8%A7%D8%A6%D9%85%D8%A9_
 %D8%A7%D9%84%D8%AC%D8%A7%D9%85%D8%B9%D8%A7%D8%AA_
 %D9%88%D8%A7%D9%84%D9%83%D9%84%D9%8A%D8%A7%D8%AA_
 %D8%A7%D9%84%D9%81%D9%84%D8%B3%D8%B7%D9%8A%D9%86%D9%8A%D8%A9
                   */
// List<Universities> universities = [];
// Universities ? currentUniversiy;
// String? nameOfUniversity = currentUniversiy?.university_name;
  var itmesOfUniversities = [
    'الجامعة الإسلامية',
    'كلية العودة الجامعية',
    'جامعة الأزهر بغزة',
    'أكاديمية الإدارة والسياسة',
    'الكلية الجامعية للعلوم التطبيقية',
    'كلية فلسطين التقنية - دير البلح',
    'جامعة غزة',
    'جامعة الأقصى',
    'بوليتكنك فلسطين',
    'جامعة القدس المفتوحة',
    'كلية دار الدعوة والعلوم الإنسانية',
    'كلية العودة الجامعية',
    'جامعة الأمة',
    'جامعة الإسراء',
    'جامعة فلسطين',
    'جامعة النجاح الوطنية',
    'جامعة بيرزيت',
    'جامعة الخليل',
    'جامعة القدس',
    'الجامعة العربية الأمريكية',
    'جامعة بيت لحم',
    'جامعة فلسطين التقنية - خضوري',
    'جامعة الاستقلال',
    'جامعة فلسطين الأهلية',
    'الكلية العصرية الجامعية',
    'كلية بيت لحم للكتاب المقدس',
    'كلية دار الكلمة الجامعية للفنون والثقافة',
    'كلية ابن سينا للعلوم الصحية',
    'كلية الطب الحكومية',
    'كلية وجدي نهاد أبو غربية الجامعية التكنولوجية',
    'كلية فلسطين التقنية - العروب',
    'الكلية الإبراهيمية بالقدس',
    'كلية شميدت في القدس',
    'جامعة الزيتونة للعلوم والتكنولوجيا',
  ];
  var firstItemOfUniversities = 'جامعة الخليل';
  // var focusNodeOfUniversities = FocusNode();
  //gender box
  List<String> itemsOfGenger = [
    'ذكر',
    'أنثى',
  ];
  String? firstItemOfGender = 'ذكر';

  // var focusNodeOfGender = FocusNode();
  // var response = getData();
  // NewSession.get<int>("1", 1) == "1" ? MainStudent:MainOwner;
  // Map<String, dynamic> typeOfUserKey = {
  //   "type": NewSession.get<int>("type", 1),
  //   "type": NewSession.get<int>("type", 2)
  // };
// var test = testing?.visable;
  late Function(TypeOfUser) inset;

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: kPrimaryColor,
      child: Scaffold(
          // primary: true,

          appBar: AppBar(
              backgroundColor: Colors.grey.shade200,
              iconTheme: const IconThemeData(color: Colors.black87)
              // actionsIconTheme: IconThemeData(color: Colors.black87),
              ),
          backgroundColor: Colors.grey.shade200,
          body: SingleChildScrollView(
              // child: GetBuilder<AuthController>(
              //   builder: (controller) {
              //     return controller.loading == true
              //         ? CircularProgressIndicator()
              //         :
              child: Column(
            children: [
              //title signup
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 20, 0),
                    child: Text(
                      "إبدأ التسجيل",
                      style: TextStyle(
                          fontSize: 28.0,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: Colors.grey.shade800),
                    ),
                  ),
                  const Expanded(child: Text("")),
                ],
              ),
              //nameApp
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 30),
                    child: Row(
                      children: [
                        Text(
                          "في",
                          style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'IBM',
                              inherit: true,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          " وين بلاقي",
                          style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'IBM',
                              inherit: true,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child: Text("")),
                ],
              ),
              // full name
              TextFieldClassWdiget(
                  fontSize: textFormFieldFontsSize,
                  // foucsNode: focusNodeOfFullName,
                  labelName: fullName,
                  autoFocus: true,
                  controller: nameController,
                  // onFieldSubmitted: () {
                  //   focusNodeOfPhone.requestFocus();
                  // },
                  textInputType: textFormFieldType),
              //hint under full name field
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 30, 10),
                    child: Text(
                      "تأكد من مطابقته للاسم الموجود في بطاقة هويتك",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontFamily: "IBM",
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Expanded(child: Text("")),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //number phone
              TextFieldClassWdiget(
                  fontSize: textFormFieldFontsSize,
                  controller: phoneController,
                  labelName: phoneBoxName,
                  textInputType: textFormFieldTypePhone),
              //hint under number phone filed
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: Text(
                      "ستصلك رسالة لتأكيد رقمك ",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                        fontFamily: 'IBM',
                      ),
                    ),
                  ),
                  const Expanded(child: Text("")),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              //password
              TextFieldOfPasswordClassWidget(
                controller: passwordController,
                inputType: textFormFieldTypePassword,
                labelInput: passwordLabelName,
                // onFieldSubmitted: () {
                //   focusNodeOfSurePassword.requestFocus();
                // },
              ),
              //sure password
              TextFieldOfPasswordClassWidget(
                // focusNode: fn,
                controller: surePasswordController,
                // focusNode: focusNodeOfPassword,

                inputType: textFormFieldTypePassword,
                labelInput: surePasswordLabelName,
                // onFieldSubmitted: () {
                //   foucsNodeOfType.requestFocus();
                // },
                // focusNode: focusNodeOfSurePassword,
              ),
              const SizedBox(
                height: 20,
              ),
              // type_text
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 30, 5),
                    child: Text(
                      "اختر النوع",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 16,
                        fontFamily: "IBM",
                      ),
                    ),
                  ),
                  const Expanded(child: Text("")),
                ],
              ),
              // type of user
              // DropdownButtonClassWidget(
              //   firstItem: firstItemOfType,
              //   items: itemsType,
              //   // controller: textTypeController,
              //   // myKey: ,
              //   // response: typeOfUserKey,
              //   // controller: ,
              //   fontSize: 14,
              //   visible: dropdownButtonOfViability,
              // ),
// DropdownButtonClassWidget(items: areas, firstItem: currentArea, fontSize: 16, name: currentArea!.name),
              DropDownTypeOfUser(
                currentType: typeOfUser,
                typeOfUserItems: itemsType,
                visible: isVisible,

                onSelected: (c) {
                  setState(() {
                    typeOfUser = c;
                    // isVisible = true;
                  });
                  setState(() {
                    c == "طالب" ? isVisible = true : isVisible = false;
                    // if(c=="طالب"){
                    //   setState(() {
                    //     isVisible = true;
                    //   }
                    //   );
                    // }else{
                    //   setState(() {
                    //     isVisible = false;
                    //
                    //   });
                    //
                    // }
                  });
                },

                // onSelected: (c){
                // typeId = c.id;
                // print("type TypeOfUser id --${c.id}");

                // },
                // test: test,
              ),
              // DropdownButtonClassWidget(items: itemsType, firstItem: firstItemOfType,, fontSize: 14, name: name)
              // Visibility(
              //   visible: _selectedItem == null,
              //   child: DropdownButton(
              //     value: _selectedItem,
              //     items: _dropdownMenuItems,
              //     onChanged: (value) {
              //       setState(() {
              //         _selectedItem = value;
              //       });
              //     },
              //   ),
              // ),x4
              Visibility(
                  visible: isVisible ?? true,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      //unvierity text
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                            child: Text(
                              "اختر جامعتك",
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 16,
                                fontFamily: 'IBM',
                              ),
                            ),
                          ),
                          const Expanded(child: Text("")),
                        ],
                      ),
                      //universeities
                      DropDownUniversity(
                        currentValue: currentUniversity,
                        items: itmesOfUniversities,
                        onSelected: (c) {
                          currentUniversity = c;
                          // universityId = c.id;
                        },
                      ),
                      //   DropdownButtonClassWidget(items: universities, firstItem: currentUniversiy, fontSize: 12, name:nameOfUniversity! ),

                      // DropdownButtonClassWidget(
                      //   firstItem: firstItemOfUniversities,
                      //   // focusNode: focusNodeOfUniversities,
                      //   items: itmesOfUniversities,
                      //   fontSize: 13,
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      //gender text
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 30, 5),
                            child: Text(
                              "الجنس",
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 16,
                                  fontFamily: 'IBM'),
                            ),
                          ),
                          const Expanded(child: Text("")),
                        ],
                      ),
                      //gender
                      DropdownButtonClassWidget(
                        items: itemsOfGenger,

                        firstItem: firstItemOfGender,
                        onSelected: (c) {
                          setState(() {
                            firstItemOfGender = c;
                          });
                        },

                        // focusNode: focusNodeOfGender,
                        fontSize: 14,
                      ),
                    ],
                  )),
              //test of privacy policy
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
                child: Text(
                  "من خلال تحديد إنشاء حساب ، فإنني أوافق على بنود الخدمة ، و أقر بسياسة الخصوصية",
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 14.5,
                      fontFamily: 'IBM'),
                ),
              ),
              // create account button
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                      onPressed: () async {
                        phoneController.text = removeZeroNumber(phoneController.text);
                        // if(){};
                        setState(() {
                          if (passwordController.text !=
                              surePasswordController.text) {
                            NormalAlert.show(
                                context,
                                "كلمة المرور غير متطابقة",
                                "برجاء إدخال كلمة مرور متطابقة في كلا الحقلين",
                                "حسنًا");
                          }
                          go(
                            nameController.text,
                            phoneController.text,
                            passwordController.text,

                            //     (c){{
                            // typeId = c.id;
                            // }
                            //     },
                            //   typeOfUserItems[3]

                            // typeId as TypeOfUser,universityId as University,

                            // firstItemOfType.name,
                            typeId,
                            universityId,

                            firstItemOfGender!,
                          );

                          // if(typeOfUserItems!=null){
                          //   print(typeOfUserItems);
                          // }
                        });
                        debugPrint("type_id --$typeId");
                      },
                      style: fullButton,
                      child: const Text("إنشاء حساب")),
                ),
              ),
            ],
          ))),
    );
    // );
  }

  go(
      String name,
      String phone,
      String password,
      // Function(TypeOfUser) insetType
      //   TypeOfUser typeOfUser
      // TypeOfUser type,
      int typeId,
      int universityId,
      String gender
      // DropDownTypeOfUser typeId
      // String value
      ) async {
    var url = Uri.parse(ServerLocalDiv.register);
    debugPrint(url.path);
    var response = await http.post(url, body: {
      "name": name, "phone": phone, "password": password,
      "type_id": typeId.toString(),
      "university_id": universityId.toString(),
      "gender": gender
// "type_id":insetType,
      // "type_id":typeOfUser.id
    });
    debugPrint(response.body);
    // print(response.body);
    var json = await jsonDecode(response.body);

    debugPrint("this is json : $json");
    var res = UserRes.fromJson(json);
    //
    // print(res.status);
    //return;
    debugPrint("this is response  : $res");
    if (res.status == false) {
      setState(() {
        msg = res.msg;
        if (msg == "The phone has already been taken.") {
          NormalAlert.show(
              context, "بيانات خاطئة", "جرب إستخدام رقم هاتف مختلف", "حسنًا");
          return;
        }
        if (msg == "The name field is required.") {
          NormalAlert.show(
              context, "حقل مطلوب", "يرجى تعبئة حقل 'الاسم الكامل'", "حسنًا");
          return;
        }
        if (msg == "The phone field is required.") {
          NormalAlert.show(
              context, "حقل مطلوب", "يرجى تعبئة حقل 'رقم الهاتف'", "حسنًا");
          return;
        }
        if (msg == "The password field is required.") {
          NormalAlert.show(
              context, "حقل مطلوب", "يرجى تعبئة حقل 'كلمة المرور'", "حسنًا");
          return;
        }
      });
      removeUserInfo();
      return;
    } else {
      setState(() {
        // toast("قم تسجيل الدخول لتتأكد من كتابة بياناتك بشكل صحيح");
      });

      // print(res.data.type.id);
      // print(res.data.type.name);
      // print(res.data?.type.updatedAt);
      //7print(res.data?.type.createdAt);

      try {
        var data = res.data;
        saveUserInfo(data);
        pushToLoginPage();
      } catch (e) {
        debugPrint("$e");
      }
    }
    // }on SocketException{
    //   print("check your internet connection");
    // }on FormatException{
    //   print("Problem retrieving data contact !");
    // print(visable);
  }

  void pushToLoginPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return const Login();
    }));
  }

// print("happend problem !");

// if(user_response.data!=null) {
//   var profile = user_response.data!.profile;
//   print(profile);
// }

// Future<List> fetchData() async {
//   var type_id = await TypeOfUser.getStringFromPref("teacher_id");
//   final data = await http
//       .post(AppUtils.teacherHomeLink, body: {"teacher_id": teacher_id});
//   var responseBody = data.body;
//   print(responseBody);
//   final parsed = json.decode(data.body).cast<Map<String, dynamic>>();
//
//   List<TeacherHomeData> parentSigninList = parsed
//       .map<TeacherHomeData>((json) => TeacherHomeData.fromJson(json))
//       .toList();
//
//   for (int i = 0; i < parentSigninList.length; i++) {
//     courseNameList.add(parentSigninList[i].course_name);
//     batchNameList.add(parentSigninList[i].batch_name);
//   }
//   return courseNameList;
// }
//
}

// getData() async {
//   var url = Uri.parse("http://127.0.0.1:8000/api/user/register");
//   var response = await http.get(url);
//   var json = jsonDecode(response.body);
//   // var userData = User.fromJson(json);
//   // var name = userData.name;
//   // var phone = userData.phone;
//   // var type = userData.type;
//   // var token = userData.token;
// }