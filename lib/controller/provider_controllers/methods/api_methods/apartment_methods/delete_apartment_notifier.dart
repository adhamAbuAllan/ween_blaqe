import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/controller/provider_controllers/statuses/apartment_state.dart';
import 'package:ween_blaqe/view/apartment/apartment_of_owner/widgets/apartment_of_owner_ui_widgets/delete_button_widget.dart';
import '../../../../../constants/strings.dart';
import '../../../../../main.dart';

class DeleteApartmentNotifier extends StateNotifier<ApartmentState> {
  DeleteApartmentNotifier() : super(ApartmentState());

  /// a [deleteApartmentWithUpdate] usage in [DeleteButtonWidget] to could 
  /// owner to delete apartment according apartment id.
  Future<void> deleteApartmentWithUpdate(
    int apartmentId,
    WidgetRef ref,
  ) async {
    final token = (await sp).get("token");

    final response = await http.post(
      Uri.parse(ServerWeenBalaqee.apartmentDelete),
      body: jsonEncode({'id': apartmentId}),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    debugPrint("response status code is ${response.statusCode}");
    if (response.statusCode == 200) {
      state = state.copyWith(
        apartmentsOfOwner: state.apartmentsOfOwner.copyWith(
          data: state.apartmentsOfOwner.data
              ?.where((apartment) => apartment.id != apartmentId)
              .toList(),
        ),
      );
    } else {
      throw Exception('Failed to delete apartment');
    }
  }
}
