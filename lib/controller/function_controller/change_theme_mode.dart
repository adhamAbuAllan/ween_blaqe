import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../../main.dart';
// import 'package:shared_preferences/shared_preferences.dart';
class ChangeThemeMode extends GetxController {
   bool isDark = false;
 void onChanged(bool onChange )async{
   // SharedPreferences prefs = await SharedPreferences.getInstance();
   debugPrint("the isDark value before change value is ${isDark} -> in onChange method");

   isDark =onChange;
    // sp.setBool('isDark', isDark);
   // prefs = await SharedPreferences.getInstance();

   // prefs.setBool('isDark', onChange);
   save(isDark);

   print(onChange);
    update();
  }
   void save(bool value) async {
     debugPrint("the isDark value before save it value is ${isDark} -> in save method");
     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setBool('isDark', value);
     debugPrint("the isDark value after save it value is ${isDark} -> in save method");

   }
   void loadValue() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
       debugPrint("the isDark value before load it value is ${isDark} -> in loadValue method");
       isDark = prefs.getBool('isDark') ?? false;
       debugPrint("the isDark value after load it value is ${isDark} -> in loadValue method");
       update();

   }


/*
void saveTotal(int totalValue) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('total', totalValue);
}

 */
}
