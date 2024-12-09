// import 'dart:convert';
//
// import 'package:flutter/material.dart'; import 'package:flutter/material.dart';// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// // import '../widgets/widgets_before_user_reg/login_notifier.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Session.init();
//
//   //print(Session.get("token", ""));
//
//   runApp(const App());
// }
//
// class App extends StatelessWidget {
//   const App({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter App',
//       debugShowCheckedModeBanner: false,
//       // home: Session.get("logged", "") == "" ? Login() : Main(),
//     );
//   }
// }
//
// class Main extends StatefulWidget {
//   const Main({Key? key}) : super(key: key);
//
//   @override
//   State<Main> createState() => _MainState();
// }
//
// class _MainState extends State<Main> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//               onPressed: () {
//
//                 removeUserInfoOfTeach();
//                 Navigator.of(context)
//                     .pushReplacement(MaterialPageRoute(builder: (c) {
//                   return Home();
//                 }));
//
//                 },
//               icon: Icon(Icons.logout)),
//           IconButton(
//               onPressed: () {
//                 addComment("aaaaabbbbb", 20, () {
//                   print("YES");
//                 });
//               },
//               icon: Icon(Icons.add)),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Text(Session.get("name", "")),
//             Session.get("profile", "") == ""
//                 ? SizedBox()
//                 : Image.network(
//                     Session.get("profile", ""),
//                     height: 200,
//                     width: double.infinity,
//                   )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// addComment(String comment, int post_id, VoidCallback call) async {
//   var url = Uri.parse("http://akram.cap.edu.ps/api/comment/add");
//   var response = await http.post(url,
//       body: {"comment": comment, "post_id": "$post_id"},
//       headers: {"Authorization": "Bearer " + Session.get("token", "")});
//   var json = jsonDecode(response.body);
//   var cc = CommentResponse.fromJson(json);
//   print(cc.data!.comment);
// }
//
// class CommentResponse {
//   CommentResponse({
//     required this.success,
//     required this.msg,
//     required this.data,
//   });
//
//   late final bool success;
//   late final String msg;
//   late final Comment? data;
//
//   CommentResponse.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     msg = json['msg'];
//     data = json['data'] == null ? null : Comment.fromJson(json['data']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['success'] = success;
//     _data['msg'] = msg;
//     _data['data'] = data == null ? null : data?.toJson();
//     return _data;
//   }
// }
//
// class Comment {
//   Comment({
//     required this.id,
//     required this.comment,
//     required this.postId,
//     //required this.user,
//   });
//
//   late final int id;
//   late final String comment;
//   late final String postId;
//
//   //late final User user;
//
//   Comment.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     comment = json['comment'];
//     postId = json['post_id'];
//     // user = User.fromJson(json['user']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['comment'] = comment;
//     _data['post_id'] = postId;
//     // _data['user'] = user.toJson();
//     return _data;
//   }
// }
//
// // class User {
// //   User({
// //     required this.id,
// //     required this.name,
// //     required this.profile,
// //   });
// //   late final int id;
// //   late final String name;
// //   late final String profile;
// //
// //   User.fromJson(Map<String, dynamic> json){
// //     id = json['id'];
// //     name = json['name'];
// //     profile = json['profile'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final _data = <String, dynamic>{};
// //     _data['id'] = id;
// //     _data['name'] = name;
// //     _data['profile'] = profile;
// //     return _data;
// //   }
// // }
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   String msg = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       drawer: Drawer(),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     msg = "Loading..";
//                   });
//                   go("adham", "adham");
//                   // print()
//
//                 },
//                 child: Text("Go")),
//             Text(msg)
//           ],
//         ),
//       ),
//     );
//   }
//
//
//
//
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
//       removeUserInfoOfTeach();
//     } else {
//       setState(() {
//         msg = "";
//       });
//       if (res.data != null) {
//         var data = res.data!;
//         print(data.username);
//         print(data.name);
//         print(data.token);
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
// }
//
//
//
//
//
//
//
//
//
// saveUserInfoOfTeach(User data) {
//   Session.save("logged", "OK");
//   Session.save("token", data.token);
//   Session.saveInt("id", data.id);
//   // Session.save("profile", data.profile);
//   Session.save("name", data.name);
// }
//
// removeUserInfoOfTeach() {
//   Session.remove("logged");
//   Session.remove("token");
//   Session.remove("id");
//   // Session.remove("profile");
//   Session.remove("name");
// }
//
// class Session {
//   static late SharedPreferences prefs;
//
//   static init() async {
//     prefs = await SharedPreferences.getInstance();
//   }
//
//   static void save(String key, String value) {
//     prefs.setString(key, value);
//   }
//
//   static void saveInt(String key, int value) {
//     prefs.setInt(key, value);
//   }
//
//   static String get(String key, String def) {
//     return prefs.getString(key) ?? def;
//   }
//
//   static remove(String key) {
//     prefs.remove(key);
//   }
// }
//
// class Server {
//   static String server = "http://akram.cap.edu.ps/api/";
//   static String postAll = "${server}post/all";
//   static String userLogin = "${server}user/login";
// }
// //
// class UserResponse {
//   UserResponse({
//     required this.success,
//     required this.msg,
//     required this.data,
//   });
//
//   late final bool success;
//   late final String msg;
//   late final User? data;
//
//   UserResponse.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     msg = json['msg'];
//     data = json['data'] == null ? null : User.fromJson(json['data']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['success'] = success;
//     _data['msg'] = msg;
//     _data['data'] = data == null ? null : data?.toJson();
//     return _data;
//   }
// }
//
// class User {
//   User({
//     required this.id,
//     required this.name,
//     required this.username,
//     this.phone,
//     this.email,
//     this.gender,
//     this.bdate,
//     this.address,
//     required this.profile,
//     required this.type,
//     required this.active,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.token,
//   });
//
//   late final int id;
//   late final String name;
//   late final String username;
//   late final Null phone;
//   late final Null email;
//   late final Null gender;
//   late final Null bdate;
//   late final Null address;
//   late final String profile;
//   late final String type;
//   late final int active;
//   late final String createdAt;
//   late final String updatedAt;
//   late final String token;
//
//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     username = json['username'];
//     phone = null;
//     email = null;
//     gender = null;
//     bdate = null;
//     address = null;
//     profile = json['profile'];
//     type = json['type'];
//     active = json['active'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     token = json['token'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['username'] = username;
//     _data['phone'] = phone;
//     _data['email'] = email;
//     _data['gender'] = gender;
//     _data['bdate'] = bdate;
//     _data['address'] = address;
//     _data['profile'] = profile;
//     _data['type'] = type;
//     _data['active'] = active;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     _data['token'] = token;
//     return _data;
//   }
// }
