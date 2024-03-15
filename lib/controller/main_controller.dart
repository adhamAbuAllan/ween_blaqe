import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainController extends GetxController{
  int index = 0;
  changeTo(int i){
    index = i;
    debugPrint("$index");
    update();
  }
}