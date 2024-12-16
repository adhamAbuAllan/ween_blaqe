import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';

import '../../../../../api/apartments_api/apartments.dart';
import '../../../../../constants/strings.dart';
import '../../../../../main.dart';
import '../../../statuses/apartment_state.dart';
import 'package:http/http.dart' as http;

class FetchApartmentsNotifier extends StateNotifier<ApartmentState> {
  FetchApartmentsNotifier() : super(ApartmentState());

  Future<Apartments> fetchApartments({
    String? type,
    int? cityId,
    bool? isAll,
    WidgetRef? ref,
    required bool isOwnerApartments,
  }) async {
    state = state.copyWith(isLoading: true);

    if (isOwnerApartments) {
      final apartmentsOfOwner = await getApartmentsByOwner(ref: ref);
      if (apartmentsOfOwner.data?.isEmpty ?? false) {
        state = state.copyWith(isOwnerHaveApartments: false);
      } else {
        state = state.copyWith(
          isOwnerHaveApartments: true,
          apartmentsOfOwner: apartmentsOfOwner,
        );
      }
    } else {
      late Uri uri;
      if (isAll ?? false) {
        if (type == null) {
          uri = Uri.parse("${ServerWeenBalaqee.apartmentAll}"
              "?city_id=$cityId"
              );
        }
      } else {
        uri = Uri.parse(
            "${ServerWeenBalaqee.apartmentAll}?type=$type&&city_id=$cityId");
      }

      debugPrint("uri is $uri");

      final response = await http.get(uri);
      debugPrint("status code is ${response.statusCode}");
      debugPrint("response body is ${response.body}");
      if (response.statusCode == 200) {
        var apartmentRes = Apartments.fromJson(jsonDecode(response.body));
        debugPrint("apartment res -> $apartmentRes");

        // Directly update the notifier without using ref.
        state = state.copyWith(apartmentsList: apartmentRes, isLoading: false);
        debugPrint("fetch data id done!");
      } else {
        state = state.copyWith(isLoading: false);

        state = state.copyWith(
          errorMessage: 'Failed to fetch apartments',
        );
      }
      state = state.copyWith(isLoading: false);
    }

    state = state.copyWith(isLoading: false);

    return Apartments(data: []);
  }
}

Future<Apartments> getApartmentsByOwner({WidgetRef? ref}) async {
  final url = Uri.parse(ServerWeenBalaqee.apartmentOwner);
  final token = (await sp).get("token");
  final ownerId = (await sp).get("id");

  final response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: jsonEncode({'owner_id': '$ownerId'}),
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    final apartmentsRes = Apartments.fromJson(json);
    apartmentsRes.data?.sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!));
    if (ref != null) {
      ref.read(isApartmentUpdatedNotifier.notifier).state = false;
    }
    return apartmentsRes;
  } else {
    throw Exception('Failed to fetch apartments by owner');
  }
}
