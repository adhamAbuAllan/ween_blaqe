









import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AdvantagesControllerTest extends GetxController{
  List<int> getListOfAdvantages(List<bool> list) {
    List<int> listAdvantages = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i] == true) {
        listAdvantages.add(i);
      }
    }
    return listAdvantages;

  }
}