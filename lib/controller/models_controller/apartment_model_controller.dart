import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../constants/strings.dart';
import '../../main.dart';

class ApartmentModelController extends GetxController {
  OneApartment apartment = OneApartment();
  bool isApartmentNull = false;
  late String? ownerToken =
      apartmentModelController.apartment.data?[1].owner?.token;
  late dynamic apartmentId = '-1';

  var isLoading = false.obs;
  var apartments = OneApartment(data: []).obs;
  RxBool isUpdating = false.obs;
late Future<OneApartment> futureOneApartmentList;
  Future<OneApartment> fetchApartments({required bool isOwnerApartments })
  async {
    isLoading.value = true;
    if (isOwnerApartments) {
      getApartmentsByOwner().then((value) {
        if (value.data?.isEmpty ?? false) {
          isApartmentNull = true;
          update();
          return;
        } else {
          isApartmentNull = false;
          update();
        }
        apartments.value = value;
        debugPrint(" the length of data is ${apartments.value.data?.length}");
      }).catchError((e) {
        debugPrint('Error fetching apartments: $e');
      }).whenComplete(() {
        isLoading.value = false;
      });
    } else {
      final uri = Uri.parse(ServerWeenBalaqee.apartmentAll);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        // All ok
        var responseBody = response.body;
        var json = jsonDecode(responseBody);
        OneApartment apartmentsRes = OneApartment.fromJson(json);
        apartments.value = apartmentsRes;
        debugPrint("a json of apartment is: -- $json");
        // setState(() {
        //   isDataLoaded = true;
        // });
        // debugPrint("the id is : ${apartmentsRes.data?.first.ownerId}");
        debugPrint("data : ${apartmentsRes.data}");
        debugPrint("msg : ${apartmentsRes.msg}");
        debugPrint("the status is ${apartmentsRes.status}");
        isLoading.value = false;
        return apartments.value;
      } else if (apartmentModelController.apartment.msg?.isNotEmpty ?? false) {
        var errorMessage =
            ' a messsage of response of apartment is : ${response.statusCode}: ${response.body} ';
        debugPrint(errorMessage);
        return OneApartment(data: []);
      }
    }

    return OneApartment(data: []);
  }

  Future<OneApartment> getApartmentsByOwner() async {
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

      OneApartment apartmentsRes = OneApartment.fromJson(json);
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
}
