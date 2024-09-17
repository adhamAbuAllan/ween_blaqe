import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class GetDataTest extends GetxController{
  int index = 1;
  int indexOfType = 1;
  List<String?>? items = [];
  String currentItem = "";
  saveData(int currentIndex,{bool isCity = true}){
  isCity ? index = currentIndex : indexOfType = currentIndex ;
  update();
  }
  insertList(List<String?>? localList){
    items = localList;
    update();
  }
  insertCurrentData(String localCurrentData){
    currentItem = localCurrentData;
    update();
  }
  Future<List<String?>?> getDataCityApiTest(
      List<String> ?cityItems, String? currentCity,String uri) async {
    cityItems?.clear();

    var url = Uri.parse(uri);
    var res = await http.get(url);
    if(res.statusCode == 200){
      var jsonData = jsonDecode(res.body);
      var getData = jsonData['data'];
      print("your data before forloop is : --$getData");
      for(var item in getData){
      // items.add(item["name"]);
        cityItems?.add(item["name"]);
      }
      currentCity = cityItems?.first;
      return cityItems;
    }else{
      throw res.statusCode;
    }
  }

}
