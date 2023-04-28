import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/sesstion/sesstion_of_city.dart';
import 'package:ween_blaqe/urls_of_project/localhost_urls.dart';
import 'package:http/http.dart' as http;
import '../../api/cities.dart';
import '../../data_containers/add_ad_data_container.dart';
List <City>cityItems = [];
City ? currentCity;

class DropDownCity extends StatefulWidget {
  DropDownCity({Key? key,
  }) : super(key: key);
  @override
  State<DropDownCity> createState() => _DropDownCityState();
}
class _DropDownCityState extends State<DropDownCity> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await go();


      // print(currentType?.productName??"");
      // print(currentArea?.name??"");
      // focusNodeOfFullName;
      // FocusScope.of(context).requestFocus();
    });
  }
  @override
  Widget build(BuildContext context){
    return
      Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
          child:cityItems.length>=1 ? DropdownButtonFormField<dynamic>(
            // focusNode: focusNode,
            style: TextStyle(fontSize:15 ),
            // autofocus: true,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                //<-- SEE HERE
                borderSide:
                BorderSide(color: Colors.orange.shade300, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                //<-- SEE HERE
                borderSide: BorderSide(color: Colors.orange, width: 1),
              ),
            ),
            value: currentCity,
            items:cityItems
                .map((c)=> DropdownMenuItem(value:c,child: Text(c.name,
              style: TextStyle(fontSize: 14,
                  color: Colors.black54,
                  fontFamily: 'IBM'
              ),),),).toList(),
            onChanged: (i){
              setState(() {
                currentCity = i!;
                AddAdDataContainer.currentCityId =
                currentCity?.id??0;
              });
            },
          )
              :SizedBox(child: Text("جاري التحميل..",
              style: TextStyle(fontSize: 12,
                  color: Colors.grey.shade400,
                  fontFamily: 'IBM'
              )
          ),)
      );
  }
  go() async {
    setState(() {
      cityItems.clear();
    });
    var url = Uri.parse(ServerLocalDiv.city);
    var res = await http.get(url);
    var json = jsonDecode(res.body);
    var data = json["data"] as List<dynamic>;
    cityItems.clear();
    for (var value in data) {
      cityItems.add(City(id: value['id'], name: value['name']));
      currentCity = cityItems.first;
      setState(() {if (currentCity!=null){
        saveCity(currentCity!);
      }});
    }
  }
}