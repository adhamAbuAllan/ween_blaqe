import 'dart:convert';

import 'package:file_selector/file_selector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/snack_bar_provider.dart';
import '../../../../../api/apartments_api/apartments.dart';
import '../../../../../constants/strings.dart';
import '../../../../../core/utils/funcations/route_pages/push_routes.dart';
import '../../../../../main.dart';
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

  Future<DataOfOneApartment?> createApartment({
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    List<XFile> newImages = [];

    state = state.copyWith(isLoading: true);

    var url = Uri.parse(ServerWeenBalaqee.apartmentAdd);
    var token = (await sp).get("token");

    if (token != null) {
      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      debugPrint("the token is : $token");
      debugPrint("type_id is : ${ref.read(typesNotifier).selectedType?.id}");
      debugPrint("city_id is : ${ref.read(cityNotifier).selectedCity?.id}");
      var body = jsonEncode({
        "location": ref.read(addressController.notifier).state.text.trim(),
        "title": ref.read(titleController.notifier).state.text.trim(),
        "description": ref.read(descriptionController.notifier).state.text,
        "bathrooms": ref
            .read(countOfBathRoomsController.notifier)
            .state
            .text
            .replaceAll(RegExp(r'[^0-9]'), ''),
        "rooms": ref
            .read(countOfRoomsController.notifier)
            .state
            .text
            .replaceAll(RegExp(r'[^0-9]'), ''),
        "price": ref
            .read(priceController.notifier)
            .state
            .text
            .replaceAll(RegExp(r'[^0-9]'), ''),
        "square_meters": ref
            .read(squareMetersController.notifier)
            .state
            .text
            .replaceAll(RegExp(r'[^0-9]'), ''),
        "count_of_student": ref
            .read(countOfStudentController.notifier)
            .state
            .text
            .replaceAll(RegExp(r'[^0-9]'), ''),
        "type_id": ref.read(typesNotifier).selectedType?.id.toString() ?? 1,
        "city_id": ref.read(cityNotifier).selectedCity?.id.toString() ?? 1,
      });

      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        ref.read(imagesFileList.notifier).state.where((image) {
          return true;
        }).forEach((image) {
          newImages.add(image);
        });
        // debugPrint("apartment basic data creating...");

        var json = await jsonDecode(response.body);
        json['data']['owner']['token'] = token;
        var apartmentId = json['data']['id'];
        debugPrint("apartmentId ->> $apartmentId");

        await ref.read(advantagesNotifer.notifier).insertAdvInApartment(
            apartmentId: apartmentId.toString(),
            advantageIds: ref.read(advantagesNotifer).chosen,
            ref: ref,
            context: context);
        debugPrint("new Images are : $newImages");
        await ref.read(imageApiNotifier.notifier).compressAndUploadImages(
            ref: ref,
            apartmentIdToUpdate: apartmentId,
            newImages: newImages,
            context: context);

        state = state.copyWith(isLoading: false);
        if (ref.read(badResponse) == false) {
          pushToMainPage(context);
        }

        var res = DataOfOneApartment.fromJson(json);
        ref.read(advantagesNotifer).chosen.clear();
        return res;
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (ref.read(addressController.notifier).state.text.isNotEmpty) {
            ref.read(addressController.notifier).state.clear();
          }
          if (ref.read(titleController.notifier).state.text.isNotEmpty) {
            ref.read(titleController.notifier).state.clear();
          }
          if (ref.read(descriptionController.notifier).state.text.isNotEmpty) {
            ref.read(descriptionController.notifier).state.clear();
          }
          if (ref
              .read(countOfBathRoomsController.notifier)
              .state
              .text
              .isNotEmpty) {
            ref.read(countOfBathRoomsController.notifier).state.clear();
          }
          if (ref.read(countOfRoomsController.notifier).state.text.isNotEmpty) {
            ref.read(countOfRoomsController.notifier).state.clear();
          }
          if (ref.read(priceController.notifier).state.text.isNotEmpty) {
            ref.read(priceController.notifier).state.clear();
          }
          if (ref.read(squareMetersController.notifier).state.text.isNotEmpty) {
            ref.read(squareMetersController.notifier).state.clear();
          }
          if (ref.read(countOfStudentController.notifier).state.text.isNotEmpty) {
            ref.read(countOfStudentController.notifier).state.clear();
          }

        });


        ref.read(showSnackBarNotifier.notifier).showNormalSnackBar(
            context: context,
            message: SetLocalization.of(context)
                ?.getTranslateValue("error_has_been_while_creating_apartment"));
        state = state.copyWith(isLoading: false);
        ref.read(badResponse.notifier).state = true;

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
