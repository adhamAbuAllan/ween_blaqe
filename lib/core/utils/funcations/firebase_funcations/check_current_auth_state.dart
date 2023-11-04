import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';

void checkCurrentAuthState(BuildContext context){
  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
showSnakBar(context, "تم تسجيل الخروج بنجاح") ;   } else {
      showSnakBar(context,'تم تسجيل الدخول بنجاح');
    }
  });
}