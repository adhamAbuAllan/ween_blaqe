import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../constants/strings.dart';
import '../../main.dart';

class ApartmentModelController extends GetxController {
  OneApartment apartment = OneApartment();
  late String? ownerToken =
      apartmentModelController.apartment.data?[1].owner?.token;
  late dynamic apartmentId = '-1';

  var isLoading = false.obs;
  var apartments = OneApartment(data: []).obs;


  Future<void> fetchApartments() async {
    isLoading.value = true;
    getApartmentsByOwner().then((value) {
      apartments.value = value;
    }).catchError((e) {
      debugPrint('Error fetching apartments: $e');
    }).whenComplete(() {
      isLoading.value = false;
    });
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
      apartmentsRes.data?.sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!)
      );//to get the newest data
      return apartmentsRes;
    } else {
      final error = jsonDecode(response.body);
      debugPrint('Error: ${error['error']}');
      throw Exception('Failed to fetch apartments'); // Throw an exception to be caught in fetchApartments
    }
  }
}
