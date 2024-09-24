import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/api/type_of_apartment.dart';

import '../../../api/cities.dart';

class ReadyCityAndApartmentTypeApi extends GetxController {
  RxBool isDataCityLoading = false.obs;
  RxBool isDataTypeLoading = false.obs;

  //city
  int indexOfCity = 1;
  List<City?> itemsCity = [];
  List<int> cityIds = [];

  //type
 List<TypeOfApartment?> itemsTypeOfApartment = [];
  int indexApartmentType = 1;

  //for cities
  Future<List?> getDataCityApiToEdit(
      List<dynamic> cityItems, String uri) async {
    isDataCityLoading.value = true;
    var url = Uri.parse(uri);
    var res = await http.get(url);

    if (res.statusCode == 200) {
cityIds.clear();
      var jsonData = jsonDecode(res.body);
      var getData = jsonData['data'];
      cityItems.clear();
      // items = [];
      for(var i  = 0 ; i < getData.length ; i++){
        cityIds.add(getData[i]['id']);
      }
      for (var item in getData) {
        cityItems.add(City.fromJson(item)); // Assuming City model contains 'id'
      }

      isDataCityLoading.value = false;
      return cityItems;
    } else {
      throw res.statusCode;
    }
  }
  //for type
  Future<List?>getDataTypeApiToEdit(
      List<dynamic> typeItems, String uri) async {

    isDataTypeLoading.value = true;


    var url = Uri.parse(uri);
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      var getData = jsonData['data'];
      typeItems.clear();
      // items = [];
      for (var item in getData) {
        typeItems.add(TypeOfApartment.fromJson(
            item)); // Assuming TypeOfApartment model contains 'id'
      }
      isDataCityLoading.value = false;
      return typeItems;
    } else {
      throw res.statusCode;
    }
  }

  Future<List<String?>> getDataDropDownApi(
      List<String?>? list, String oneItem, String uri) async {
    isDataCityLoading.value = true;
    list?.clear();
    var url = Uri.parse(uri);
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      var getData = jsonData['data'];
      print("the data from json is : --$getData");
      for (var item in getData) {
        list?.add(item['name']);
      }
      isDataTypeLoading.value = false;
      return list ?? [];
    } else {
      throw res.statusCode;
    }
  }

  saveData(int currentIndex, {bool isCity = true}) {
    isCity ? indexOfCity = currentIndex : indexApartmentType = currentIndex;
    update();
  }
}
