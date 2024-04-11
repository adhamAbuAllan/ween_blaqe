import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/core/widgets/apartments/create_apartment/container_classes_widget/check_boxs/advatnages_check_box/feature_of_advatnages.dart';
import 'dart:convert';
import '../../../../api/advantages.dart';
import '../../../../core/widgets/apartments/create_apartment/container_classes_widget/check_boxs/advatnages_check_box/add_advantages_container_class_widget.dart';
import '../../../../data_containers/add_ad_data_container.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import '../../../../constants/nums.dart';

// main (){
//   runApp(MaterialApp(home:SecondStep()));
// }
class SecondStep extends StatefulWidget {
  const SecondStep({Key? key}) : super(key: key);

  @override
  State<SecondStep> createState() => _SecondStepState();
}

class _SecondStepState extends State<SecondStep> {
  var turnOnLocalFeatures = false;

  List<Advantages> advantages = [];
  Advantages? advantage;

  bool checked = false;
  List<Advantages> features = [];
  late Future<List<AdvantageRes?>?> allFeatures;

  List<int> featuresChosen = [];
  // List<int> chosen = [];
  // Map<int, bool> chosen = {};
late FeatureOfAdvantagesCheckBox newCheck ;
  @override
  void initState() {
    super.initState();
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await go(advantages);
    //
    // });
    allFeatures = go(advantages);
    allFeatures;
    // newCheck;

    // print("city_id --${AddAdDataContainer.cityId} -- in second_step page");

// print(AddAdDataContainer.address);
//   readyCityAndTypeOfApartmentApi.dataStatus = false;
  }

  @override
  Widget build(BuildContext context) {
    // var desktopAdvText = "مكتب";
    // var desktopAdvIcon =
    "assets/images/apartments_images/advantages/desktop.png";
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: themeMode.isDark ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: themeMode.isDark
              ? kBackgroundAppColorLightMode
              : kBackgroundAppColorDarkMode,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: outlineButton,
                        child: const Text("رجوع"),
                      ),
                      const Expanded(child: Text("")),
                      ElevatedButton(
                        onPressed: () {
                          debugPrint("${AddAdDataContainer.address}");
                          // print(AddAdDataContainer.currentCity?.name);
                          debugPrint("${AddAdDataContainer.rooms}");
                          debugPrint("${AddAdDataContainer.bathRooms}");

                          myPushName(context, MyPagesRoutes.step3);
                        },
                        style: fullButton,
                        child: const Text("التالي"),
                      ),
                    ],
                  ),
                ),
                //text steps
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    "الخطوة الثانية",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 20,
                      fontFamily: 'IBM',
                    ),
                  ),
                ),
                //image steps
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 5, 25, 30),
                  child: Image.asset(
                    'assets/'
                    'images/'
                    'apartments_images/'
                    'images_to_create_apartment/'
                    'step_two.png',
                    width: 65,
                    height: 65,
                    fit: BoxFit.fill,
                  ),
                ),
                //this container have 2 main items own: text of advantages , and advantages
                Container(
                  // height: 100,
                  margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
                  padding: const EdgeInsets.fromLTRB(10, 2, 10, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: themeMode.isDark
                        ? kContainerColorLightMode
                        : kContainerColorDarkMode,
                  ),
                  child: Column(
                    children: [
                      //this row for text
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                            child: Text(
                              "حدد المزايا",
                              style: TextStyle(
                                  fontFamily: 'IBM',
                                  fontSize: 20,
                                  color: Colors.grey.shade800),
                            ),
                          ),
                          const Expanded(child: Text("")),
                        ],
                      ),
                      //here could owner add advantages
                      // const AddAdvantages()
                      SingleChildScrollView(
                        child: Column(
                            children:
                                // turnOnLocalFeatures == true ?
                                advantages.map((feature) {
                          return ListTile(
                              onTap: () {
                                print(feature.id);
                                // if(){}
                                for (var item in features) {
                                  // if(item.id??<=15){}
                                  newCheck.checked = true;
                                  //   item.id == newCheck.id ? newCheck = true :newCheck =
                                  // item['id'] = newCheck.checked;
                                }
                                print("new check the check is --${newCheck.checked}");
                                print("new check the id is --${newCheck.id}");
                                print("new check the name is --${newCheck.name}");
                                // chosen = ;
                              },
                              dense: true,
                              // selected: checked,

                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              // mainAxisSize: MainAxisSize.min,

                              leading: Checkbox(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.6)),
                                  focusColor: themeMode.isDark
                                      ? kPrimaryColorLightMode
                                      : kPrimaryColorDarkMode,
                                  checkColor: Colors.white,
                                  hoverColor: themeMode.isDark
                                      ? kPrimaryColorLightMode
                                      : kPrimaryColorDarkMode,
                                  activeColor: themeMode.isDark
                                      ? kPrimaryColorLightMode
                                      : kPrimaryColorDarkMode,
                                  side: BorderSide(
                                      color: themeMode.isDark
                                          ? kPrimaryColor300LightMode
                                          : kPrimaryColor300DarkMode),
                                  splashRadius: 20,
                                  // autofocus: false,
                                  // tristate: true,
                                  // overlayColor: MaterialStateProperty.all(kPrimaryColor),
                                  // value: feature.checked,
                                  value: feature.checked,
                                  onChanged: (a) {
                                    // features.first;
                                    if (a != null) {
                                      setState(() {
                                        feature.checked = a;

                                        // advantage?.checkedId == 1 ? a: a;
                                        // feature.checked = a;

                                        // feature.checked = a;
                                        // _isTapped = feature.checked;
                                        // feature.checked = _isTapped;
                                      });
                                      if (feature.checked == true) {
                                        // chosen.add(feature.id);
                                        print('the id of feature that you check is ${feature.id} and it is true');
                                        // chosen.add(advantage?.id??1);
                                      } else {
                                        print('the id of feature that you not check is ${feature.id}false');
                                        // var index = chosen.indexOf(feature.id);
                                        // chosen.removeAt(index + 1);
                                      }
                                    } else {

                                      debugPrint(
                                          "you input null values check you database or and check url is ture or not !");
                                    }
                                  }),
                              title: Text(
                                feature.advName ?? "",
                                // feature.advName,
                                style: TextStyle(
                                    fontFamily: 'IBM',
                                    fontSize: 16,
                                    color: Colors.grey.shade800),
                              ),
                              // const Expanded(child: Text("")),
                              trailing: Image(
                                image: NetworkImage(
                                  feature.icon ?? "",
                                ),
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  return child;
                                },
                                width: 30,
                                height: 30,
                              ));
                        }).toList()),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<AdvantageRes?>?> go(List<Advantages> adv) async {
    setState(() {
      adv.clear();
    });
    var url = Uri.parse(ServerWeenBalaqee.advantagesAll);
    // var response = await http.post(url,body:{"adv_name": "apartment",
    //   // "icon":"assets/images/apartments_images/apartment.jpg"
    // });
    var res = await http.get(url);
    var json = jsonDecode(res.body);
    var data = json["data"];
    // as List<dynamic>;
    print("the data is --$data");
    adv.clear();
    for (var value in data) {
      adv.add(Advantages(
        id: value['id'],
        advName: value['adv_name'],
        icon: value['icon'],

        // checkedId: value['checked_id']
      ));

     // newCheck =  FeatureOfAdvantagesCheckBox(id: value['id'],name: value['adv_name'],icon: value['icon'],checked: checked);
      // print("id of advantages --${value['id']}");
      // debugPrint("this is data :$data");
      setState(() {
        adv.first;
        if (checked == false) {
          // value['checked_id'] = 0;

          // data[4] = 0;
        } else {
          // value['checked_id'] = 1;
          debugPrint("$checked");
        }
      });
    }
    return allFeatures;
  }

  goInsert(String name) async {
    var url = Uri.parse(ServerWeenBalaqee.advantagesAdd);

    var response = await http.post(url, body: {
      "adv_name": name,
    });
    var json = jsonDecode(response.body);
    var data = json["data"] as List<dynamic>;
    for (var value in data) {
      advantages.add(Advantages(
        id: value['id'],
        advName: value['adv_name'],
        icon: value['icon'],
        // checkedId: value['checked_id']
      ));
      setState(() {
        advantages.first;
        // advantages = chosen;
        if (checked == false) {
          // data[4] = 0;
        } else {}
      });
    }
  }
}
