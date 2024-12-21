import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import '../../../../../api/apartments_api/apartments.dart';
import '../../../../../api/cities.dart';
import '../../../../../api/type_of_apartment.dart';
import '../../../../../constants/strings.dart';
import '../../../../../core/utils/funcations/route_pages/push_routes.dart';
import '../../../../../data_containers/add_ad_data_container.dart';
import '../../../../../main.dart';
import '../../../../get_controllers.dart';
import '../../../providers/image_provider.dart';
import '../../../statuses/apartment_state.dart';
import 'package:http/http.dart' as http;

class CreateApartmentNotifier extends StateNotifier<ApartmentState> {
  CreateApartmentNotifier() : super(ApartmentState());


  /// that when create apartment that should run 3 methods
  /// first , create a new id apartment and insert new data in apartment
  /// table.
  /// second , insert the advantages taht user slected in
  /// apartment_advantages table.
  /// third , compress and upload the images of the apartment and insert them
  /// in photos table.

  Future<DataOfOneApartment?> createApartment(
      {required int bathRooms,
      required int rooms,
      required int price,
      required City? city,
      required int squareMeters,
      required TypeOfApartment? type,
      required String title,
      required String description,
      required int countOfStudent,
      required WidgetRef ref,
      required BuildContext context
      }) async {

 state = state.copyWith(isLoading: true);

    var url = Uri.parse(ServerWeenBalaqee.apartmentAdd);
    var token = (await sp).get("token");

    if (token != null) {
      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      debugPrint("the token is : $token");

      var body = jsonEncode({
        "location": AddApartmentData.address ?? "",
        "bathrooms": "${AddApartmentData.bathRooms ?? -1}",
        "rooms": "${AddApartmentData.rooms ?? -1}",
        "price": "${AddApartmentData.price ?? -1}",
        "square_meters": "${AddApartmentData.squareMeters ?? -1}",
        "title": AddApartmentData.title ?? "",
        "description": AddApartmentData.description ?? "",
        "count_of_student": "${AddApartmentData.countOfStudent ?? -1}",
        "type_id": "${readyCityAndTypeOfApartmentApi.indexApartmentType}",
        "city_id": "${readyCityAndTypeOfApartmentApi.indexOfCity}",
      });

      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        // debugPrint("apartment basic data creating...");

        var json = await jsonDecode(response.body);
        json['data']['owner']['token'] = token;

        var apartmentId = json['data']['id'];
        AddApartmentData.apartmentId = await apartmentId;
        await ref.read(advantagesNotifer.notifier).insertAdvInApartment(
              apartmentId: await apartmentId,
              advantageIds: ref.read(advantagesNotifer).chosen,

            );
        await ref.read(imageApiNotifier.notifier).compressAndUploadImages
          (ref: ref,apartmentIdToUpdate: apartmentId,newImages: );

        state = state.copyWith(isLoading: false);

         pushToMainPage(context);

        var res = DataOfOneApartment.fromJson(json);
        ref.read(advantagesNotifer).chosen.clear();
        return res;
      } else {
        debugPrint("the statee of code is not true : ${response.statusCode}");
        debugPrint(
            "you have somehting null in this response :${response.body}");
      }
      debugPrint("the token is not null $token");
    } else {
      debugPrint("the token is null $token");
    }
    return null;
  }
  Future<void> pushToMainPage(BuildContext context) async {
    ///studentController.index = 0;
    await myPushName(context, MyPagesRoutes.main);
    // await  Navigator.of(context).push(MaterialPageRoute(
    //       builder: (BuildContext context) => const HomeBeforeAddData())
    // );

    // studentController.index = 0;
  }

}