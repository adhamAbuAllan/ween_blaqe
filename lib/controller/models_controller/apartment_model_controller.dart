import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../api/apartments_api/apartments.dart';
import '../../constants/localization.dart';
import '../../constants/strings.dart';
import '../../main.dart';
import '../get_controllers.dart';

class ApartmentModelController extends GetxController{

  Apartments apartmentsList = Apartments();
  var apartmentsOfOwner = Apartments(data: []).obs;
  late dynamic apartmentId = '-1';
  late String? ownerToken = apartmentModelController.apartmentsList.data?[1].owner?.token;
  RxString apartmentType = 'طلاب'.obs; //first type
  RxString errorMessage = ''.obs; // message of error server

  RxInt apartmentLengthOfOwner = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isUpdating = false.obs;
  final RxBool isDeleteMode = false.obs;
  final RxBool isEditMode = false.obs;
  final RxBool isOwnerHaveApartments = false.obs;
  RxBool isVisible = false.obs;//[isVisible] usage to hide or show button and a list of types when user scroll or tab on scree
  RxBool isSebhaVisible =
  false.obs; //[isSebhaVisible] usage to hide or show button of Sebha.
  //those values : [isBoyStudent] , [isGirlStudent] , [isFamilies] , [isAll]
  // usage to make point on the type of apartment when user chose one of them .
  RxBool isGirlStudent = false.obs; //for boy students
  RxBool isBoyStudent = false.obs; //for girl students
  RxBool isFamilies = false.obs; //for families
  RxBool isAllTypesOfApartment = false.obs; // for all types
  // [isListOfTypes] values usages to show all types of apartments
  RxBool isListOfTypes = false.obs; //the types on the list


  Future<Apartments> fetchApartments({
    String? type,
    int? cityId,
    bool ? isAll,
    required bool isOwnerApartments,
  }) async {
    isLoading.value = true;

    if (isOwnerApartments) {
      getApartmentsByOwner().then((value) async {
        if (value.data?.isEmpty ?? false) {
          isOwnerApartments = true;
          apartmentsOfOwner.value = value;
          update();
          return;
        } else {
          isOwnerHaveApartments.value = false;
          update();
        }

        apartmentsOfOwner.value = value;
        debugPrint(" the length of data is ${  apartmentsOfOwner.value.data?.length}");
      }).catchError((e) {
        debugPrint('Error fetching apartments: $e');
      }).whenComplete(() {
        isLoading.value = false;
      });
    } else {
      // final uri = Uri.parse(ServerWeenBalaqee.apartmentAll);
      late Uri uri;
      if (isAll ?? true) {
        uri =
            Uri.parse("${ServerWeenBalaqee.apartmentAll}?city_id=${cityId ?? 0}");
      } else {
        uri = Uri.parse(
            "${ServerWeenBalaqee.apartmentAll}?type=$type&&city_id=${cityId ??
                0}");
      }
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        // All ok
        connectivityController.isResponseIsOk.value = true;

        var responseBody = response.body;
        var json = jsonDecode(responseBody);
        Apartments apartmentsRes = Apartments.fromJson(json);
        apartmentsList= apartmentsRes;
        debugPrint("a json of apartment is: -- $json");
        // setState(() {
        //   isDataLoaded = true;
        // });
        // debugPrint("the id is : ${apartmentsRes.data?.first.ownerId}");
        debugPrint("data : ${apartmentsRes.data}");
        debugPrint("msg : ${apartmentsRes.msg}");
        debugPrint("the status is ${apartmentsRes.status}");
        isLoading.value = false;
        connectivityController.isInitState.value = true;
        return apartmentsList;
      } else if (apartmentModelController.apartmentsList.msg?.isNotEmpty ?? false) {
        var errorMessage =
            ' a messsage of response of apartment is : ${response.statusCode}: ${response.body} ';
        debugPrint(errorMessage);
        return Apartments(data: []);
      }
    }

    return Apartments(data: []);
  }

  Future<Apartments> getApartmentsByOwner() async {
    final url = Uri.parse(ServerWeenBalaqee.apartmentOwner);

    var token = (await sp).get("token");
    var ownerId = (await sp).get("id");

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
      var responseBody = response.body;
      var json = jsonDecode(responseBody);

      Apartments apartmentsRes = Apartments.fromJson(json);
      apartmentsRes.data?.sort((a, b) =>
          b.updatedAt!.compareTo(a.updatedAt!)); //to get the newest data
      return apartmentsRes;
    } else {
      final error = jsonDecode(response.body);
      debugPrint('Error: ${error['error']}');
      throw Exception(
          'Failed to fetch apartments'); // Throw an exception to be caught in fetchApartments
    }
  }

  Future<void> deleteAdvInApartment(String apartmentId) async {
    var token = (await sp).get("token");

    final url = Uri.parse(ServerWeenBalaqee.apartmentAdvantagesDelete);


    final response = await http.post(
      url,
      headers: {
        'Authorization':
        'Bearer $token',
        'Content-Type': 'application/json'},
      body: jsonEncode({'apartment_id': apartmentId}),
    );if (response.statusCode == 200) {
      // Success
      debugPrint('Advantages deleted successfully');
    } else {
      // Error
      debugPrint('Failed to delete advantages: ${response.body}');
      // You might want to throw an exception or handle the error in a more appropriate way
    }
  }

  Future<void> updateApartment(
      String id,
      String? rooms,
      String? bathrooms,
      String? squareMeters,
      String? title,
      String? description,
      String? location,
      String? price,
      int ?cityId,
      int ?typeId ) async {
    var token = (await sp).get("token");

    final url = Uri.parse(ServerWeenBalaqee.apartmentUpdate); // Replace with your
    // base
    // URL

    final Map<String, dynamic> requestBody = {
      'id': id,
      if (rooms != null) 'rooms': rooms,
      if (bathrooms != null) 'bathrooms': bathrooms,
      if (squareMeters != null) 'square_meters': squareMeters,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (location != null) 'location': location,
      if (price != null) 'price': price,
      if (cityId != null) 'city_id': cityId,
      if (typeId != null) 'type_id': typeId,

    };

    final response = await http.post(
      url,headers: { 'Authorization':
    'Bearer $token','Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      // Success
      debugPrint('Apartment updated successfully');
    } else {
      // Error
      debugPrint('Failed to update apartment: ${response.body}');
      // You might want to throw an exception or handle the error in a more appropriate way
    }
  }

  Future<void> deleteApartmentWithUpdate(int apartmentId,BuildContext context)
  async {
    var token = (await sp).get("token");
    try {
      // Call your API to delete the apartment
      final response = await http.post(
        Uri.parse(ServerWeenBalaqee.apartmentDelete), // Replace with your actual API endpoint
        body: jsonEncode({'id': apartmentId}),
        headers: {
          'Authorization': 'Bearer $token',
          // '$token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Remove the apartment from the local list
        apartmentModelController.apartmentsOfOwner.update((val) {
          val?.data?.removeWhere((apartment) => apartment.id == apartmentId);
        });


        // Remove the apartment from bookmarks if it's bookmarked
        bookmarkController.bookmarks.remove(apartmentModelController.apartmentsOfOwner
            .value.data?.indexWhere((apartment) => apartment.id == apartmentId));

        // Show success message or handle success as needed
        Get.snackbar(SetLocalization.of(context)!.getTranslateValue("deleteApartment"), SetLocalization.of(context)!.getTranslateValue("apartmentDeletedSuccess"));
      } else {
        // Handle API error
        Get.snackbar(SetLocalization.of(context)!.getTranslateValue("pleaseWait"), SetLocalization.of(context)!.getTranslateValue("deletingAd"));
      }
    } catch (e) {
      // Handle any exceptions
      Get.snackbar('Error', 'An error occurred');
    }
  }

}
