
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../api/cities.dart';
import '../../cities/cities_class_widget.dart';
class CitiesBar extends StatelessWidget {
  List<City> cities = [
    City(id: 1, name: "الخليل"),
    City(id: 2, name: "نابلس"),
    City(id: 3, name: "بيرزيت"),
    City(id: 4, name: "القدس"),
    City(id: 5, name: "رام الله"),
    City(id: 6, name: "طولكرم"),
    City(id: 7, name: "جنين"),
    City(id: 8, name: "أريحا"),
    City(id: 9, name: "بيت لحم"),
    City(id: 10, name: "سلفيت"),
  ];
   CitiesBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.fromLTRB(0, 23, 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white70,
      ),
      //cities

      child: Column(
        children: <Widget>[
          //cities text
          Padding(
            padding: EdgeInsets.fromLTRB(300, 0, 0, 0),
            child: Text(
              "المدن",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
            ),
          ),
          //cities
          SingleChildScrollView(
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
                child: Row(
                    children:
                    cities.map((c) => city(c, (){

                    })).toList()
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
