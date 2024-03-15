import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ReadyCityAndApartmentTypeApi extends GetxController {

  //city values
  List<String> citiesName = [];
  int indexOfCity = 1;
  //type apartment value
  int indexApartmentType = 1;
  // RxString currentType = "".obs;
  //
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
  // saveCurrentValue(String localValue,RxString globalValue){
  //   globalValue = localValue;
  //   globalValue.toString();
  //   update();
  // }
  saveData(int currentIndex,{bool isCity = true}){
    isCity ? indexOfCity = currentIndex : indexApartmentType = currentIndex ;
    update();
  }


}
