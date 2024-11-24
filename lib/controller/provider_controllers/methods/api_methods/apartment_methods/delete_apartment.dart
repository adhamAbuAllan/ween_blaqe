import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/controller/provider_controllers/statuses/apartment_state.dart';

import '../../../../../constants/strings.dart';
import '../../../../../main.dart';

class DeleteApartmentNotifier extends StateNotifier<ApartmentState> {
  DeleteApartmentNotifier() : super(ApartmentState());

  Future<void> deleteApartment(String apartmentId) async {
    final token = (await sp).get("token");
    final url = Uri.parse(ServerWeenBalaqee.apartmentAdvantagesDelete);

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'apartment_id': apartmentId}),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to delete apartment');
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }
  Future<void> deleteApartmentWithUpdate(int apartmentId) async {
    final token = (await sp).get("token");

    try {
      final response = await http.post(
        Uri.parse(ServerWeenBalaqee.apartmentDelete),
        body: jsonEncode({'id': apartmentId}),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Remove the apartment from the local list
        state = state.copyWith(
          apartmentsOfOwner: state.apartmentsOfOwner.copyWith(
            data: state.apartmentsOfOwner.data?.where((apartment) => apartment.id != apartmentId).toList(),
          ),
        );
      } else {
        throw Exception('Failed to delete apartment');
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }



  
}


