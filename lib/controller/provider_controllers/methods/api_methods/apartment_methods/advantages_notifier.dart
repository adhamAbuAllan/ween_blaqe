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

  initChosenValues({required List<Advantages> advantages }
      ) {
    for(var advantage in advantages){
      state.chosen.add(advantage.id??0);
    }
    return state.chosen;
}
  Future<void> insertAdvInApartment(
      {required String apartmentId, required List<int> advantageIds}) async {
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


  Future<void> fetchAdvantages(List<Advantages> alreadyAdv) async {
    // Set loading state
    state = state.copyWith(isDataLoading: true);

    try {
      // Replace with your API call logic
      var url = Uri.parse(ServerWeenBalaqee.advantagesAll);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var data = json["data"];

        // Map data to Advantages objects
        List<Advantages> advantagesList = data.map<Advantages>((item) {
          bool isChecked = alreadyAdv.any((adv) => adv.id == item['id']);
          return Advantages(
            id: item['id'],
            advName: item['adv_name'],
            icon: item['icon'],
            checked: isChecked,
          );
        }).toList();

        state = state.copyWith(advantages: advantagesList, isDataLoading: false);
      } else {
        throw Exception("Failed to fetch advantages");
      }
    } catch (e) {
      state = state.copyWith(isDataLoading: false, dataStatus: false);
      debugPrint("Error fetching advantages: $e");
    }
  }

  void toggleChecked(int id) {
    // Toggle the 'checked' status of the selected advantage
    final updatedAdvantages = state.advantages.map((advantage) {
      if (advantage.id == id) {
        return advantage.copyWith(checked: !advantage.checked!);
      }
      return advantage;
    }).toList();

    state = state.copyWith(advantages: updatedAdvantages);
  }

  void chooseAdvantage(int id) {
    // Add or remove advantage ID from the chosen list
    List<int> updatedChosen = List.from(state.chosen);
    if (updatedChosen.contains(id)) {
      updatedChosen.remove(id);
    } else {
      updatedChosen.add(id);
    }

    state = state.copyWith(chosen: updatedChosen);
  }
  Future<void> deleteAdvInApartment({required String apartmentId}) async {
    var token = (await sp).get("token");

    final url = Uri.parse(ServerWeenBalaqee.apartmentAdvantagesDelete);

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
      body: jsonEncode({'apartment_id': apartmentId}),
    );
    if (response.statusCode == 200) {
      // Success
      debugPrint('Advantages deleted successfully');
    } else {
      // Error
      debugPrint('Failed to delete advantages: ${response.body}');
      // You might want to throw an exception or handle the error in a more appropriate way
    }
  }

  updateAdvantages({required String apartmentId}) async {
    state.advantages.clear();
    debugPrint("advantages after clear : ${state.advantages.length}");
    await deleteAdvInApartment(apartmentId: apartmentId);

    // in a list of [advantages]
    for (var index in state.advantages) {
      //check if a current [index] have true
      if (index.checked == true) {
        // if that is true then add it in [featureChosen] list

        state.chosen.add(index.id ?? -1);
      }
    }
    await insertAdvInApartment(
        apartmentId: apartmentId, advantageIds: state.chosen);
    // isUpdating = false;
  }
}
