import 'package:flutter/material.dart';
import 'package:ween_blaqe/testing_code/choose_from_dropdown_and_save_it_test/get_x_controller/city_variables_controller_test.dart';
import 'package:ween_blaqe/testing_code/choose_from_dropdown_and_save_it_test/get_x_controller/get_controllers.dart';

class DataCityHereTest extends StatefulWidget {
  const DataCityHereTest({super.key});

  @override
  State<DataCityHereTest> createState() => _DataCityHereTestState();
}

class _DataCityHereTestState extends State<DataCityHereTest> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await readyCityApiTest.getDataCityApiTest();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    backgroundColor: Colors.black,
    body: Column(mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "the id of city is :${readyCityApiTest.cityItems?.first.id}",
              style: const TextStyle(color: Colors.white))          ,
          Text(
            "the city is :${readyCityApiTest.currentCity.name}",
              style: const TextStyle(color: Colors.white))  ,        Text(
            "the items of cities is :${CityVariableControllerTest.cityRes.data}",
              style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
