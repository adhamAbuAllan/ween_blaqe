import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/get_it_controller.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';

import 'package:ween_blaqe/data_containers/add_ad_data_container.dart';

import 'package:ween_blaqe/core/widgets/skeletons/student_widgets/show_more_skeleton_widget.dart';
import 'package:ween_blaqe/view/common_widgets/containers_widgets/container_widget.dart';
import '../../../../api/advantages.dart';

import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import '../../../../constants/localization.dart';
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
      color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: themeMode.isLight
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
                        style: outlinedButton(context: context,themeMode:
                        themeMode),
                        child: Text(SetLocalization.of(context)!
                            .getTranslateValue("back")),
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

                          debugPrint("${AddApartmentData.address}");
                          // print(AddAdDataContainer.currentCity?.name);
                          debugPrint("${AddApartmentData.rooms}");
                          debugPrint("${AddApartmentData.bathRooms}");
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
                        style: fullButton(),
                        child: Text(SetLocalization.of(context)!
                            .getTranslateValue("next")),
                      ),
                    ],
                  ),
                ),
                //text steps
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    SetLocalization.of(context)!
                        .getTranslateValue("second_step"),
                    style: TextStyle(
                      color: themeMode.isLight
                          ? kTextColorLightMode
                          : kTextColorDarkMode,
                      fontSize: getIt<AppDimension>()
                          .isSmallScreen(context)
                          ? 18:20,
                      
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                //image steps
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 30),
                  child: themeMode.isLight
                      ? Image.asset(
                          'assets/images/apartments_images/images_to_create_apartment/second_step.png',
                    width:getIt<AppDimension>()
                        .isSmallScreen(context)
                        ? 65/1.1:  65,
                    height: getIt<AppDimension>()
                        .isSmallScreen(context)
                        ? 65/1.1:  65,
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          'assets/images/apartments_images/images_to_create_apartment/second_step_dark_mode'
                          '.png',
                    width:getIt<AppDimension>()
                        .isSmallScreen(context)
                        ? 65/1.1:  65,
                    height: getIt<AppDimension>()
                        .isSmallScreen(context)
                        ? 65/1.1:  65,
                          fit: BoxFit.fill,
                        ),
                ),
                //this container have 2 main items own: text of advantages , and advantages
                Obx(() {
                  if (advantagesModelController.isDataLoading.value) {
                    return const SkeletonAdvantages(isAddAdvantages: true);
                  } else {
                    return ContainerWidget(child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        //this row for text
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 10,
                              horizontal: 20),
                          child: Text(
                            SetLocalization.of(context)!
                                .getTranslateValue("select_advantages"),
                            style: TextStyle(

                                fontSize: getIt<AppDimension>()
                                    .isSmallScreen(context)
                                    ?18:  20,
                                fontWeight: FontWeight.w500,
                                color: themeMode.isLight
                                    ? kTextColorLightMode
                                    : kTextColorDarkMode),
                          ),
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
                                        focusColor: themeMode.isLight
                                            ? kPrimaryColorLightMode
                                            : kPrimaryColorDarkMode,
                                        checkColor: Colors.white,
                                        hoverColor: themeMode.isLight
                                            ? kPrimaryColorLightMode
                                            : kPrimaryColorDarkMode,
                                        activeColor: themeMode.isLight
                                            ? kPrimaryColorLightMode
                                            : kPrimaryColorDarkMode,
                                        side: BorderSide(
                                            width: 1.5,
                                            strokeAlign: 1,
                                            color: themeMode.isLight
                                                ? kPrimaryColorLightMode
                                                .withOpacity(.3)
                                                : kPrimaryColorDarkMode
                                                .withOpacity(.3)),
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

                                          fontSize: getIt<AppDimension>()
                                              .isSmallScreen(context)
                                              ? 14:16,
                                          color: themeMode.isLight
                                              ? kTextColorLightMode
                                              : kTextColorDarkMode),
                                    ),
                                    // const Expanded(child: Text("")),
                                    trailing: Image(
                                      color: themeMode.isLight
                                          ? kTextColorLightMode
                                          : kTextColorDarkMode,
                                      image: NetworkImage(
                                        feature.icon ?? "",
                                      ),
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        return child;
                                      },
                                      width: getIt<AppDimension>()
                                          .isSmallScreen(context)
                                          ? 24
                                          : 30,
                                      height: getIt<AppDimension>()
                                          .isSmallScreen(context)
                                          ? 24
                                          : 30,
                                    ));
                              }).toList()),
                        )
                      ],
                    ));
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