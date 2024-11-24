import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/api/advantages.dart';
// import 'package:ween_blaqe/controller/auth_provider.dart';
import 'package:http/http.dart' as http;

import '../../constants/strings.dart';
import '../../main.dart';

class AdvantagesModelController extends GetxController {
  AdvantageRes advantageRes = AdvantageRes();
  List<int> chosen = [];
   List<Advantages> advantages =[];
  bool isChecked = false;
  bool dataStatus = false;
  RxBool isDataLoading = false.obs;

  Future<void> insertAdvInApartment3(String apartmentId, List<int>
  advantageIds) async {
    var token = (await sp).get("token");

    debugPrint("loading...");
    final String url = ServerWeenBalaqee.apartmentAdvantagesInsert;

    final Map<String, dynamic> requestBody = {
      'apartment_id': apartmentId,
      'advantages': advantageIds,
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      headers: {
    'Authorization':
    'Bearer $token',
        'Content-Type': 'application/json'},
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

  Future<List<Advantages>> getAdvantagesMethod(
      ) async {
    advantages.clear();
      isDataLoading.value = true;

    var url = Uri.parse(ServerWeenBalaqee.advantagesAll);
    var res = await http.get(url);
    var json = jsonDecode(res.body);
    var data = json["data"];
      advantages.clear();

    for (var value in data) {
      bool isChecked = chosen.any((element) => element == value['id']);
      advantages.add(Advantages(
        id: value['id'],
        advName: value['adv_name'],
        icon: value['icon'],
        checked: isChecked,
      ));

      advantages.first;

    }
      isDataLoading.value = false;


    // Return both the list of advantages and the first advantage using a Record
    return advantages;}

}
