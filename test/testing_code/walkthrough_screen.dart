// // add this static variable somewhere
// // could technically be initialized during splash screen and added to a Provider or something similar after
// import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:ween_blaqe/splach_screen_ui.dart';
//
// import '../widgets/widgets_before_user_reg/get_started.dart';
// late SharedPreferences prefs ;
// // make `main` async if it is not already
// Future<void> main() async {
//   prefs = await SharedPreferences.getInstance();
//
//
// }
//
// Future<void> onSplashScreenDone() async {
//   if (prefs.getBool('isFirstTime') ?? true) {
//     // you might want to put this at the end of your walkthrough, so they don't miss it if they close the app, for example
//     await prefs.setBool('isFirstTime', false);
//     GetStarted();
//
//   } else {
//     SplashScreen();
//   }
// }
