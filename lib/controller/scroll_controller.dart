import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerScroll extends GetxController {
  final ScrollController scrollController = ScrollController();
  void scrollTesting() {
    scrollController.offset;
  }
  double scrollOffset = 0.0;
   bool isHomeIndex = false ; // to check if the current index in navbar is
//home index or not
bool couldPop = false; // to check if the user can pop or not
}
