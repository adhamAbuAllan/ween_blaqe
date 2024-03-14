import 'package:flutter/material.dart';
import 'package:ween_blaqe/testing_code/choose_from_dropdown_and_save_it_'
    'test/get_x_controller/get_controllers.dart';
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
    //here I got data and the stats code is 200
 readyCityApiTest.callAPIandAssignData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200,
          ),
          // HomeOfDropDownTest(),
          DropdownButtonFormField<dynamic>(
            style: const TextStyle(fontSize: 15),
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.orange,
                    width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.orange,
                    width: 1),
              ),
            ),
            value:readyCityApiTest.currentCity,
            items: readyCityApiTest.cityItems
                ?.map(
                  (c) => DropdownMenuItem(
                    value: c,
                    child: Text(
                      c,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.amber,
                          fontFamily: 'IBM'),
                    ),
                  ),
                )
                .toList(),
            onChanged: (i) {
              setState(() {
                if (i != null) {
                  readyCityApiTest.currentCity = i;
                }
              });
            },
          ),
          const GoToShowDataCityPage(),
          Text(
            "${readyCityApiTest.cityItems}",
            style: const TextStyle(color: Colors.white),
          ),
          ElevatedButton(
              onPressed: () {
                //here when I click buttn the items is show!
                setState(() {
                });
                print(readyCityApiTest.currentCity);
                print(readyCityApiTest.cityItems?.first);
              },
              child: const Text("print logic"))
        ],
      ),
    );
  }
}
