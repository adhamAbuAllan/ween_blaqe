import 'package:get/get.dart';

class StudentController extends GetxController{
  int index = 0;
  changeTo(int i){
    index = i;
    update();
  }
}