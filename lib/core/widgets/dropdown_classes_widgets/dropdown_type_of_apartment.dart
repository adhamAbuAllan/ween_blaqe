import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:http/http.dart' as http;

import '../../../api/type_of_apartment.dart';
import '../../../sesstion/sesstion_of_type_apartment.dart';

List <TypeOfApartment>typeOfApartmentItems = [];
TypeOfApartment ? currentType;
class DropDownTypeOfApartment extends StatefulWidget {
  const DropDownTypeOfApartment({Key? key,
  }) : super(key: key);
  @override
  State<DropDownTypeOfApartment> createState() => _DropDownTypeOfApartmentState();
}
class _DropDownTypeOfApartmentState extends State<DropDownTypeOfApartment> {
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
    return
      SizedBox(
        width : double.infinity,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
            child:typeOfApartmentItems.isNotEmpty ? DropdownButtonFormField<dynamic>(
              // focusNode: focusNode,
              style: const TextStyle(fontSize:14 ),
              // autofocus: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  //<-- SEE HERE
                  borderSide:
                  BorderSide(color: Colors.orange.shade300, width: 0.5),
                ),
                focusedBorder: const OutlineInputBorder(
                  //<-- SEE HERE
                  borderSide: BorderSide(color: Colors.orange, width: 1),
                ),
              ),
              value: currentType,
              items:typeOfApartmentItems
                  .map((c)=> DropdownMenuItem(value:c,child: Text(c.name,
                style: const TextStyle(fontSize: 14,
                    color: Colors.black54,
                    fontFamily: 'IBM'
                ),),),).toList(),
              onChanged: (i){
                setState(() {
                  currentType = i!;
                  if(currentType!=null){

                    // currentCity!.id = AddAdDataContainer.currentCityId!.id;
                    // currentType!.id = AddAdDataContainer.typOfApartmentId!.id;
                  }else{
                    // currentCity?.id = 0;
                  }

                });
              },
            )
                :SizedBox(child: Text("جاري التحميل..",
                style: TextStyle(fontSize: 12,
                    color: Colors.grey.shade400,
                    fontFamily: 'IBM'
                )
            ),)
        ),
      );
  }
  go() async {
    setState(() {
      typeOfApartmentItems.clear();
    });
    var url = Uri.parse(ServerLocalDiv.typeOfApartment);
    var res = await http.get(url);
    var json = jsonDecode(res.body);
    var data = json["data"] as List<dynamic>;
    typeOfApartmentItems.clear();
    for (var value in data) {
      typeOfApartmentItems.add(TypeOfApartment(id: value['id'], name: value['name']));
      currentType = typeOfApartmentItems.first;
      setState(() {
        if(currentType!=null){
          saveTypeOfApartment(currentType!);
        }
      });
    }
  }
}