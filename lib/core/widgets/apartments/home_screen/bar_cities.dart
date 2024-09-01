import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/widgets/skeletons/student_widgets/home_skeleton_widget.dart';

import '../../../../api/cities.dart';
// import '../../../../constants/nums.dart';
import '../../cities/cities_class_widget.dart';

class CitiesBar extends StatefulWidget {
  const CitiesBar({super.key});

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
    return SingleChildScrollView(
      // dragStartBehavior: DragStartBehavior.down,
      // reverse: true,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      scrollDirection: Axis.horizontal,
      child: Card(
        // shadowColor: ,
        // surfaceTintColor: Colors.grey,

        color: Colors.transparent,
        elevation: 0,
        child: isLoading == true
            ? const CitiesBarSkeleton()
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
    );
  }

  getCity() async {
    setState(() {
      cities.clear();
    });
    var url = Uri.parse(ServerWeenBalaqee.city);

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
