// // import 'dart:ui';

//
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/foundation.dart';
//
// class HandlingErrors{
//   void handlingErrorMethod(){
//     PlatformDispatcher.instance.onError = (error,stack){
//       FirebaseCrashlytics.instance
//           .recordError(error, stack,fatal: true);
//       return true;
//     };
//   }
// }