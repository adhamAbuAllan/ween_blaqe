import 'package:flutter/material.dart';
import 'package:ween_blaqe/testing_code/choose_from_dropdown_and_save_it_t'
    'est/get_x_controller/city_variables_controller_test.dart';
import 'package:ween_blaqe/testing_code/choose_from_dropdown_and_save_it_'
    'test/get_x_controller/get_controllers.dart';
import '../../api/cities.dart';
import '../../constants/nums.dart';
import 'get_x_controller/get_data.dart';
import 'main.dart';
class HomeOfDropDownTest extends StatefulWidget {
const HomeOfDropDownTest({super.key});
  @override
  State<HomeOfDropDownTest> createState() => _HomeOfDropDownTestState();
}
class _HomeOfDropDownTestState extends State<HomeOfDropDownTest> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await
    readyCityApiTest.callAPIandAssignData();
    // });

  }
  // City currentCity = readyCityApiTest.currentCity;

List<String> yourListValueIsNull= ["You fucking value is fucking null","make "
    "fucking solve fuck that"];
  String yourValueIsNull = "WFT your stubid value !, is fucking null";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,

      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 200,),
          // HomeOfDropDownTest(),
          DropdownButtonFormField<dynamic>(
            style: const TextStyle(fontSize: 15),
            decoration:  InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: themeMode.isDark ?
                kPrimaryColorLightMode: kPrimaryColor300DarkMode, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color:themeMode.isDark ?
                kPrimaryColorLightMode:kPrimaryColorDarkMode, width: 1),
              ),
            ),
            // value: readyCityApiTest.currentCity.name,
            value: readyCityApiTest.currentCity.name ?? yourValueIsNull,
            items: readyCityApiTest.cityItems != null ?
            readyCityApiTest.cityItems
                ?.map(
                  (c) => DropdownMenuItem(
                value: c.name,
                child: Text(
                  c.name??"no value you have",
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.amber,
                      fontFamily: 'IBM'
                  ),
                ),
              ),
            )
                .toList():[],
            onChanged: (i) {
              setState(() {
                if (i != null) {
                  readyCityApiTest.currentCity.name = i;

                }
              });
            },
          ),
          const GoToShowDataCityPage(),
          Text("${readyCityApiTest.cityItems}",style: const TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}
