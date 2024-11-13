// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart'; import 'package:flutter/material.dart';// import 'package:ween_blaqe/widgets/widgets_before_user_reg/login_method.dart';
// import 'package:http/http.dart' as http;
// import '../testing_code/responses_code.dart';
//
// class ResponseLogin extends StatefulWidget {
//   const ResponseLogin({Key? key}) : super(key: key);
//
//   @override
//   State<ResponseLogin> createState() => _ResponseLoginState();
// }
//
// class _ResponseLoginState extends State<ResponseLogin> {
//   String msg = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Login();
//   }
//
//   go(String username, String password) async{
//     var url = Uri.parse(Server.userLogin);
//     var response = await http
//         .post(url, body: {"username": username, "password": password});
//
//     var json = jsonDecode(response.body);
//
//     var res = UserResponse.fromJson(json);
//
//     if (res.success == false) {
//       setState(() {
//         msg = res.msg;
//       });
//
//       removeUserInfoOfTeach();
//     } else {
//       setState(() {
//         msg = "";
//       });
//       if (res.data != null) {
//         var data = res.data!;
//
//         saveUserInfoOfTeach(data);
//
//         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
//           return Main();
//         }));
//       }
//     }
//
//     // if(user_response.data!=null) {
//     //   var profile = user_response.data!.profile;
//     //   print(profile);
//     // }
//   }
//
// }
