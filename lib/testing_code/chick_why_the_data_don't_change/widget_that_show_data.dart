import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'container_that_requird_para.dart';
import 'get_data_from_api.dart';

class HereShouldDataToShow extends StatefulWidget {
  const HereShouldDataToShow({super.key});

  @override
  State<HereShouldDataToShow> createState() => _HereShouldDataToShowState();
}

class _HereShouldDataToShowState extends State<HereShouldDataToShow> {
  GetDataTest getDataTest = Get.find();
  Future<List<String?>?>? items;
  String currentValue = "";

  @override
  void initState() {
    super.initState();
    items = getDataTest.getDataCityApiTest([], "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: HereShouldDataToPass(
        currentValue: "",
        list: [],
        onSelected: (c) {
            setState(() {
              currentValue = c;
              print(currentValue);
            });
        },
        items: items,
      )

          ),
    );
  }
}
// class AnotherWidget extends StatelessWidget {
//   const AnotherWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
