import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/status_of_apartment/apartment_state.dart';

import '../../../../../api/photos.dart';
import '../../../../../constants/strings.dart';
import '../../../../../main.dart';
import '../../../providers/image_provider.dart';
import '../../../../../api/apartments_api/apartments.dart';

class UpdateApartmentNotifier extends StateNotifier<ApartmentState> {
  UpdateApartmentNotifier() : super(ApartmentState());

  /// update only fields of apartment table
  Future<void> updateFieldsOfApartment(
      {required WidgetRef ref,
      required int apartmentId,
      required BuildContext context,
      required DataOfOneApartment originalApartment}) async {
    var advantagesApiNotifier = ref.read(advantagesApi.notifier).state;
    var advantageChosen = ref.read(advantagesNotifier).chosen;
    var countOfRooms = ref.read(countOfRoomsController.notifier).state.text;
    var bathRooms = ref.read(countOfBathRoomsController.notifier).state.text;
    var squareMeters = ref.read(squareMetersController.notifier).state.text;
    var title = ref.read(titleController.notifier).state.text;
    var description = ref.read(descriptionController.notifier).state.text;
    var location = ref.read(addressController.notifier).state.text;
    var price = ref.read(priceController.notifier).state.text;
    var cityId = ref.read(selectedCityId);
    var typeId = ref.read(selectedTypeId);

    var selectedLocation = ref.read(selectedLocationProvider);
    var latitude = selectedLocation?.latitude;
    var longitude = selectedLocation?.longitude;
    var isLocationChanged = false;
    if (selectedLocation != null) {
      isLocationChanged = selectedLocation.latitude != originalApartment.latitude?.toDouble() ||
          selectedLocation.longitude != originalApartment.longitude?.toDouble();
    }

    final token = (await sp).get(PrefKeys.token);
    final url = Uri.parse(ServerWeenBalaqee.apartmentUpdate);

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'id': apartmentId,
        if (countOfRooms.isNotEmpty)
          'rooms'
              '': countOfRooms,
        if (bathRooms.isNotEmpty)
          'bat'
              'hrooms': bathRooms,
        if (squareMeters.isNotEmpty) 'square_meters': squareMeters,
        if (title.isNotEmpty) 'title': title,
        if (description.isNotEmpty) 'description': description,
        if (location.isNotEmpty) 'location': location,
        if (price.isNotEmpty) 'price': price,
        if (cityId.toString().isNotEmpty) 'city_id': cityId,
        if (typeId.toString().isNotEmpty) 'type_id': typeId,
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
      }),
    );
    if (response.statusCode == 200 &&
        (ref.read(hasChanged) || isLocationChanged) &&
        ref.watch(isApartmentImagesUpdated.notifier).state == false &&
        listEquals(advantagesApiNotifier, advantageChosen)) {
      // Delay showing the button by 2 seconds
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        ref.read(isApartmentUpdatedNotifier.notifier).state = true;
      });

      ref.read(badResponse.notifier).state = false;
      Navigator.pop(context);
    }
    if (response.statusCode != 200) {
      ref.read(badResponse.notifier).state = true;
    }
  }

  /// Update only the current number of students (student_count_have)
  Future<void> updateStudentCountHave({
    required WidgetRef ref,
    required int apartmentId,
    required int studentCountHave,
  }) async {
    final token = (await sp).get(PrefKeys.token);
    final url = Uri.parse(ServerWeenBalaqee.apartmentUpdate);

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'id': apartmentId,
        'student_count_have': studentCountHave,
      }),
    );

    if (response.statusCode == 200) {
      // mark as updated and clear bad response
      ref.read(isApartmentUpdatedNotifier.notifier).state = true;
      ref.read(badResponse.notifier).state = false;
      //  refresh owner's apartments so UI reflects change
      await ref.read(fetchApartmentNotifier.notifier).fetchApartments(
            isOwnerApartments: true,
            ref: ref,
          );
    
    } else {
      //ref.read(badResponse.notifier).state = true;
    }
  }

  /// under metohds that to upate all tables that related to apartment

  ///update only fields of apartment table
  updateApartment({
    required WidgetRef ref,
    required int apartmentId,
    required List<Photos> imagesApi,
    required BuildContext context,
    required DataOfOneApartment originalApartment,
  }) async {
    state = state.copyWith(isUpdating: true);
    var advantagesApiNotifier = ref.watch(advantagesApi.notifier).state;

    var selectedLocation = ref.read(selectedLocationProvider);
    var isLocationChanged = false;
    if (selectedLocation != null) {
      isLocationChanged = selectedLocation.latitude != originalApartment.latitude?.toDouble() ||
          selectedLocation.longitude != originalApartment.longitude?.toDouble();
    }

    ///update fields of apartment
    if (ref.watch(hasChanged.notifier).state || isLocationChanged) {
      debugPrint("fields updating...");
      await updateFieldsOfApartment(
          ref: ref,
          apartmentId: apartmentId,
          context: context,
          originalApartment: originalApartment);
    }

    ///update advantages
    if (!listEquals(
        advantagesApiNotifier, ref.read(advantagesNotifier).chosen)) {
      debugPrint("advantages updating...");
      await ref.read(advantagesNotifier.notifier).updateAdvantages(
          apartmentId: apartmentId.toString(), ref: ref, context: context);
    }

    /// update images
    if (ref.read(isApartmentImagesUpdated)) {
      debugPrint("images updating...");
      await ref.read(imageApiNotifier.notifier).updateImages(
          apartmentId: apartmentId,
          ref: ref,
          imagesApi: imagesApi,
          context: context);
    }

    debugPrint(
        "is apartment updated -- ${ref.read(isApartmentUpdatedNotifier.notifier).state}");
    ref.read(fetchApartmentNotifier.notifier).fetchApartments(
          isOwnerApartments: true,
          ref: ref,
        );
    state = state.copyWith(isUpdating: false);
  }
}
