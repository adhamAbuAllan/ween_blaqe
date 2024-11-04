import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../api/apartments_api/one_apartment.dart';
import '../../../api/photos.dart';
import '../../../constants/strings.dart';
import '../../../main.dart';
import '../../get_controllers.dart';
import '../../models_controller/apartment_model_controller.dart';

class MethodsApiApartmentController extends GetxController{
  ApartmentModelController apartmentModelController = Get.find();
  bool isDataLoaded = false;
  final RxBool isDeleteMode = false.obs;
  final RxBool isEditMode = false.obs;
  Future<OneApartment>  getDataFromAPI({String? type, bool? isAll,String? errorMessage}) async {
    Uri uri = Uri.parse("${ServerWeenBalaqee.apartmentAll}?type=$type");
    if (isAll == true) {
      uri = Uri.parse(ServerWeenBalaqee.apartmentAll);
    }
    debugPrint("uri --$uri");
    var response = await http.get(uri);
    debugPrint("response --$response");
    debugPrint("check response state if it 200 ?");

    if (response.statusCode == 200) {
      // All ok
      debugPrint("yes the response state is 200 and OK");
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      OneApartment apartmentsRes = OneApartment.fromJson(json);
      update();
      isDataLoaded = true;
      // debugPrint("the id is : ${apartmentsRes.data?.first.ownerId}");
      // debugPrint("data : ${apartmentsRes}");
      // debugPrint("msg : ${apartmentsRes.msg}");
      // debugPrint("the status is ${apartmentsRes.status}");
      // debugPrint("the states is yes ${json} ");
      return apartmentsRes;
    } else if (apartmentModelController.apartment.msg?.isNotEmpty ?? false) {

      errorMessage = '${response.statusCode}: ${response.body}';
      debugPrint(errorMessage);
      debugPrint("return empty data []");
      return OneApartment(data: []);
    }
    debugPrint("");
    debugPrint("return apartmentModelController.apartment");
    return apartmentModelController.apartment;
  }
  callAPIandAssignData({ String ? type, required bool isAll}) async {
    // apartmentModelController.apartment = (await getDataFromAPI(type: type, isAll: isAll))!;
    debugPrint(" call api and assign data");
   apartmentModelController.apartment = (await getDataFromAPI(type: type, isAll: isAll));
  }
  callApiApartmentOfOwner()async{
    apartmentModelController.apartment = (await getApartmentsByOwner());
  }


  Future<OneApartment> getApartmentsByOwner() async {

    final url = Uri.parse(ServerWeenBalaqee.apartmentOwner);

    var token = (await sp).get("token");
    var ownerId = (await sp).get("id");

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
            // '$token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({'owner_id': '$ownerId'}),
    );
    debugPrint("the response :${response.body} your token is $token , and "
        "your ownerId is :$ownerId");

    if (response.statusCode == 200) {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);

      OneApartment apartmentsRes = OneApartment.fromJson(json);
      update();
      // Handle the apartments data

      // update();
      debugPrint("the data of apartments of owner is :${apartmentModelController.apartment}");
      return apartmentsRes;
    } else {
      final error = jsonDecode(response.body);
      debugPrint('Error: ${error['error']}');
    }
    return apartmentModelController.apartment;



  }


  Future<void> deleteApartmentWithUpdate(int apartmentId) async {
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
        apartmentModelController.apartments.update((val) {
          val?.data?.removeWhere((apartment) => apartment.id == apartmentId);
        });


        // Remove the apartment from bookmarks if it's bookmarked
        bookmarkController.bookmarks.remove(apartmentModelController.apartments
            .value.data?.indexWhere((apartment) => apartment.id == apartmentId));

        // Show success message or handle success as needed
        Get.snackbar('حذف شقة', 'تم حذف الشقة بنجاح');
      } else {
        // Handle API error
        Get.snackbar('يرجى الإنتظار', 'جاري حذف الإعلان...');
      }
    } catch (e) {
      // Handle any exceptions
      Get.snackbar('Error', 'An error occurred');
    }
  }

  void deleteBookmarkedApartment(int apartmentId) {
    apartmentModelController.apartments.update((val) {
      val?.data?.removeWhere((apartment) => apartment.id == apartmentId);
    });
    // Remove the apartment from bookmarks if it's bookmarked
    bookmarkController.bookmarks.remove(apartmentModelController.apartments
        .value.data?.indexWhere((apartment) => apartment.id == apartmentId));
  }

  void toggleDeleteMode() {
    isDeleteMode.toggle();}

  Future<List<Photos>> fetchPhotos() async {
    update();
      isDataLoaded = true;

    Uri uri = Uri.parse(ServerWeenBalaqee.apartmentAll);
    final response = await http.get(uri);
    debugPrint("check the state in fetch photos ");
    if (response.statusCode == 200) {
      debugPrint("the states is 200 in fetch Photos and All OK ");
      List jsonResponse = jsonDecode(response.body);
      // debugPrint("the states is 200 ${jsonResponse} in fetch Photos");

      return jsonResponse.map((item) => Photos.fromJson(item)).toList();
    } else {
        isDataLoaded = false;
        // debugPrint("the states is error $isDataLoaded}");
        debugPrint("Failed load data photos");
        update();
        throw Exception('Failed to load photos from API');
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
}
