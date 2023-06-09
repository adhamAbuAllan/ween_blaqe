import 'dart:convert';
// import 'dart:html';
// import 'dart:io';
// import 'dart:ui';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/classes_that_effect_widgets/alirt_class_widget.dart';
import 'package:ween_blaqe/funcations/route_pages/my_pages_routes.dart';
import 'package:ween_blaqe/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/widgets/toast_widget.dart';
import '../../main.dart';
import '../user/studnet/main_student.dart';
import '/classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/container_input_text_class_widget.dart';
import 'package:ween_blaqe/styles/button.dart';

import 'package:ween_blaqe/widgets/widgets_before_user_reg/registration.dart';

import 'package:ween_blaqe/classes_that_effect_widgets/login/password_container_class_widget.dart';

//
//
// //YOUR INFO
// ////////////////////////////////////////////////////////////////////////
import '../../api/users.dart';
// ////////////////////////////////////////////////////////////////
import 'package:ween_blaqe/urls_of_project/localhost_urls.dart';
// ////////////////////////////////////////////////////////////////
// import '../../main.dart';
// ////////////////////////////////////////////////////////////////
import '../../sesstion/sesstion_of_user.dart';
// //////////////////////////////////////////////////////////////
// import 'package:ween_blaqe/sesstion/main_session.dart';
//HES INFO
///////////////////////////////////////////////////////////////
// import '../../testing_code/responses_code.dart';



//Login screen
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  String phoneText = "رقم الهاتف";
  String hintPhone = "أدخل رقمك بدءًا من الرقم 5";

  TextInputType phone = TextInputType.phone;
  TextInputType password = TextInputType.visiblePassword;
  String hintPassword = "كلمة المرور خاصتك";
  String password_text = "كلمة المرور";
  TextEditingController passwordController = TextEditingController();

  // FocusNode userPhoneFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  TextEditingController phoneController = TextEditingController();
  String msg = "";
  bool _isvisible = true;
  bool autoFocus = true;
  // String errorText = "";
  //alert box
  var titleOfAlirt = "بيانات خاطئة";
  var messageOfAlirt = "رقم الهاتف أو كلمة المرور خاطئة";
  var textOfOkButton = "موافق";

  // late final String numberPhone;
  @override
  // void initState() {
    // super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   userPhoneFocus.requestFocus();
    //   FocusScope.of(context).requestFocus();
  // //     phoneController.addListener(() {
  // //       // numberPhone = Session.get(phoneController.text, "");
  // //
  //     }
      // );
    // }
    // );
  // }

  // var loginRes = ResponseLogin();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),

      child: ColorfulSafeArea(
        color: Colors.orange,
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: SingleChildScrollView(
            child: Column(
              children: [
                //back arrow button
                //title-nameApp
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
                      child: Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                          fontSize: 28.0,
                          fontFamily: 'IBM',
                          inherit: true,
                        ),
                      ),
                    ),
                    Expanded(child: Text("")),
                  ],
                ),
                //nameApp
                Row(
                  children:  [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 20, 30),
                      child: Row(
                        children: const [
                          Text(
                            "في ",
                            style: TextStyle(
                                fontSize: 28,
                                fontFamily: 'IBM',
                                inherit: true,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "وين بلاقي",
                            style: TextStyle(
                                fontSize: 28,
                                fontFamily: 'IBM',
                                inherit: true,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Text("")),
                  ],
                ),
                //phone container
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: ContainerInputTextClassWidget(
                      title: phoneText,
                      controller: phoneController,
                      // errorText:"asdf" ,
                      hintInput: hintPhone,
                      // textInputAction: TextInputAction.next,
                      autoFocus: autoFocus,
                      // value: "123",
                      // autoFocus: autoFocus,
                      inputType: phone,
                      // focusNode: userPhoneFocus,
                      // onFieldSubmitted: (m){
                      //   FocusScope.of(context).requestFocus(passwordFocus);
                      // }
                    ),
                ),
                //password container
                PasswordContainerClassWidget(
                  inputType: password,
                  // isVisible: true,
                  isObscure: true,


                  hintInput: hintPassword,
                  title: password_text,

                  controller: passwordController,
                  focusNode: passwordFocus,
                  //   onFieldSubmitted: (value){
                  //   FocusScope.of(context).unfocus();
                  // }
                ), //buttons
                //login button
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                        style: fullButton,
                        onPressed: () {
                          if(phoneController.text.isEmpty){
                            // autoFocus = true;
                            // errorText = "يرجى ادخال رقم الهاتف";
                            NormalAlert.show(context, "حقل فارغ",
                                "يرجى تعبئة حقل رقم الهاتف",
                                "حسنًا");
                            return;
                          }
                          if(passwordController.text.isEmpty){
                            NormalAlert.show(context, "حقل فارغ",
                                "يرجى تعبئة حقل كلمة المرور",
                                "حسنًا");
                            return;
                          }

                          // setState(() {
                            // msg = "Loading..";
                            go(phoneController.text, passwordController.text);
                          // });
                          // go(NewSession.get(phoneController.text, ""),
                          //    NewSession.get( passwordController.text, ""));
                          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
                          //   return Main();
                          // }));
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(builder: (ctx){
                          //     return Main();
                          //   },settings: RouteSettings(
                          //     name:MyPagesRoutes.main
                          //   )
                          //   )
                          // );
                        },
                        child: const Text("تسجيل الدخول")),
                  ),
                ),
                //signup button
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return Register();
                            }),
                          );
                        },
                        style: outlineButton,
                        child: const Text("تسجيل حساب جديد")),
                  ),
                ),
                //forget password?
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: TextButton(

                    child: const Text("نسيت كلمة المرور؟", style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold
                        , fontFamily: 'IBM'
                    ),),
                    onPressed: () {},),
                ),
                SizedBox(height: 50,),
                TextButton(
                    onPressed: (){
                      myPushName(context, MyPagesRoutes.screensWillAddFuture);
                    }
                    ,child:Text("شاشات سيتم إضافتها مستقبلاً",style: TextStyle(
                  fontFamily: "IBM",
                  fontSize: 14,
                  color:Colors.grey.shade400,
                ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
  go(String phone, String password) async {
    var url = Uri.parse(ServerLocalDiv.userLogin);
      var response = await http
          .post(url, body: {"phone": phone, "password": password});
      print("response:$response");
      var json = jsonDecode(response.body);
      print("json --$json");
      var res = UserRes.fromJson(json);
      print("response --$res");
      if (res.status == false) {
        setState(() {
          print("stateus is false !");
          msg = res.msg;
          // toast("your not found");
NormalAlert.show(context, titleOfAlirt, messageOfAlirt, textOfOkButton);
autoFocus = true;
        });
        removeUserInfo();
      } else {
        setState(() {
print("status is true!:${res.data.name}");
print("status is true!:${res.data.id}");
print("status is true!:${res.data.token}");
print("status is true!:${res.data.type}");
print("status is true!:${res.data.gender}");
print("status is true!:${res.data.university}");
print("status is true!:${res.data.phone}");
          // toast("yout found ");
          msg = "";
        });
        if (res.data != null) {
          var data = res.data;
          saveUserInfo(data);

         myPushName(context, MyPagesRoutes.main);
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          // myPushName(context, MyPagesRoutes.citiesTest);
        }else{
          if(msg=="user not found"){
            NormalAlert.show(context, "خطأ في عملية التسجيل", "تأكد من كتابة رقم الهاتف و كلمة المرور بشكلٍ سليم", "حسنًا");
          }
          // NormalAlert.show(context, "خطأ في عملية التسجيل", "رقم الهاتف ، أو كلمة المرور خاطئة", "موافق");
        }
      }
    }
    // on SocketException {
    //   print("check your internet connection");
    // } on FormatException {
    //   print("Problem retrieving data contact !");
    // }

    // if(user_response.data!=null) {
    //   var profile = user_response.data!.profile;
    //   print(profile);
    // }
  }
 // loginProcess(String username, String password) async{
//
//   var url = Uri.parse(Server.userLogin);
//   var response = await http
//       .post(url, body: {"username": username, "password": password});
//
//   var json = jsonDecode(response.body);
//
//   var res = UserRes.fromJson(json);
//
//   if (res.status == false) {
//     setState(() {
//       msg = res.msg;
// toast("رقم الهاتف أو كلمة المرور خاظئة");
// print("your are in res.status == false code");
//
//     });
//     removeUserInfo();
//   } else {
//     setState(() {
//       msg = "";
//     });
//     if (res.data != null) {
//       var data = res.data ;
//       // saveUserInfo(data);
// print("your are in navigator code");
//       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
//         return Main();
//       }));\
//     }
//   }
//
//   // if(user_response.data!=null) {
//   //   var profile = user_response.data!.profile;
//   //   print(profile);
//   // }
// }
