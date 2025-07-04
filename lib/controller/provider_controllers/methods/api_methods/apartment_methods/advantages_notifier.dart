import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/view/apartment/apartment_of_owner/update_apartment_ui.dart';

import '../../../../../api/advantages.dart';
import '../../../../../constants/strings.dart';
import '../../../../../main.dart';
import '../../../providers/apartment_provider.dart';
import '../../../providers/image_provider.dart';
import '../../../statuses/advantage_state.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/create_apartment/second_step_ui.dart';


class AdvantagesNotifier extends StateNotifier<AdvantageState> {
  AdvantagesNotifier() : super(AdvantageState());
/// the [initChosenValues] method 
  initChosenValues({required List<Advantages> advantages}) {
    for (var advantage in advantages) {
      state.chosen.add(advantage.id ?? 0);
    }
    return state.chosen;
  }
/// a [insertAdvInApartment]
  Future<void> insertAdvInApartment(
      {required String apartmentId,
      required List<int> advantageIds,
      required WidgetRef ref,
      required BuildContext context}) async {
    /// a [advantagesApiNotifier] is the current advantages of apartment. 'if
    /// -exists'.
    var advantagesApiNotifier = ref.read(advantagesApi.notifier).state;
    /// a [advantageChosen] is an advantages that user chosen. a new advantages.
    var advantageChosen = ref.read(advantagesNotifier).chosen;
    var token = (await sp).get(PrefKeys.token);
    debugPrint("loading...");
    final String url = ServerWeenBalaqee.apartmentAdvantagesInsert;
/// two important thing to insert advantages in any apartment first 'id of
    /// apartment' second 'id of advantages'.
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
    /// here usages to check if user make any changes to notiy him in the UI 
    /// that has been make changes.
    if (response.statusCode == 200) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        ref.read(isApartmentUpdatedNotifier.notifier).state = true;
      });
      ref.read(badResponse.notifier).state = false;
      debugPrint("inserting...");
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (!ref.read(hasChanged) &&
          ref.watch(isApartmentImagesUpdated.notifier).state == false &&
          !listEquals(advantagesApiNotifier, advantageChosen)) {
        Navigator.pop(context);
      }

      debugPrint('Success: ${responseData['data']}');
    } else {
      ref.read(badResponse.notifier).state = true;
      debugPrint('Error: ${response.body}');
    }
  }
/// [fetchAdvantages] that to get advantages ,and set isChecked 'if-exists'
  /// that have tow parameters, [alreadyAdv] for [UpdateApartmentUi] screen
  /// and the [chosen] for [SecondStepUi] screen
  Future<void> fetchAdvantages(
      {List<Advantages>? alreadyAdv, List<int>? chosen}) async {
    // Set loading state
    late bool? isChecked;
    state = state.copyWith(isDataLoading: true);
    var url = Uri.parse(ServerWeenBalaqee.advantagesAll);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var data = json["data"];

      List<Advantages> advantagesList = data.map<Advantages>((item) {
        if (alreadyAdv?.isNotEmpty ?? false) {
          isChecked = alreadyAdv?.any((adv) => adv.id == item['id']);
        } else {
          isChecked = false;
        }
        if (chosen?.isNotEmpty ?? false) {
          for (int chose in chosen!) {
            if (chose == item['id']) {
              isChecked = true;
            }
          }
        }

        return Advantages(
          id: item['id'],
          advName: item['adv_name'],
          icon: item['icon'],
          checked: isChecked ?? false,
        );
      }).toList();

      state = state.copyWith(
          advantages: advantagesList,
          isDataLoading: false,
          chosen: alreadyAdv?.isNotEmpty ?? false
              ? alreadyAdv?.map((adv) => adv.id ?? 0).toList()
              : chosen);
    } else {
      throw Exception("Failed to fetch advantages");
    }

    state = state.copyWith(isDataLoading: false, dataStatus: false);
  }
/// a [toggleChecked] method that usage when user want to add or remove feacher
/// and then saved it in advantages state.
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
    /// Add or remove advantage ID from the chosen list
    List<int> updatedChosen = List.from(state.chosen);
    if (updatedChosen.contains(id)) {
      updatedChosen.remove(id);
    } else {
      updatedChosen.add(id);
    }

    state = state.copyWith(chosen: updatedChosen);
  }
/// a [deleteAdvInApartment] take a an apartment id that will updated it then
  /// remove all advantages that already saved it in database.
  Future<void> deleteAdvInApartment(
      {required String apartmentId, required WidgetRef ref}) async {
    var token = (await sp).get(PrefKeys.token);

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
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        ref.read(isApartmentUpdatedNotifier.notifier).state = true;
      });
      // Success
      ref.read(badResponse.notifier).state = false;
      debugPrint('Advantages deleted successfully');
    } else {
      ref.read(badResponse.notifier).state = true;
      // Error
      debugPrint('Failed to delete advantages: ${response.body}');
      // You might want to throw an exception or handle the error in a more appropriate way
    }
  }
/// when update advantages of apartment that two methods work ,first
  /// [deleteAdvInApartment] method and second [insertAdvInApartment].
  updateAdvantages(
      {required String apartmentId,
      required BuildContext context,
      required WidgetRef ref}) async {
    // state.advantages.clear();
    state.chosen.clear();
    debugPrint("advantages after clear : ${state.advantages.length}");
    await deleteAdvInApartment(apartmentId: apartmentId, ref: ref);

    // in a list of [advantages]
    for (var index in state.advantages) {
      //check if a current [index] have true
      if (index.checked == true) {
        // if that is true then add it in [featureChosen] list

        state.chosen.add(index.id ?? -1);
      }
    }
    await insertAdvInApartment(
        apartmentId: apartmentId,
        advantageIds: state.chosen,
        context: context,
        ref: ref);
    // isUpdating = false;
  }
}
