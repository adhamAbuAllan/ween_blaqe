import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ChangeThemeMode extends GetxController {
   bool isDark = false;
 void onChanged(bool onChange)async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark =onChange;
    prefs.setBool('isDark', onChange);
    print(onChange);
    update();
  }

/*
void saveTotal(int totalValue) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('total', totalValue);
}

 */
}