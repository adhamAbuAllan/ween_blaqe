import 'dart:convert';
// import 'dart:io';
// import 'dart:ui';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ween_blaqe/funcations/route_pages/my_pages_routes.dart';
import 'package:ween_blaqe/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/widgets/toast_widget.dart';
// import 'package:ween_blaqe/testing_code/responses_code.dart';
// import 'package:ween_blaqe/widgets/user/studnet/main_student.dart';
import '../../main.dart';
import '../user/studnet/main_student.dart';
import '/classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/container_input_text_class_widget.dart';
import 'package:ween_blaqe/styles/button.dart';
// import 'package:ween_blaqe/widgets/toast_widget.dart';
// import 'package:ween_blaqe/widgets/user/studnet/account_of_student.dart';
// import 'package:ween_blaqe/widgets/user/studnet/master_home.dart';
import 'package:ween_blaqe/widgets/widgets_before_user_reg/registration.dart';
// import 'package:ween_blaqe/styles/text_field_form_style.dart';
// import 'package:ween_blaqe/widgets/user/studnet/home.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/login/password_container_class_widget.dart';
// import 'package:ween_blaqe/controller/auth_controller.dart';
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
  // FocusNode passwordFocus = FocusNode();
  TextEditingController phoneController = TextEditingController();
  String msg = "";
  bool _isvisible = true;

  // late final String numberPhone;
  @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     userPhoneFocus.requestFocus();
  //     FocusScope.of(context).requestFocus();
  //     phoneController.addListener(() {
  //       // numberPhone = Session.get(phoneController.text, "");
  //
  //     });
  //   }
  //   );
  // }

  // var loginRes = ResponseLogin();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "تسجيل الدخول في",
                    style: TextStyle(
                      fontSize: 26.0,
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
            //phone
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: ContainerInputTextClassWidget(title: phoneText,
                  controller: phoneController,
                  hintInput: hintPhone,
                  // value: "123",

                  inputType: phone,
                  // focusNode: userPhoneFocus,
                  onFieldSubmitted: (value) {
                    // passwordFocus.requestFocus();

                  }),
            ),
            PasswordContainerClassWidget(inputType: password,
              hintInput: hintPassword,
              title: password_text,
              controller: passwordController,
              // focusNode: passwordFocus,
              //   onFieldSubmitted: (value){
              //   FocusScope.of(context).unfocus();
              //
              // }
            ), //buttons
            //login
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
              child: SizedBox(
                width: 350,
                height: 55,
                child: ElevatedButton(


                    style: fullButton,
                    onPressed: () {
                      setState(() {
                        msg = "Loading..";

                      });
                      go("123", "123@123");
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
                      //   return Main();
                      // }));
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx){
                          return Main();
                        },settings: RouteSettings(
                          name:MyPagesRoutes.main
                        )
                        )
                      );


                    },
                    child: const Text("تسجيل الدخول")),
              ),
            ),
            //signup
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 350,
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
            )
          ],
        ),
      ),
    );
  }

  go(String phone, String password) async {
    var url = Uri.parse(ServerLocalDiv.userLogin);

      // print(msg);
      var response = await http
          .post(url, body: {"phone": phone, "password": password});
      if (response.body != null) {
        toast("تمت عملية الطلب بنجاح");

      } else {
        toast("كلمة المرو أو رقم الهاتف خاطئ");

      }
      var json = jsonDecode(response.body);
      var res = UserRes.fromJson(json);
      if(res.status != false){
        toast("تمت عملية تحويل الرد");
      }else{
        toast("لم تتم عملية تحويل الرد");

      }
      if (res.status == false) {
        setState(() {
          msg = res.msg;
          toast("كلمة المرو أو رقم الهاتف خاطئ");
        });
        removeUserInfo();
      } else {
        setState(() {
          msg = "";
        });
        if (res.data != null) {
          var data = res.data!;
          saveUserInfo(data);
          toast("تم حفظ بيانات المستخدم في المنطقة المشتركة");
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
            return Main();
          }));
        }else{
          toast("لم يتم حفظ بيانات المستخدم في المنطقة المشتركة");
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
//       }));
//     }
//   }
//
//   // if(user_response.data!=null) {
//   //   var profile = user_response.data!.profile;
//   //   print(profile);
//   // }
// }
