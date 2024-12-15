import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/apartment_state.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';

import '../../../../../api/photos.dart';
import '../../../../../constants/strings.dart';
import '../../../../../main.dart';
import '../../../providers/image_provider.dart';

class UpdateApartmentNotifier extends StateNotifier<ApartmentState> {
  UpdateApartmentNotifier() : super(ApartmentState());

  /// update only fields of apartment table
  Future<void> updateFieldsOfApartment({required WidgetRef ref,required  int
  apartmentId,required BuildContext context}) async {

    var advantagesApiNotifier =
        ref.read(advantagesApi.notifier).state;
    var advantageChosen = ref.read(advantagesNotifer).chosen;
    var countOfRooms = ref.read(countOfRoomsController.notifier).state.text;
    var bathRooms = ref.read(countOfBathRoomsController.notifier).state.text;
    var squareMeters = ref.read(squareMetersController.notifier).state.text;
    var title = ref.read(titleController.notifier).state.text;
    var description = ref.read(descriptionController.notifier).state.text;
    var location = ref.read(addressController.notifier).state.text;
    var price = ref.read(priceController.notifier).state.text;
    var cityId = ref.read(selectedCityId);
    var typeId = ref.read(selectedTypeId);
    final token = (await sp).get("token");
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
      }),
    );
if(response.statusCode == 200 && ref.read(hasChanged)
    &&
    ref.watch(isApartmentImagesUpdated
    .notifier)
    .state == false &&  listEquals(advantagesApiNotifier,
    advantageChosen)){
  Navigator.pop(context);
}
    if (response.statusCode != 200) {

    }
  }

  /// under metohds that to upate all tables that related to apartment

  ///update only fields of apartment table
  updateApartment({
    required WidgetRef ref,
    required int apartmentId,
    List<Photos>? imagesApi,
    required BuildContext context,
  }) async {
    
    state = state.copyWith(isUpdating: true);
   await ref.read(fetchApartmentNotifier.notifier).fetchApartments
      (isOwnerApartments: true);
    var advantagesApiNotifier = ref.watch(advantagesApi.notifier).state;

    ///update fields of apartment
    if (ref.watch(hasChanged.notifier).state) {
      await updateFieldsOfApartment(ref:ref,apartmentId:  apartmentId,
          context: context);
    }

    ///update advantages
    debugPrint("chosen before update ${ref.read(advantagesNotifer).chosen}");
    if (!listEquals(
        advantagesApiNotifier, ref.read(advantagesNotifer).chosen)) {
      await ref
          .read(advantagesNotifer.notifier)
          .updateAdvantages(apartmentId: apartmentId.toString(),ref: ref,
          context: context);
    }
    debugPrint("chosen after update ${ref.read(advantagesNotifer).chosen}");

    /// update images
    if (ref.read(isApartmentImagesUpdated)) {
      await ref.read(imageApiNotifier.notifier).updateImages(
          apartmentId: apartmentId, ref: ref, imagesApi: imagesApi,context: context);
    }


    state = state.copyWith(isUpdating: false);
  }
}
