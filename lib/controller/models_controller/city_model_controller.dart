import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

import '../../api/cities.dart';
import '../../constants/strings.dart';

class CityModelController extends GetxController {
RxInt cityId = 0.obs;
RxBool isLoading = false.obs;
RxList<City> cities = <City>[].obs;

getCity() async {
    cities.clear();
  var url = Uri.parse(ServerWeenBalaqee.city);

  var res = await http.get(url);

  var json = jsonDecode(res.body);

  var data = json["data"] as List<dynamic>;
  debugPrint("the data in cities is : $data");

  cities.clear();
  for (var value in data) {
    cities.add(City(id: value['id'], name: value['name']));
    cities.first;
  }
  update();
}

}
