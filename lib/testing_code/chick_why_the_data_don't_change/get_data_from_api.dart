import 'dart:convert';
import 'package:get/get.dart';
import '../../../constants/strings.dart';
import 'package:http/http.dart' as http;
class GetDataTest extends GetxController{
  List<String?> items = [];
  String currentItem = "";
  Future<List<String?>?> getDataCityApiTest(
      List<String> ?cityItems, String? currentCity) async {
    cityItems?.clear();
    var url = Uri.parse(ServerWeenBalaqee.city);
    var res = await http.get(url);
    if(res.statusCode == 200){
      var jsonData = jsonDecode(res.body);
      var getData = jsonData['data'];
      print("your data before forloop is : --$getData");
      for(var item in getData){
        cityItems?.add(item["name"]);
      }
      currentCity = cityItems?.first;
      return cityItems;
    }else{
      throw res.statusCode;
    }
  }

}