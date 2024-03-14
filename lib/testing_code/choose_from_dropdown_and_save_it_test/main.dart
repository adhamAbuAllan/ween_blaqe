import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/testing_code/choose_from_dropdown_and_save_it_test/home.dart';
import 'package:ween_blaqe/testing_code/choose_from_dropdown_and_save_it_test/show_save.dart';
import '../../controller/function_controller/change_theme_mode.dart';
import 'get_x_controller/city_variables_controller_test.dart';
import 'get_x_controller/get_data.dart';
main() {
  Get.put(ChangeThemeMode());
  Get.put(CityVariableControllerTest());
  Get.put(ReadyCityApiTest());
  runApp( const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeOfDropDownTest()
  ));
}
class GoToShowDataCityPage extends StatelessWidget {
  const GoToShowDataCityPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      Navigator.push(context,
          CupertinoPageRoute(builder: (context) => const DataCityHereTest(),));
    }, child: const Text("save"));
  }
}
