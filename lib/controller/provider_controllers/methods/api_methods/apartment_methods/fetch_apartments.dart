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

  Future<Apartments> fetchApartments(
      {String? type,
      int? cityId,
      bool? isAll,
      required bool isOwnerApartments,
      required WidgetRef ref}) async {
    state = state.copyWith(isLoading: true);

    try {
      Apartments ownApartments = Apartments();
      if (isOwnerApartments) {
        final apartmentsOfOwner = await getApartmentsByOwner();
        if (apartmentsOfOwner.data?.isEmpty ?? false) {
          state = state.copyWith(isOwnerHaveApartments: false);
        } else {
          state = state.copyWith(
            isOwnerHaveApartments: true,
            apartmentsOfOwner: apartmentsOfOwner,
          );
        }
      } else {
        final uri = Uri.parse(
          isAll ?? true
              ? "${ServerWeenBalaqee.apartmentAll}?city_id=${cityId ?? 0}"
              : "${ServerWeenBalaqee.apartmentAll}?type=$type&&city_id=${cityId ?? 0}",
        );
        final response = await http.get(uri);
        if (response.statusCode == 200) {
          var apartmentRes = Apartments.fromJson(jsonDecode(response.body));
          ownApartments = apartmentRes;
          ref.read(apartmentsListNotifier.notifier).state = ownApartments;
          state = state.copyWith(apartmentsList: ownApartments);
          return  ref.read(apartmentsListNotifier);

          debugPrint("apartments list -> $apartmentRes");
        } else {
          throw Exception('Failed to fetch apartments');
        }
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {

      state = state.copyWith(isLoading: false);
    }
    return Apartments(data: []);

  }
}

Future<Apartments> getApartmentsByOwner() async {
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
    return apartmentsRes;
  } else {
    throw Exception('Failed to fetch apartments by owner');
  }
}
