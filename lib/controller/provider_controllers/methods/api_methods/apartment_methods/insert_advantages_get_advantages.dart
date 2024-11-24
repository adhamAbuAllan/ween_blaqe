import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../../../api/advantages.dart';
import '../../../../../constants/strings.dart';
import '../../../../../main.dart';
import '../../../statuses/advantage_state.dart';

class AdvantagesNotifier extends StateNotifier<AdvantageState> {
  AdvantagesNotifier() : super(AdvantageState());

  Future<void> insertAdvInApartment(
      {required String  apartmentId,required  List<int>  advantageIds})
  async {
    var token = (await sp).get("token"); // Replace with your token
    // fetching logic
    debugPrint("loading...");
    final String url = ServerWeenBalaqee.apartmentAdvantagesInsert;

    final Map<String, dynamic> requestBody = {
      'apartment_id': apartmentId,
      'advantages': advantageIds,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      debugPrint("inserting...");
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      debugPrint('Success: ${responseData['data']}');
    } else {
      debugPrint('Error: ${response.body}');
    }
  }

  Future<void> getAdvantagesMethod() async {
    state = state.copyWith(isDataLoading: true);

    final url = Uri.parse(ServerWeenBalaqee.advantagesAll);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = json["data"] as List;

      final advantages = data.map<Advantages>((value) {
        final isChecked = state.chosen.contains(value['id']);
        return Advantages(
          id: value['id'],
          advName: value['adv_name'],
          icon: value['icon'],
          checked: isChecked,
        );
      }).toList();

      state = state.copyWith(
        advantages: advantages,
        isDataLoading: false,
      );
    } else {
      debugPrint('Error: ${response.body}');
      state = state.copyWith(isDataLoading: false);
    }
  }
}
