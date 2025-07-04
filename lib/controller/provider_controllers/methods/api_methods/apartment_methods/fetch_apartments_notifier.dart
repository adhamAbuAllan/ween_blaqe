import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/auth_provider.dart';

import '../../../../../api/apartments_api/apartments.dart';
import '../../../../../constants/strings.dart';
import '../../../../../main.dart';
import '../../../statuses/apartment_state.dart';
import 'package:http/http.dart' as http;

class FetchApartmentsNotifier extends StateNotifier<ApartmentState> {
  FetchApartmentsNotifier() : super(ApartmentState());

  int putTypeId(String typeName) {
    switch (typeName) {
      case "عائلات":
        return 1;
      case "طلاب":
        return 2;
      case "طالبات":
        return 3;

      default:
        return 0;
    }
  }

  String formatUrl(
      {required WidgetRef ref,
      int? typeId = 0,
      int? cityId = 0,
      int? typeOfOwnerId = 0}) {
    String url = "${ServerWeenBalaqee.apartmentAll}"
        "?type_id=$typeId"
        "&city_id=$cityId"
        "&type_of_owner=$typeOfOwnerId";

    /// that the userPosition will stop currently, but in the future, will
    /// enable it.
    return url;
  }

  /// a [fetchApartments] usage to fetch apartment data.
  Future<Apartments> fetchApartments({
    String? type,
    int? cityId,
    bool? isAll,
    int? latitude,
    int? longitude,
    required WidgetRef ref,
    bool? isWantToEnableLocationService,
    required bool isOwnerApartments,
  }) async {
    // late Position? pos = null;
    int typeId = putTypeId(type ?? "");
    int typeOfOwnerId = ref.read(selectedTypeOwnerId);

    if (typeOfOwnerId != -1) {
      typeOfOwnerId = ref.watch(selectedTypeOwnerId) + 1;
    } else {
      typeOfOwnerId = 0;
    }
    state = state.copyWith(isLoading: true);
    // bool locationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // late String urlWithLocation = "";
    // if (locationServiceEnabled) {
    // pos = await ref.read(mapStateProvider).userPosition;

    // await ref.read(mapStateProvider.notifier).getUserLocation(
    //       ref: ref,
    //     );
    // urlWithLocation = "latitude=${pos?.latitude}&"
    //     "longitude=${pos?.longitude}";
    // } else {
    //   if (isWantToEnableLocationService ?? false) {
    //     await ref.read(mapStateProvider.notifier).getUserLocation(
    //           ref: ref,
    //         );
    // urlWithLocation = await "latitude=${pos?.latitude}&"
    //     "longitude=${pos?.longitude}";
    // }
    // }

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
      Uri uri = Uri.parse(formatUrl(
          typeId: typeId,
          typeOfOwnerId: typeOfOwnerId,
          cityId: cityId,
          ref: ref));

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
  var token = (await sp).get(PrefKeys.token);
  final ownerId = (await sp).get("id");
  int? ownerIdProvider = ref?.watch(ownerIdNotifier.notifier).state;
  if (ref?.read(isShowOwnerApartmentMode.notifier).state ?? false == true) {
    if (token == null) {
      token = "1762|CiaT9P4nugBKqDBchvbUhGYTIk8aubFfpC47vQB8c585f0c6";
    }
  }

  final response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: ref?.watch(ownerIdNotifier.notifier).state != 0
        ? jsonEncode({'owner_id': '$ownerIdProvider'})
        : jsonEncode({'owner_id': '$ownerId'}),
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
    debugPrint("error is ${response.body}");
    debugPrint("owner id notifier is ${ref?.watch(ownerIdNotifier)}");
    throw Exception('Failed to fetch apartments by owner');
  }
}
