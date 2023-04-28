import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/universities.dart';
import 'package:ween_blaqe/sesstion/sesstion_of_university.dart';
import 'package:ween_blaqe/urls_of_project/localhost_urls.dart';
import 'package:http/http.dart' as http;
List <University>universityItems = [];
University ? currentUniversity;
class DropDownUniversity extends StatefulWidget {
  // University currentValue = currentValue.name ;
  DropDownUniversity({Key? key,
    // University ? currentUniversity
  }) : super(key: key);
  @override
  State<DropDownUniversity> createState() => _DropDownUniversityState();
}
class _DropDownUniversityState extends State<DropDownUniversity> {
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
      Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child:universityItems.length>=1 ? DropdownButtonFormField<dynamic>(
            // focusNode: focusNode,
            style: TextStyle(fontSize:16 ),
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
            value: currentUniversity,
            items:universityItems
                .map((c)=> DropdownMenuItem(value:c,child: Text(c.name,
              style: TextStyle(fontSize: 14,
                  color: Colors.grey.shade800,
                  fontFamily: 'IBM'
              ),),),).toList(),
            onChanged: (i){
              setState(() {
                currentUniversity = i!;
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
      universityItems.clear();
    });
    var url = Uri.parse(ServerLocalDiv.university);
    var res = await http.get(url);
    var json = jsonDecode(res.body);
    var data = json["data"] as List<dynamic>;
    universityItems.clear();

    for (var value in data) {
      universityItems.add(University(id: value['id'], name: value['name']));
      currentUniversity = universityItems.first;
      setState(() {
        if(currentUniversity!=null){
          saveUniversity(currentUniversity!);
          }


      });
    }
  }
}