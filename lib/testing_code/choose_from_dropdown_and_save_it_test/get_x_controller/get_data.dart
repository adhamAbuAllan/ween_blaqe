import 'dart:convert';

import 'package:get/get.dart';
import 'package:ween_blaqe/api/cities.dart';
import 'package:ween_blaqe/testing_code/choose_from_dropdown_and_save_it_test/get_x_controller/city_variables_controller_test.dart';
import 'package:ween_blaqe/testing_code/choose_from_dropdown_and_save_it_test/get_x_controller/get_controllers.dart';

import '../../../constants/strings.dart';
import 'package:http/http.dart' as http;

class ReadyCityApiTest extends GetxController{

  List<City>? cityItems = [];
  City  currentCity= City();
  Future<List<City?>?> getDataCityApiTest() async {

     cityItems?.clear();
    var url = Uri.parse(ServerWeenBalaqee.city);
    var res = await http.get(url);
    if(res.statusCode == 200){
      var jsonData = jsonDecode(res.body);
      var getData = jsonData['data'];
      print("jsonData before for loop :$getData");
        for(var item in getData){
    cityItems?.add(City(id:item["id"],name: item["name"]));
        print("the item for all items of name is : ${item["name"]}");

      }
        currentCity = cityItems!.first;
      return cityItems;
    }else{
      throw res.statusCode;
    }
   //  var json = jsonDecode(res.body);
   //  print("the json before get it fromJson method: $json");
   //   CityVariableControllerTest.cityRes = CityRes.fromJson(json);
   //   cities = CityVariableControllerTest.cityRes.data??[];
   // print("the json after get it fromJson method :${CityVariableControllerTest.cityRes}");
   //    var data = CityVariableControllerTest.cityRes.data??[];
   //    cityVariableControllerTest.cityItems?.clear();
   //  for (var value in data) {
   //    cityVariableControllerTest.cityItems?.add(City(id:value.id, name: value.name,));
   //    // cities.add(City(id:value.id, name: value.name,));
   //
   //    // cityVariableControllerTest.currentCity =  cityVariableControllerTest.cityItems!.first;
   //      update();
   //        }
   //  print("${cities.first.name}");
   //  return cities;
  }
callAPIandAssignData() async {
  cityItems = (await getDataCityApiTest())?.cast<City>();
}

}