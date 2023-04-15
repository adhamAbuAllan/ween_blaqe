import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/registration/text_field_of_password_class_widget.dart';
import 'package:ween_blaqe/controller/auth_controller.dart';
import '../../classes_that_effect_widgets/registration/dropdown_button.dart';
import '../../classes_that_effect_widgets/registration/text_filed_class_widget.dart';
import '../../sesstion/sesstion_of_user.dart';
import '../../urls_of_project/localhost_urls.dart';
import '../user/studnet/main_student.dart';
import '/styles/button.dart';
import 'package:http/http.dart' as http;
import 'dart:ui';
import 'package:ween_blaqe/api/users.dart';

import 'login.dart';

//reg screen

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController surePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController typeController = TextEditingController();

  var focusNodeOfFullName = FocusNode();

var msg = "";
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      focusNodeOfFullName;
      FocusScope.of(context).requestFocus();
    });
  }

  List<dynamic> cities = [];
  String? cityId;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    bool isvisible = true;
    //full name box
    var full_name = "الاسم الكامل";
    var textFormFieldFontsSize = 16.0;
    var textFormFieldType = TextInputType.text;
    //phone box
    TextEditingController phoneController = TextEditingController();
    var phoneBoxName = "رقم الهاتف";
    var textFormFieldTypePhone = TextInputType.phone;
    var focusNodeOfPhone = FocusNode();
    //password box
    TextEditingController passwordController =  TextEditingController();
    var passwordLabelName = "كلمة المرور";
    var focusNodeOfPassword = FocusNode();
    var textFormFieldTypePassword = TextInputType.visiblePassword;
    //sure password box
    TextEditingController surePasswordController =  TextEditingController();

    var surePasswordLabelName = "تأكيد كلمة المرور";
    var dropdownButtonOfViability = false;
    var focusNodeOfSurePassword = FocusNode();
    //choose type box
    TextEditingController typeController =  TextEditingController();

    var itemsType = [
      'مؤجر',
      'طالب',
    ];
    var firstItemOfType = "طالب";
    var foucsNodeOfType = FocusNode();
    //university choose box
    /*
 this URL have universities
 https://ar.wikipedia.org/wiki/%D9%82%D8%A7%D8%A6%D9%85%D8%A9_
 %D8%A7%D9%84%D8%AC%D8%A7%D9%85%D8%B9%D8%A7%D8%AA_
 %D9%88%D8%A7%D9%84%D9%83%D9%84%D9%8A%D8%A7%D8%AA_
 %D8%A7%D9%84%D9%81%D9%84%D8%B3%D8%B7%D9%8A%D9%86%D9%8A%D8%A9
                   */
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
    var focusNodeOfUniversities = FocusNode();
    //gender box
    var itemsOfGenger = [
      'ذكر',
      'أنثى',
    ];
    var firstItemOfGender = 'ذكر';
    var focusNodeOfGender = FocusNode();
    var response = getData();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.grey.shade200,
            iconTheme: IconThemeData(color: Colors.black87)
            // actionsIconTheme: IconThemeData(color: Colors.black87),
            ),
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
      // child: GetBuilder<AuthController>(
        //   builder: (controller) {
        //     return controller.loading == true
        //         ? CircularProgressIndicator()
        //         :
        child:    Column(
                    children: [
                      //title signup
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 20, 0),
                            child: Text(
                              "إبدأ التسجيل في",
                              style: TextStyle(
                                  fontSize: 26.0,
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
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 20, 30),
                            child: Text(
                              "وين بلاقي",
                              style: TextStyle(
                                  fontSize: 28,
                                  fontFamily: 'IBM',
                                  inherit: true,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(child: Text("")),
                        ],
                      ),

                      // full name
                      TextFieldClassWdiget(
                          fontSize: textFormFieldFontsSize,
                          foucsNode: focusNodeOfFullName,
                          labelName: full_name,
                          controller: nameController,
                          onFieldSubmitted: () {
                            focusNodeOfPhone.requestFocus();
                          },
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
                      SizedBox(
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
                        onFieldSubmitted: () {
                          focusNodeOfSurePassword.requestFocus();
                        },
                      ),
                      //sure password
                      TextFieldOfPasswordClassWidget(
                        controller: surePasswordController,
                        inputType: textFormFieldTypePassword,
                        labelInput: surePasswordLabelName,
                        onFieldSubmitted: () {
                          foucsNodeOfType.requestFocus();
                        },
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
                      DropdownButtonClassWidget(
                        firstItem: firstItemOfType,
                        items: itemsType,
                        fontSize: 14,
                        visible: dropdownButtonOfViability,
                      ),
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
                      // ),
                      Visibility(
                          visible: dropdownButtonOfViability,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              //unvierity text
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                    child: Text(
                                      "اختر جامعتك",
                                      style: TextStyle(
                                        color: Colors.grey.shade800,
                                        fontSize: 16,
                                        fontFamily: 'IBM',
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Text("")),
                                ],
                              ),
                              //universeities
                              DropdownButtonClassWidget(
                                firstItem: firstItemOfUniversities,
                                // focusNode: focusNodeOfUniversities,
                                items: itmesOfUniversities,
                                fontSize: 13,
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(300, 0, 25, 0),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              //gender text
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 30, 5),
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
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 25),
                        child: SizedBox(
                          width: 350,
                          height: 55,
                          child: ElevatedButton(
                              onPressed: () {
                                // if(nameController.text == ){}z
                                // go("abu allan reg", "4321", "123@123",1);

                              },
                              style: fullButton,
                              child: const Text("إنشاء حساب")),
                        ),
                      ),
                    ],
                  )

        )),
    );
    // );

  }
  go(String name ,String phone, String password,int type) async{
    var url = Uri.parse(ServerLocalDiv.register);
    print(url.path);
    print(" one:${msg}");
    try{
      var response = await http
          .post(url, body: {
             "name": name,
            "phone": phone,
            "password": password,
            "type": type
      });
// if(response.body != null){
//   print("this body of response :${response.body} and not null!");
// }else {
//   print("response of body has error!");
// }
      var json = jsonDecode(response.body);
      var res = UserRes.fromJson(json);
      if (res.status == false) {
        setState(() {
          msg = res.msg;
        });
        removeUserInfo();
      } else {
        setState(() {
          msg = "";
        });
        if (res.data != null) {
          var data = res.data!;
          // saveUserInfo(data );

          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return Login();
          }));
        }
      }
      print(" two:${msg}");
    // }on SocketException{
    //   print("check your internet connection");
    // }on FormatException{
    //   print("Problem retrieving data contact !");
    }
    catch(e){
      // print("happend problem !");
    }
    print(" three:${msg}");

    // if(user_response.data!=null) {
    //   var profile = user_response.data!.profile;
    //   print(profile);
    // }
  }

}












getData() async {
  var url = Uri.parse("http://127.0.0.1:8000/api/user/register");
  var response = await http.get(url);
  var json = jsonDecode(response.body);
  // var userData = User.fromJson(json);
  // var name = userData.name;
  // var phone = userData.phone;
  // var type = userData.type;
  // var token = userData.token;

}
