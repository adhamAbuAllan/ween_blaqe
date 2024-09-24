import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';

import 'package:ween_blaqe/data_containers/add_ad_data_container.dart';

import 'package:ween_blaqe/core/widgets/skeletons/student_widgets/show_more_skeleton_widget.dart';
import '../../../../api/advantages.dart';

import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import '../../../../constants/nums.dart';
import '../../../../core/widgets/alirt_class_widget.dart';

// main (){
//   runApp(MaterialApp(home:SecondStep()));
// }
class SecondStep extends StatefulWidget {
  const SecondStep({super.key});

  @override
  State<SecondStep> createState() => _SecondStepState();
}

class _SecondStepState extends State<SecondStep> {
  // var turnOnLocalFeatures = false;

  // List<Advantages> advantages = [];

  // Advantages? advantage;

  // bool checked = false;

  // List<Advantages> features = [];
  late Future<List<Advantages>> allFeatures;
  List<int> featuresChosen = [];

  // List<int> chosen = [];
  // Map<int, bool> chosen = {};
// late FeatureOfAdvantagesCheckBox newCheck ;
  @override
  void initState() {
    super.initState();
    allFeatures = advantagesModelController.getAdvantagesMethod();
    allFeatures;
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
                          setState(() {
                            featuresChosen.clear();
                            // in a list of [advantages]
                            for (var index
                                in advantagesModelController.advantages) {
                              //check if a current [index] have true
                              if (index.checked == true) {
                                // if that is true then add it in [featureChosen] list

                                featuresChosen.add(index.id ?? -1);
                              }
                            }

                            debugPrint(
                                'this is a feature you are chosen numbers $featuresChosen');
                            // advantagesModelController.chosen = featuresChosen;
                            advantagesModelController.chosen =
                                advantagesModelController.chosen
                                    .toSet()
                                    .toList();
                            advantagesModelController.chosen.sort();

                            debugPrint(
                                'a numbers you chosen that in api ${advantagesModelController.chosen}');
                          });

                          debugPrint("${AddAdDataContainer.address}");
                          // print(AddAdDataContainer.currentCity?.name);
                          debugPrint("${AddAdDataContainer.rooms}");
                          debugPrint("${AddAdDataContainer.bathRooms}");
                          if (advantagesModelController.chosen.length < 5) {
                            NormalAlert.show(
                                context,
                                "قم بتحديد المزايا "
                                    "المتوفرة",
                                "برجاء إضافة ما لا يقل عن 5 مزايا",
                                "حسنًا");

                            return;
                          }

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
                      color: themeMode.isDark
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
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
                Obx(() {
                  if (advantagesModelController.isDataLoading.value) {
                    return const SkeletonAdvantages(isAddAdvantages: true);
                  } else {
                    return Container(
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 10, 10),
                                child: Text(
                                  "حدد المزايا",
                                  style: TextStyle(
                                      fontFamily: 'IBM',
                                      fontSize: 20,
                                      color: themeMode.isDark
                                          ? kTextColorLightMode
                                          : kTextColorDarkMode),
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
                                    advantagesModelController.advantages
                                        .map((feature) {
                              return ListTile(
                                  onTap: () {
                                    setState(() {
                                      feature.checked = !feature.checked!;
                                      if (feature.checked ?? false) {
                                        advantagesModelController.chosen
                                            .add(feature.id ?? -1);
                                      } else {
                                        advantagesModelController.chosen
                                            .remove(feature.id ?? -1);
                                      }

                                    });
                                  },
                                  horizontalTitleGap: 2.5,
                                  dense: false,
                                  // selected: checked,

                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  // mainAxisSize: MainAxisSize.min,

                                  leading: Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.6)),
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
                                      value: feature.checked,
                                      onChanged: (a) {
                                        setState(() {
                                          if (a != null) {
                                            feature.checked = a;

                                            if (feature.checked ?? false) {
                                              advantagesModelController.chosen
                                                  .add(feature.id ?? -1);
                                            } else {
                                              advantagesModelController.chosen
                                                  .remove(feature.id ?? -1);
                                            }
                                            debugPrint(
                                                "feature id 1 checked = ${feature.checked}");
                                          }

                                        });
                                      }),
                                  title: Text(
                                    feature.advName ?? "",
                                    // feature.advName,
                                    style: TextStyle(
                                        fontFamily: 'IBM',
                                        fontSize: 16,
                                        color: themeMode.isDark
                                            ? kTextColorLightMode
                                            : kTextColorDarkMode),
                                  ),
                                  // const Expanded(child: Text("")),
                                  trailing: Image(
                                    color: themeMode.isDark
                                        ? kTextColorLightMode
                                        : kTextColorDarkMode,
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
                    );
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

}
