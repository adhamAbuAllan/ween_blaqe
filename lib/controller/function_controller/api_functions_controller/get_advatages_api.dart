import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:ween_blaqe/api/advantages.dart';
import 'package:http/http.dart' as http;
// import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';

// import '../../get_controllers.dart';

class GetAdvantages extends GetxController {

  int advantageIndex = 0;

  // bool isCheck = false;
  /*
    Future<List<String>?> getDataCityApi(List<String>list,
String oneItem,String uri) async {
    list.clear() ;
    var url = Uri.parse(uri);
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      var getData = jsonData['data'];
      print("the data from json is : --$getData");
      for (var item in getData) {
        list.add(item['name']);
      }
      oneItem = list.first;
      return list ;
    } else {
      throw res.statusCode;
    }
  }
   */
  Future<(List<String>, List<String>,List<int>)> readApi(
    List<String> advName,
    List<String> icon,
    List<int>id,
    String url,
    // bool dataStatus,
  ) async {
    advName.clear();
    icon.clear();
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode == 200) {

      var json = jsonDecode(response.body);
      var getData = json['data'];
      debugPrint("the data from json is : --$getData");
      for (var item in getData) {
        advName.add(item['adv_name']) ;
        icon.add(item['icon']);
        id.add(item['id']);
        // print("item number 11 is --${item[10]}");
      }
      return (advName,icon,id);
    } else {
      throw response.statusCode;
    }

    // List<Advantages>? advantages = List<Advantages>.from(json.map((x  ) => Advantages.fromJson(x)));
    // DataOfOneApartment advantageRes = DataOfOneApartment.fromJson(json);
    // List<Advantages>.from(json.map((x) => Advantages.fromJson(x)));
    // applicationController.dataStatus = true;
    // update();
    // return advantages ?? [];
  }
/*
Future<ApplicationRes> readApi(String url, bool dataStatus,
      String message) async {

    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
      var json = jsonDecode(response.body);
        ApplicationRes applicationRes = ApplicationRes.fromJson(json);
        applicationController.dataStatus = true;
        update();
        return applicationRes;
      }

 */
}
