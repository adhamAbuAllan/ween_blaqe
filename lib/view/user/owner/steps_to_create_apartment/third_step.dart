import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';

import '../../../../api/type_of_apartment.dart';
import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';
import '../../../../constants/localization.dart';
import '../../../../controller/get_controllers.dart';
import '../../../../core/widgets/alirt_class_widget.dart';
import '../../../../core/widgets/apartments/create_apartment/'
    'container_classes_widget/containers_choose_items_class_widget/'
    'container_choose_items_class_widget.dart';
import '../../../common_widgets/containers_widgets/container_field_widget.dart';
import '../../../../data_containers/add_ad_data_container.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import '../../../../constants/nums.dart';

TextEditingController priceController = TextEditingController();
TextEditingController countOfStudentController = TextEditingController();
TextEditingController squareMetersController = TextEditingController();
var price = AddApartmentData.price;
var countOfStudent = AddApartmentData.countOfStudent;
var squareMeters = AddApartmentData.squareMeters;

// var typeOfApartment = AddAdDataContainer.type;

//
//--------------
// var studentId = 0;
//--------------

class ThirdStep extends StatefulWidget {
  const ThirdStep({super.key});

  @override
  State<ThirdStep> createState() => _ThirdStepState();
}

class _ThirdStepState extends State<ThirdStep> {
  dynamic aValueInDropDownButton;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //  await
    wholeListApi = readyCityAndTypeOfApartmentApi.getDataTypeApiToEdit(
      readyCityAndTypeOfApartmentApi.itemsTypeOfApartment,
      ServerWeenBalaqee.typeOfApartment,
    );
    // });

//print("current type in is : ${typeOfApartmentModelsController.currentType},"
//     "and the items is : ${typeOfApartmentModelsController.apartmentTypes}");
  }

  //price box
  var priceText = "السعر";
  var priceHint = "يرجى إدخال الإيجار بشكل شهري";
  var priceFocusNode = FocusNode();

  // var numberInputType

  //count of students box
  var countStudentText = "عدد الطلاب المسموح به";
  var countPersonText = "عدد الأفراد المسموح به";
  var countStudentHint = "0";
  var countStudentFocusNode = FocusNode();

  //square meters of apartment box
  var squareText = "حجم الشقة";
  var squareHint = "يرجى إدخال حجم الشقة بالمتر مربع";
  var squareFocusNode = FocusNode();

  //type of apartment box
  var typeApartmentText = "نوع السكن";
  Future<List<dynamic>?>? wholeListApi;
  var firstValueTypeApartment = "";
  var typeOfApartmentFoucsNode = FocusNode();
  List<String> typeApartmentItems = [];
  int indexOfTypeOfApartment = 1;

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: GestureDetector(
        onTap: () {
          debugPrint(
              "a list of types of apartment is $typeApartmentItems, and the  current value is $firstValueTypeApartment");
          debugPrint("a current local index is $indexOfTypeOfApartment ,"
              "a current of index in api is ${readyCityAndTypeOfApartmentApi.indexApartmentType} ");
          setState(() {
            // print("the dataStatus is : ${readyCityAndTypeOfApartmentApi.dataStatus}");
            // readyCityAndTypeOfApartmentApi.dataStatus = true;
          });
          //
          //   // await   readyCityApi.getDataCityApi(true,dataStatusA:
          //   typeOfApartmentModelsController.dataStatus,
          //   //     index: typeOfApartmentModelsController.typeIndex,list:
          //   typeOfApartmentModelsController.apartmentTypes,
          //   //     oneItem: typeOfApartmentModelsController.currentType,urlA:
          //   ServerWeenBalaqee.typeOfApartment);
          //   // setState(() {
          //   //   typeOfApartmentModelsController.dataStatus = true;
          //   //
          //   // });
          //
          FocusManager.instance.primaryFocus?.unfocus();
          //
        },
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
                        style: outlinedButton(context:context,themeMode:
                        themeMode),
                        child: Text(SetLocalization.of(context)!
                            .getTranslateValue("back")),
                      ),
                      const Expanded(child: SizedBox()),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            try {
                              setState(() {
                                AddApartmentData.price =
                                    int.parse(priceController.text);
                                setState(() {
                                  AddApartmentData.countOfStudent =
                                      int.parse(countOfStudentController.text);
                                  AddApartmentData.squareMeters =
                                      int.parse(squareMetersController.text);
                                });
                                setState(() {
                                  for (var i = 0;
                                      i < typeApartmentItems.length;
                                      ++i) {
                                    if (typeApartmentItems[i] ==
                                        firstValueTypeApartment) {
                                      setState(() {
                                        indexOfTypeOfApartment = i + 1;
                                      });
                                      readyCityAndTypeOfApartmentApi.saveData(
                                          indexOfTypeOfApartment,
                                          isCity: false);
                                    }
                                  }

                                  // AddAdDataContainer.type = firstValueTypeApartment;
                                });
                              });

                              // AddAdDataContainer.countOfStudent = student_id;

                              if (price != null &&
                                  countOfStudent != null &&
                                  squareMeters != null) {
                                // debugPrint(
                                //     "type of apartment after add on class "
                                //     "--$typeOfApartment");
                                debugPrint(
                                    "prince  --${AddApartmentData.price}");
                                debugPrint("count Of student  "
                                    "--${AddApartmentData.countOfStudent}");
                                debugPrint("square meteres "
                                    " --${AddApartmentData.squareMeters}");
                                myPushName(context, MyPagesRoutes.step4);
                              }
                            } catch (c) {
                              NormalAlert.show(
                                  context,
                                  "",
                                  SetLocalization.of(context)!.getTranslateValue("missing_data_message"),
                                  SetLocalization.of(context)!
                                      .getTranslateValue("ok"));
                              return;
                            }
                          });
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
                        .getTranslateValue("third_step"),
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
                          'assets/images/apartments_images'
                          '/images_to_create_apartment/step_three.png',
                    width:getIt<AppDimension>()
                        .isSmallScreen(context)
                        ? 65/1.1:  65,
                    height: getIt<AppDimension>()
                        .isSmallScreen(context)
                        ? 65/1.1:  65,
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          'assets/'
                          'images/'
                          'apartments_images/'
                          'images_to_create_apartment/'
                          'thrid_setp_dark_mode.png',
                    width:getIt<AppDimension>()
                        .isSmallScreen(context)
                        ? 65/1.1:  65,
                    height: getIt<AppDimension>()
                        .isSmallScreen(context)
                        ? 65/1.1:  65,
                          fit: BoxFit.fill,
                        ),
                ),
                //price padding
                Padding(
                  padding:  EdgeInsets.only(bottom:  getIt<AppDimension> ()
                      .isSmallScreen(context) ? 0:10),
                  child: ContainerFieldWidget(
                    title:
                        SetLocalization.of(context)!.getTranslateValue("price"),
                    hintInput: SetLocalization.of(context)!.getTranslateValue("enter_monthly_rent"),
                    controller: priceController,
                    inputType: TextInputType.number,
                    focusNode: priceFocusNode,
                  ),
                ),
                //countStudent padding
                Padding(
                  padding:  EdgeInsets.only(bottom: getIt<AppDimension> ().isSmallScreen(context) ? 0:10),
                  child: ContainerChooseItemsClassWidget(
                      wholeListApi: wholeListApi,
                      title: SetLocalization.of(context)!
                          .getTranslateValue("housing_type_students"),
                      currentValue: firstValueTypeApartment,
                      onSelected: (type) {
                        if (type is TypeOfApartment) {
                          setState(() {
                            indexOfTypeOfApartment = type.id ?? -1;
                          });
                          readyCityAndTypeOfApartmentApi
                              .saveData(indexOfTypeOfApartment, isCity: false);
                        }

                        debugPrint("the index of type of city from get "
                            "data controller in third step is"
                            " : --${readyCityAndTypeOfApartmentApi.indexApartmentType}");
                      }),
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: getIt<AppDimension> ().isSmallScreen(context) ? 0:10),
                  child: ContainerFieldWidget(
                    title: indexOfTypeOfApartment == 1
                        ? countPersonText
                        : SetLocalization.of(context)!
                            .getTranslateValue("allowed_students"),
                    hintInput: countStudentHint,
                    controller: countOfStudentController,
                    inputType: TextInputType.number,
                    focusNode: countStudentFocusNode,
                  ),
                ),
                //square padding
                Padding(
                  padding:  EdgeInsets.only(top:  getIt<AppDimension> ()
                      .isSmallScreen(context) ? 0:10),
                  child: ContainerFieldWidget(
                    title: SetLocalization.of(context)!.getTranslateValue("apartment_size")
                    ,
                    hintInput: SetLocalization.of(context)!.getTranslateValue("enter_apartment_size"),
                    controller: squareMetersController,
                    inputType: TextInputType.number,
                    focusNode: squareFocusNode,
                  ),
                ),
                /*
                be careful !!!
                  * don't delete those lines

                 * ----------------------------------
                *   //type of apartment container
                // ContainerChooseTypeApartmentItemClassWidget(
                //   title: typeApartmentText,
                // ),
                * ----------------------------------
                * */
              ],
            ),
          ),
        ),
      ),
    );
  }
}