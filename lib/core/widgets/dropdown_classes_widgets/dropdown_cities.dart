import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/constants/strings.dart';


import '../../../api/cities.dart';
import 'package:ween_blaqe/constants/nums.dart';

final List<City> cityItems = [];
City? currentCity;
// class MyClass {
//   int _publicVariable = 42;
//
//   int get publicVariable => _publicVariable;
//   set publicVariable(int value) => _publicVariable = value;
// }

class DropDownCity extends StatefulWidget {
  const DropDownCity({Key? key, required this.onSelected}) : super(key: key);
  final Function(City) onSelected;
  @override
  State<DropDownCity> createState() => _DropDownCityState();
}

class _DropDownCityState extends State<DropDownCity> {
  // get publicCurrentCity => currentCity;
  // set publicCurrentCity(int value)=>currentCity = currentCity;
  // static int city = currentCity?.;
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
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
        child: cityItems.isNotEmpty
            ? DropdownButtonFormField<dynamic>(
                // focusNode: focusNode,
                style: const TextStyle(fontSize: 15),
                // autofocus: true,
                decoration:  InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(color: themeMode.isDark ? kPrimaryColorLightMode: kPrimaryColor300DarkMode, width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(color:themeMode.isDark ?  kPrimaryColorLightMode:kPrimaryColorDarkMode, width: 1),
                  ),
            ),
                value: currentCity,
                items: cityItems
                    .map(
                      (c) => DropdownMenuItem(
                        value: c,
                        child: Text(
                          c.name,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontFamily: 'IBM'),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (i) {
                  // currentCity = i;
                  setState(() {
                    if (i != null) {
                      currentCity = i!;
                      setState(() {
                        widget.onSelected(currentCity!);
                        debugPrint("currentCity --$currentCity");
                        debugPrint("i --$i -- in dropdown city");
                      });
                      // AddAdDataContainer.currentCity = i;
                    }
                    // print(i);

                    // if(currentCity!=null){
                    //   setState(() {
                    //    AddAdDataContainer.currentCityId!.id = currentCity!.id ;
                    //
                    //     print("${currentCity?.name}");
                    //
                    //
                    //   });
                    // }else{
                    //   currentCity?.id = 0;
                    //   print("the current value is null : $currentCity");
                    // }
                  });
                },
              )
            : SizedBox(
                child: Text("جاري التحميل..",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade400,
                        fontFamily: 'IBM')),
              ));
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
      setState(() {
        if (currentCity != null) {
          if (value != null) {
            setState(() {
              // AddAdDataContainer.cityId = currentCity;
            });
            // print(" city id in process --${AddAdDataContainer.cityId} ");
            // print(value);

            // cityItems.first;
            // currentCity = cityItems.first;
            // AddAdDataContainer.currentCity = currentCity;
          }
          //   // AddAdDataContainer.currentCityId!.id = currentCity!.id ;
          //
          //   // saveCity(currentCity!);
          //   currentCity?.id = AddAdDataContainer.currentCityId!.id;
          //   print("this is current city id : ${currentCity?.id}");
          //   currentCity?.name = AddAdDataContainer.currentCityId!.name;
          //   print("this is current city name : ${currentCity?.name}");
          //
          //   // currentCity!.id = AddAdDataContainer.currentCityId!.id;
          //
        }
      });
    }
  }
}
// // class Testing extends StatefulWidget {
// //
// //   static printValue(){
// //
// //
// //   }
// //
// //   // @override
// //   // State<StatefulWidget> createState() {
// //   //   throw UnimplementedError();
// //   //
// //   // }
// //
// // }
// // class Testing2 extends StatefulWidget {
// //   const Testing2({Key? key}) : super(key: key);
// //
// //   @override
// //   State<Testing2> createState() => _Testing2State();
// //
// // }
// //
// // class _Testing2State extends State<Testing2> {
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     return const Placeholder();
// //   }
// //   testing (){
// //      int? cityIdNow = currentCity?.id;
// //      String? cityNameNow = currentCity?.name;
// //     setState(() {
// //       print("this is city id now : $cityIdNow");
// //       print("this is city name now : $cityNameNow");
// //     });
// //   }
// // }
