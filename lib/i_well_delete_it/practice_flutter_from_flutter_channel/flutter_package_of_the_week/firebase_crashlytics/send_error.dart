
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
class SendError{
  void SendErrorMethod(){
    FlutterError.onError = (errorDetails){
      FirebaseCrashlytics.instance;
    };
  }

}