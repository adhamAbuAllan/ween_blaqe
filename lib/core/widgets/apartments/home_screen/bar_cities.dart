import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/constants/strings.dart';


import '../../../../api/cities.dart';
import '../../../../constants/nums.dart';
import '../../cities/cities_class_widget.dart';

class CitiesBar extends StatefulWidget {
  const CitiesBar({Key? key}) : super(key: key);

  @override
  State<CitiesBar> createState() => _CitiesBarState();
}

class _CitiesBarState extends State<CitiesBar> {
  bool isLoading = false;
  List<City> cities = [];

  @override
  void initState() {
    super.initState();
    getCity();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 23, 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: kContainerColor,
      ),
      //cities

      child: Column(
        children: <Widget>[
          //cities text
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Text(
                  "المدن",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(child: Text("")),
            ],
          ),
          //cities
          buildSingleChildScrollViewHorizontal(),
        ],
      ),
    );
  }

  SingleChildScrollView buildSingleChildScrollViewHorizontal() {
    return SingleChildScrollView(
      // dragStartBehavior: DragStartBehavior.down,
      // reverse: true,
      // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        child: Card(
          // shadowColor: ,
          // surfaceTintColor: Colors.grey,

          color: Colors.white10,
          elevation: 0,
          child: isLoading == true
              ? const CircularProgressIndicator(
                  color: kPrimaryColor,
                  backgroundColor: Colors.white,
                  strokeWidth: 1,
                )
              : Row(
                  children: cities
                      .map((c) => city(c, () async {
                            setState(() {
                              isLoading = true;
                            });
                            await getCity();

                            setState(() {
                              isLoading = false;
                            });
                          }))
                      .toList()),
        ),
      ),
    );
  }

  getCity() async {
    setState(() {
      cities.clear();
    });
    var url = Uri.parse(ServerLocalDiv.city);

    var res = await http.get(url);

    var json = jsonDecode(res.body);

    var data = json["data"] as List<dynamic>;

    cities.clear();
    for (var value in data) {
      cities.add(City(id: value['id'], name: value['name']));
      cities.first;
      setState(() {});
    }
  }
}
