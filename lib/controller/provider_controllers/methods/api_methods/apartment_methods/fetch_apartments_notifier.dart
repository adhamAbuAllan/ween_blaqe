import 'dart:io';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/auth_provider.dart';

import '../../../../../api/apartments_api/apartments.dart';
import '../../../../../constants/strings.dart';
import '../../../../../main.dart';
import '../../../statuses/apartment_state.dart';
import 'package:http/http.dart' as http;

class FetchApartmentsNotifier extends StateNotifier<ApartmentState> {
  FetchApartmentsNotifier() : super(ApartmentState());

  /// a [fetchApartments] usage to fetch apartment data.
  Future<Apartments> fetchApartments({
    String? type,
    int? cityId,
    bool? isAll,
    int? latitude,
    int? longitude,
    WidgetRef? ref,
    bool? isWantToEnableLocationService,
    required bool isOwnerApartments,
  }) async {
    state = state.copyWith(isLoading: true);
    bool locationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    Position? pos = await ref?.watch(mapStateProvider).userPosition;

    String urlWithLocation = "";
    if (ref != null) {
      if (locationServiceEnabled) {
        await ref.watch(mapStateProvider.notifier).getUserLocation(
              ref: ref,
            );
        urlWithLocation = "latitude=${pos?.latitude}&"
            "longitude=${pos?.longitude}";
        debugPrint("urlWithLocation : $urlWithLocation");
      } else {
        if (isWantToEnableLocationService ?? false) {
          await ref.watch(mapStateProvider.notifier).getUserLocation(
                ref: ref,
              );
          urlWithLocation = await "latitude=${pos?.latitude}&"
              "longitude=${pos?.longitude}";
          debugPrint("urlWithLocation : ${urlWithLocation}");
        }
      }
      debugPrint("posLongitude : ${pos?.longitude}");
    }

    debugPrint(
        "locationServiceEnabled : $locationServiceEnabled$urlWithLocation");
    String urlByCity = "${ServerWeenBalaqee.apartmentAll}"
        "?city_id=$cityId";
    String urlByCityAndType =
        "${ServerWeenBalaqee.apartmentAll}?type=$type&&city_id=$cityId";
    // debugPrint("posLAT : ${pos?.latitude}");

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
          uri = await pos?.longitude != null
              ? await Uri.parse("${urlByCity}&${urlWithLocation}")
              : Uri.parse(urlByCity);
        }
      } else {
        debugPrint("cityId is $cityId");
        uri = await pos?.longitude != null
            ? await Uri.parse("${urlByCityAndType}&${urlWithLocation}")
            : Uri.parse(urlByCityAndType);
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

/// a [getApartmentsByOwner] method for owner apartments only.
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
