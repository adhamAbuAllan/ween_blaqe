import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/controller/provider_controllers/statuses/apartment_state.dart';

import '../../../../../constants/strings.dart';
import '../../../../../main.dart';

class RefactorApartmentNotifier extends StateNotifier<ApartmentState> {
  RefactorApartmentNotifier() : super(ApartmentState());
  Future<void> updateApartment(Map<String, dynamic> requestBody) async {
    final token = (await sp).get("token");
    final url = Uri.parse(ServerWeenBalaqee.apartmentUpdate);

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update apartment');
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }
}


