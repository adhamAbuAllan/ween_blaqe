import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/apartment_state.dart';

import '../../../../../constants/strings.dart';
import '../../../../../main.dart';
import '../../../providers/image_provider.dart';

class UpdateApartmentNotifier extends StateNotifier<ApartmentState> {
  UpdateApartmentNotifier() : super(ApartmentState());

  /// update only fields of apartment table
  Future<void> updateFieldsOfApartment(WidgetRef ref, int apartmentId) async {
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

      if (response.statusCode != 200) {
        throw Exception('Failed to update apartment');
      }

  }
  /// under metohds that to upate all tables that related to apartment

  ///update only fields of apartment table
  updateApartment({required WidgetRef ref, required int apartmentId}) async {
    state = state.copyWith(isUpdating: true);
 await   updateFieldsOfApartment(ref, apartmentId);

    ///update advantages
  await  ref
        .read(advantagesNotifer.notifier)
        .updateAdvantages(apartmentId: apartmentId.toString());

    /// update images
await    ref
        .read(imageApiNotifier.notifier)
        .updateImages(apartmentId: apartmentId, ref: ref);
    state = state.copyWith(isUpdating: false);

  }
}
