import 'dart:convert';
import 'package:get/get.dart';
import '../../../constants/strings.dart';
import 'package:http/http.dart' as http;
class ReadyCityApiTest extends GetxController{
  List<String>? cityItems = [];
  String  currentCity= "الخليل";
  Future<List<String?>?> getDataCityApiTest() async {
     cityItems?.clear();
    var url = Uri.parse(ServerWeenBalaqee.city);
    var res = await http.get(url);
    if(res.statusCode == 200){
      var jsonData = jsonDecode(res.body);
      var getData = jsonData['data'];
        for(var item in getData){
    cityItems?.add(item["name"]);
      }
        currentCity = cityItems!.first;
      return cityItems;
    }else{
      throw res.statusCode;
    }
  }
callAPIandAssignData() async {
  cityItems = (await getDataCityApiTest())?.cast<String>();
}

}