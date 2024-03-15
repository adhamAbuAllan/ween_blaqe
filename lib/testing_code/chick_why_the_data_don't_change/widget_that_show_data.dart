import 'package:flutter/material.dart';
import  'package:get/get.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'container_that_requird_para.dart';
import 'get_controllers.dart';
import 'get_data_from_api.dart';

class HereShouldDataToShow extends StatefulWidget {
  const HereShouldDataToShow({super.key});

  @override
  State<HereShouldDataToShow> createState() => _HereShouldDataToShowState();
}

class _HereShouldDataToShowState extends State<HereShouldDataToShow> {
  Future<List<String?>?>? items;
  String currentValue = "";
  List<String> testList = [];

  @override
  void initState() {
    super.initState();
    items =
        getDataTest.getDataCityApiTest(testList, "", ServerWeenBalaqee.city);
    getDataTest.items = testList;
    getDataTest.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HereShouldDataToPass(
            currentValue: "",
            list: [],
            onSelected: (c) {
              setState(() {
                currentValue = c;
                // print(getDataTest.currentItem);
              });
              print(getDataTest.items);
              print(testList);
            },
            items: items,
          ),
          const SizedBox(
            height: 19,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  // getDataTest.insertDataBetweenTwoLists(testList, getDataTest.items);
                });
                for (var i = 0; i < testList.length; ++i) {
                  if (currentValue == testList[i]) {
                    getDataTest.saveData(i);
                    // getDataTest.index = i;
                    print(
                        "the index of getDataTest.index+1: --${getDataTest.index + 1}");
                  }
                }
                // getDataTest.update();
                print("the items in getDataTest.items: --${getDataTest.items}");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnotherWidget(),
                    ));
              },
              child: const Text("save data")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnotherDropDownTest(),
                    ));
              },
              child: const Text(
                "go to another dropdown",
              ))
        ],
      ),
    );
  }
}

class AnotherWidget extends StatelessWidget {
  const AnotherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "index:${getDataTest.index + 1}",
          style: const TextStyle(color: Colors.white),
        ),
        Text("items:${getDataTest.items}",
            style: const TextStyle(color: Colors.white)),
        Text("index of type:${getDataTest.indexOfType}",
            style: const TextStyle(color: Colors.white)),
        ElevatedButton(
            onPressed: () {
              print(
                  "the index of getDataTest.index + 1 : --${getDataTest.index + 1}");
              print("the items of getDataTest.items: --${getDataTest.items}");
              print("the items of getDataTest.index of type: --${getDataTest.indexOfType+1}");
            },
            child: const Text("print value"))
      ]),
    );
  }
}

class AnotherDropDownTest extends StatefulWidget {
  const AnotherDropDownTest({super.key});

  @override
  State<AnotherDropDownTest> createState() => _AnotherDropDownTestState();
}

class _AnotherDropDownTestState extends State<AnotherDropDownTest> {
  Future<List<String?>?>? items;
  String currentValue = "";
  List<String> testList = [];

  @override
  void initState() {
    super.initState();
    items = getDataTest.getDataCityApiTest(
        testList, "", ServerWeenBalaqee.typeOfApartment);
    // getDataTest.items = testList;
    // getDataTest.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HereShouldDataToPass(
            currentValue: "",
            list: [],
            onSelected: (c) {
              setState(() {
                currentValue = c;
                // print(getDataTest.currentItem);
              });
              print(getDataTest.items);
              print(testList);
            },
            items: items,
          ),
          const SizedBox(
            height: 19,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  // getDataTest.insertDataBetweenTwoLists(testList, getDataTest.items);
                });
                for (var i = 0; i < testList.length; ++i) {
                  if (currentValue == testList[i]) {
                    getDataTest.saveData(i, isCity: false);
                    // getDataTest.index = i;
                    print("the index of getDataTest.indexOfType+1:"
                        " --${getDataTest.indexOfType + 1}");
                  }
                }
                // getDataTest.update();
                print("the itemsOfType :$testList");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnotherWidget(),
                    ));
              },
              child: const Text("save data"))
        ],
      ),
    );
  }
}
