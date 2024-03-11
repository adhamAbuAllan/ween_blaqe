import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/constants/nums.dart';
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
    // Scaffold(
    //
    //   backgroundColor: Colors.grey,
    //   body: Column(
    //    mainAxisSize: MainAxisSize.min,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       SizedBox(height: 200,),
    //       // HomeOfDropDownTest(),
    //       DropdownButtonFormField<dynamic>(
    //         style: const TextStyle(fontSize: 15),
    //         decoration:  InputDecoration(
    //           enabledBorder: OutlineInputBorder(
    //             borderSide: BorderSide(color: themeMode.isDark ? kPrimaryColorLightMode: kPrimaryColor300DarkMode, width: 0.5),
    //           ),
    //           focusedBorder: OutlineInputBorder(
    //             borderSide: BorderSide(color:themeMode.isDark ?  kPrimaryColorLightMode:kPrimaryColorDarkMode, width: 1),
    //           ),
    //         ),
    //         value:
    //         cityVariableControllerTest.currentCity,
    //         items: cityVariableControllerTest.cityItems
    //             .map(
    //               (c) => DropdownMenuItem(
    //             value: c,
    //             child: Text(
    //               c.name??"null",
    //               style: const TextStyle(
    //                   fontSize: 16,
    //                   color: Colors.green,
    //                   fontFamily: 'IBM'),
    //             ),
    //           ),
    //         )
    //             .toList(),
    //         onChanged: (i) {
    //           setState(() {
    //             if (i != null) {
    //               cityVariableControllerTest.currentCity.id = i;
    //             }
    //           });
    //         },
    //       ),
    //       GoToShowDataCityPage()
    //     ],
    //   ),
    // ),
  ));
}


class GoToShowDataCityPage extends StatelessWidget {
  const GoToShowDataCityPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      Navigator.push(context, CupertinoPageRoute(builder: (context) => const DataCityHereTest(),));
    }, child: const Text("save"));
  }
}
