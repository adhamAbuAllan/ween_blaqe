import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/api/advantages.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../constants/strings.dart';

class AdvantagesModelController extends GetxController {
  AdvantageRes advantageRes = AdvantageRes();
  List<int> chosen = [];
  late List<Advantages> advantages = apartmentModelController.apartment.data?[getAdvantages.advantageIndex].advantages ?? [];
  bool isChecked = false;
  bool dataStatus = false;

  Future<void> insertAdvInApartment3(String apartmentId, List<String>
  advantageIds) async {
    debugPrint("loading...");
    final String url = ServerWeenBalaqee.apartmentAdvantagesInsert;

    final Map<String, dynamic> requestBody = {
      'apartment_id': apartmentId,
      'advantages': advantageIds,
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      debugPrint("inserting...");
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      // Handle success response
      debugPrint('Success: ${responseData['data']}');
    } else {
      // Handle error response
      debugPrint('Error: ${response.body}');
    }
  }



//   callApiAndAssignData() async {
// advantages = (await getAdvantages.readApi(ServerWeenBalaqee.advantagesAll, dataStatus, ));
// update();
//     // advantages = (await getAdvantages.readApi(
//     //     ServerWeenBalaqee.advantagesAll, dataStatus, ));
//     debugPrint("data: $advantages");
//   }
//   goInsert(int apartment_id) async {
//     var url = Uri.parse(ServerWeenBalaqee.advantagesAdd);
//
//     var response = await http.post(url, body: {
//       // "apartment_id": name,
//     });
//     var json = jsonDecode(response.body);
//     var data = json["data"] as List<dynamic>;
//     for (var value in data) {
//       advantages.add(Advantages(
//         id: value['id'],
//         advName: value['adv_name'],
//         icon: value['icon'],
//         // checkedId: value['checked_id']
//       ));
//       setState(() {
//         advantages.first;
//         // advantages = chosen;
//         // if (checked == false) {
//         //   // data[4] = 0;
//         // } else {}
//       });
//     }
//   }

}
