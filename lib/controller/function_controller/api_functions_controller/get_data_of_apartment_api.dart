import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../api/apartments_api/one_apartment.dart';
import '../../../api/photos.dart';
import '../../../constants/strings.dart';
import '../../../main.dart';
import '../../models_controller/apartment_model_controller.dart';

class ApiApartmentController extends GetxController{
  ApartmentModelController apartmentModelController = Get.find();
  bool isDataLoaded = false;

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

}
