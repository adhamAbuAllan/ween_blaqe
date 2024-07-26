import 'dart:convert';

// import 'dart:html';
// import 'dart:io';
// import 'dart:ui';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/utils/function_that_effect_widgets/hide_keyboard.dart';
import 'package:ween_blaqe/core/utils/function_that_effect_widgets/remove_plus_from_phone_number.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';

// import 'package:ween_blaqe/core/utils/styles/show_more_widget/about_apartment_style.dart';
import 'package:ween_blaqe/features/widgets_before_user_reg/registration.dart';

//
//
// //YOUR INFO
// ////////////////////////////////////////////////////////////////////////
import '../../api/users.dart';

// ////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////
// import '../../main.dart';
// ////////////////////////////////////////////////////////////////
import 'package:ween_blaqe/constants/nums.dart';
import '../../core/widgets/alirt_class_widget.dart';
import '../../core/widgets/apartments/create_apartment/container_classes_widget/input_text_class_widget/container_input_text_class_widget.dart';
import '../../core/widgets/login/password_container_class_widget.dart';
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
  String hintPhone = "أدخل رقمك بدءًا  برمز الدولة";
  bool isLoading = false;

  TextInputType phone = TextInputType.phone;
  TextInputType password = TextInputType.visiblePassword;
  String hintPassword = "كلمة المرور خاصتك";
  String passwordtext = "كلمة المرور";
  TextEditingController passwordController = TextEditingController();

  // FocusNode userPhoneFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  TextEditingController phoneController = TextEditingController();
  String msg = "";
  bool isObscure = true;

  // bool _isvisible = true;
  bool autoFocus = false;
  bool autoFocusOfPassword = false;

  // String errorText = "";
  //alert box
  var titleOfAlirt = "بيانات خاطئة";
  var messageOfAlirt = "رقم الهاتف أو كلمة المرور خاطئة";
  var textOfOkButton = "موافق";

  // late final String numberPhone;
  // @override
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
        bottomColor: Colors.transparent,
        color:
            themeMode.isDark ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
        child: Scaffold(
          backgroundColor: themeMode.isDark
              ? kBackgroundAppColorLightMode
              : kBackgroundAppColorDarkMode,
          body: SingleChildScrollView(
            child: Column(
              children: [
                //back arrow button
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: BackButton(
                        color: themeMode.isDark
                            ? kTextColorLightMode
                            : kTextColorDarkMode,
                      ),
                    ),
                    const Expanded(child: Text("")),
                  ],
                ),

                //title-nameApp
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 20, 0),
                      child: Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                            fontSize: 28.0,
                            fontFamily: 'IBM',
                            inherit: true,
                            color: themeMode.isDark
                                ? kTextColorLightMode
                                : kTextColorDarkMode),
                      ),
                    ),
                    Expanded(child: Text("")),
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
                            "في ",
                            style: TextStyle(
                                fontSize: 28,
                                fontFamily: 'IBM',
                                inherit: true,
                                fontWeight: FontWeight.bold,
                                color: themeMode.isDark
                                    ? kTextColorLightMode
                                    : kTextColorDarkMode),
                          ),
                          Text(
                            "وين بلاقي",
                            style: TextStyle(
                                fontSize: 28,
                                fontFamily: 'IBM',
                                inherit: true,
                                color: themeMode.isDark
                                    ? kPrimaryColorLightMode
                                    : kPrimaryColorDarkMode,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: Text("")),
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
                  autoFocus: autoFocusOfPassword,
                  inputType: password,

                  // isVisible: true,
                  onObscureChanged: (newValue) {
                    setState(() {
                      isObscure = newValue;
                    });
                  },
                  isObscure: isObscure,

                  hintInput: hintPassword,
                  title: passwordtext,

                  controller: passwordController,
                  // focusNode: passwordFocus,
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
                          isLoading = true;
                          // if(phoneController.text.indexOf(RegExp('0'),0) == 0){

                          phoneController.text = removePlusSymbol(phoneController.text);
                          // }
                          setState(() {
                            hideKeyboard(context);
                          });
                          if (phoneController.text.isEmpty) {
                            // autoFocus = true;
                            // errorText = "يرجى ادخال رقم الهاتف";
                            NormalAlert.show(context, "حقل فارغ",
                                "يرجى تعبئة حقل رقم الهاتف", "حسنًا");
                            return;
                          }
                          debugPrint(phoneController.text);
                          if (passwordController.text.isEmpty) {
                            NormalAlert.show(context, "حقل فارغ",
                                "يرجى تعبئة حقل كلمة المرور", "حسنًا");

                            // autoFocusOfPassword = true;
                            return;
                          }

                          setState(() {
                            msg = "Loading..";
                            setState(() {
                              // checkCurrentAuthState(context);
                              // if (isLoading) {
                              //   return;
                              // }
                              go(phoneController.text, passwordController.text);
                              // isLoading = false;
                            });

                            // passwordController.text = "";
                            // phoneController.text = "";
                          });
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
                          // isLoading = false;
                        },
                        child: isLoading == false
                            ? const Text("تسجيل الدخول")
                            : const CircularProgressIndicator(
                                color: Colors.white,
                              )),
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
                          hideKeyboard(context);

                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return const Register();
                            }),
                          );
                        },
                        style: outlineButton,
                        child: const Text("تسجيل حساب جديد")),
                  ),
                ),
                //forget password?
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                //   child: TextButton(
                //     child: const Text(
                //       "نسيت كلمة المرور؟",
                //       style: TextStyle(
                //           color: Colors.blue,
                //           fontWeight: FontWeight.bold,
                //           fontFamily: 'IBM'),
                //     ),
                //     onPressed: () {},
                //   ),
                // ),
                // const SizedBox(
                //   height: 50,
                // ),
                // TextButton(
                //     onPressed: () {
                //       myPushName(context, MyPagesRoutes.screensWillAddFuture);
                //     },
                //     child: Text(
                //       "شاشات سيتم إضافتها مستقبلاً",
                //       style: TextStyle(
                //         fontFamily: "IBM",
                //         fontSize: 14,
                //         color: Colors.grey.shade400,
                //       ),
                //     )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  go(String phone, String password) async {
    isLoading == true;
    var url = Uri.parse(ServerWeenBalaqee.userLogin);
    var response =
        await http.post(url, body: {"phone": phone, "password": password});
    debugPrint("response:$response");
    var json = jsonDecode(response.body);
    debugPrint("json --$json");
    var res = UserRes.fromJson(json);
    debugPrint("response --$res");
    if (res.status == false) {
      setState(() {
        debugPrint("stateus is false !");
        msg = res.msg;
        // toast("your not found");
        NormalAlert.show(context, titleOfAlirt, messageOfAlirt, textOfOkButton);
        autoFocus = false;
        debugPrint("response status is false ");
      });
      removeUserInfo();
      isLoading = false;
    } else {
      setState(() {
        hideKeyboard(context);
        debugPrint("status is true!:${res.data.name}");
        debugPrint("status is true!:${res.data.id}");
        // debugPrint("status is true!:${res.data.token}");
        // debugPrint("status is true!:${res.data.type}");
        // debugPrint("status is true!:${res.data.gender}");
        // debugPrint("status is true!:${res.data.university}");
        // debugPrint("status is true!:${res.data.phone}");
        // toast("yout found ");
        isLoading = false;
        msg = "";
      });
      isLoading = true;
      var data = res.data;
      if (data.token != null) {
        setState(() {
          apartmentModelController.ownerToken = data.token;
        });
        debugPrint(
            "the token is  Not null ${data.token} || ${apartmentModelController.ownerToken}");
      } else {
        debugPrint("the token is null");
      }

      saveUserInfo(data);
      pushToMainPage();
      // FocusScopeNode currentFocus = FocusScope.of(context);
      // if (!currentFocus.hasPrimaryFocus) {
      //   currentFocus.unfocus();
      // }
      // myPushName(context, MyPagesRoutes.citiesTest);
      isLoading = false;
      isLoading = false;
    }
    isLoading = false;
  }

  void alert() {
    NormalAlert.show(context, "خطأ في عملية التسجيل",
        "تأكد من كتابة رقم الهاتف و كلمة المرور بشكلٍ سليم", "حسنًا");
    isLoading = false;
  }

  Future<void> pushToMainPage() async {
    await myPushName(context, MyPagesRoutes.main);
    // await  Navigator.of(context).push(MaterialPageRoute(
    //       builder: (BuildContext context) => const HomeBeforeAddData())
    // );

    // studentController.index = 0;
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
