import 'package:get/get.dart';
import 'package:ween_blaqe/api/advantages.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';

class AdvantagesModelController extends GetxController {
  AdvantageRes advantageRes = AdvantageRes();
  List<int> chosen = [];
  late List<Advantages> advantages = apartmentModelController.apartment.data?[getAdvantages.advantageIndex].advantages ?? [];
  bool isChecked = false;
  bool dataStatus = false;
//   callApiAndAssignData() async {
// advantages = (await getAdvantages.readApi(ServerWeenBalaqee.advantagesAll, dataStatus, ));
// update();
//     // advantages = (await getAdvantages.readApi(
//     //     ServerWeenBalaqee.advantagesAll, dataStatus, ));
//     debugPrint("data: $advantages");
//   }
}
