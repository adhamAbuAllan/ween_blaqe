import 'dart:convert';
import 'package:get/get.dart';
import '../../../constants/strings.dart';
import 'package:http/http.dart' as http;

class ReadyCityAndApartmentTypeApi extends GetxController {
  bool isApartmentApi = true;
  //city values
  List<String> citiesName = [];
  int indexOfCity = 1;
    String oneCityName = "";
  bool dataStatus = false;
  //type apartment value
 final List<String> apartmentType = [];
  String currentApartmentType = "";
  int indexApartmentType = 1;
  // bool dataApartmentType = false;
  //
  Future<List<String>?> getDataCityApi(
    bool isApartmentTypes, {
    List<String>? list,
    var oneItem,
    int? index,
    bool? dataStatusA,
    String? urlA,
  }) async {
    if (isApartmentTypes == true && list == null ||
        oneItem == null ||
        index == null ||
        urlA == null ||
        dataStatusA == null) {
      isApartmentTypes = false;
      isApartmentApi = false;

    }

    dataStatusA = true;
    update();

    list?.clear() ;
    update();

    var url = Uri.parse(isApartmentTypes ? urlA ?? "" : ServerWeenBalaqee.city);
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      var getData = jsonData['data'];
      print("the data from json is : --$getData");
      for (var item in getData) {
        list?.add(item['name']);
        print("item is :${item['name']}");
        update();
      }

      oneItem = list?.first ;
      update();
      // dataStatusA = false;


      print(
          "your data after feach is :${list?.first}"
              "that according isTest value and it is :$isApartmentTypes now"
          ",and the current value is $oneItem");
      update();
      return list ;
    } else {
      throw res.statusCode;
    }
  }

}
