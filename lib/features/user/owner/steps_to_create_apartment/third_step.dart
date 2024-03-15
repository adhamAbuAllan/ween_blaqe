import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';

import '../../../../controller/get_controllers.dart';
import '../../../../core/widgets/alirt_class_widget.dart';
import '../../../../core/widgets/apartments/create_apartment/'
    'container_classes_widget/containers_choose_items_class_widget/'
    'container_choose_items_class_widget.dart';
import '../../../../core/widgets/apartments/create_apartment/'
    'container_classes_widget/input_text_class_widget/'
    'container_input_text_class_widget.dart';
import '../../../../data_containers/add_ad_data_container.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import '../../../../constants/nums.dart';

TextEditingController priceController = TextEditingController();
TextEditingController countOfStudentController = TextEditingController();
TextEditingController squareMetersController = TextEditingController();
var price = AddAdDataContainer.price;
var countOfStudent = AddAdDataContainer.countOfStudent;
var squareMeters = AddAdDataContainer.squareMeters;

var typeOfApartment = AddAdDataContainer.type;

//
//--------------
// var studentId = 0;
//--------------

class ThirdStep extends StatefulWidget {
  const ThirdStep({Key? key}) : super(key: key);

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
  readyCityAndTypeOfApartmentApi.getDataCityApi(true,
      dataStatusA: readyCityAndTypeOfApartmentApi.dataStatus,
        index: readyCityAndTypeOfApartmentApi.indexApartmentType,
      list: readyCityAndTypeOfApartmentApi.apartmentType,
      // typeOfApartmentModelsController.apartmentTypes,
        oneItem: readyCityAndTypeOfApartmentApi.currentApartmentType,
      urlA: ServerWeenBalaqee.typeOfApartment);
  // });

  // print("current type in is : ${typeOfApartmentModelsController.currentType},"
  //     "and the items is : ${typeOfApartmentModelsController.apartmentTypes}");
  }
  //price box
  var priceText = "السعر";
  var priceHint = "يرجى إدخال الإيجار بشكل شهري";
  var priceFocusNode = FocusNode();

  // var numberInputType

  //count of students box
  var countStudentText = "عدد الطلاب المسموح به";
  var countStudentHint = "0";
  var countStudentFocusNode = FocusNode();

  //square meters of apartment box
  var squareText = "حجم الشقة";
  var squareHint = "يرجى إدخال حجم الشقة بالمتر مربع";
  var squareFocusNode = FocusNode();

  //type of apartment box
  var typeApartmentText = "نوع السكن";

  var firstValueTypeApartment = "طلاب";
  var typeOfApartmentFoucsNode = FocusNode();
  List<String> typeApartmentItems = ['طلاب', 'طالبات'];

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
bottomColor: Colors.transparent ,
      color:themeMode.isDark ?kPrimaryColorLightMode :  kPrimaryColorDarkMode,
      child: GestureDetector(
        onTap: () {
          setState(() {
           print("the dataStatus is : ${readyCityAndTypeOfApartmentApi.dataStatus}");
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
          backgroundColor:themeMode.isDark ? kBackgroundAppColorLightMode: kBackgroundAppColorDarkMode,
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
                      Expanded(child: ElevatedButton(onPressed: (){
                        setState(() {
                          // print("undere prints methods is in print dropdown button");
                          // print(typeOfApartmentModelsController
                          // .apartmentTypes);
                          // print("the First in the List
                          // ${typeOfApartmentModelsController.apartmentTypes.first}");
                          // print(typeOfApartmentModelsController.
                          // typeIndex);
                          // print(typeOfApartmentModelsController.
                          // dataStatus);

                        });
                      }, child: const
              Text("print valuse of dropdown"))),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            try {
                              setState(() {
                                AddAdDataContainer.price =
                                    int.parse(priceController.text);
                                setState(() {
                                  AddAdDataContainer.countOfStudent =
                                      int.parse(countOfStudentController.text);
                                  AddAdDataContainer.squareMeters =
                                      int.parse(squareMetersController.text);
                                });
                                setState(() {
                                  // AddAdDataContainer.type = firstValueTypeApartment;
                                });
                              });

                              // AddAdDataContainer.countOfStudent = student_id;

                              if (price != null &&
                                  countOfStudent != null &&
                                  squareMeters != null) {
                                debugPrint(
                                    "type of apartment after add on class "
                                        "--$typeOfApartment");
                                debugPrint(
                                    "prince  --${AddAdDataContainer.price}");
                                debugPrint(
                                    "count Of student  "
                                        "--${AddAdDataContainer.countOfStudent}");
                                debugPrint(
                                    "square meteres "
                                        " --${AddAdDataContainer.squareMeters}");
                                myPushName(context, MyPagesRoutes.step4);
                              }
                            } catch (c) {
                              NormalAlert.show(
                                  context,
                                  "بيانات ناقصة",
                                  "يوجد "
                                      "بيانات"
                                      " ناقصة "
                                      "، تأكد "
                                      "من إدخال "
                                      "البيانات"
                                      " في جميع "
                                      "الحقول،"
                                      "ثم حاول"
                                      " مرة إخرى",
                                  "حسنًا");
                              return;
                            }
                          });
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
                    "الخطوة الثالثة",
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
                    'step_three.png',
                    width: 65,
                    height: 65,
                    fit: BoxFit.fill,
                  ),
                ),
                //price padding
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: ContainerInputTextClassWidget(
                    title: priceText,
                    hintInput: priceHint,
                    controller: priceController,
                    inputType: TextInputType.number,
                    focusNode: priceFocusNode,
                  ),
                ),
                //countStudent padding
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color:
                    themeMode.isDark?
                    kContainerColorLightMode:kContainerColorLightMode,
                  ),
                  child:
                  // typeOfApartmentModelsController.dataStatus
                  //     ?
                  ContainerChooseItemsClassWidget(
                    items: readyCityAndTypeOfApartmentApi.apartmentType,
                    title: "نوع السكن",
                    currentValue: readyCityAndTypeOfApartmentApi.currentApartmentType,
                  dataStatus:
                  readyCityAndTypeOfApartmentApi.dataStatus,
                  // typeOfApartmentModelsController.dataStatus,
                  onSelected: (c) {
                      // aValueInDropDownButton = c;
                      setState(() {
                      readyCityAndTypeOfApartmentApi.currentApartmentType = c;
                      setState(() {
                        for (var i = 0; i <
                            readyCityAndTypeOfApartmentApi.apartmentType
                                .length; ++i) {
                          if (readyCityAndTypeOfApartmentApi.currentApartmentType ==
                              readyCityAndTypeOfApartmentApi.apartmentType[i]) {
                            setState(() {
                              readyCityAndTypeOfApartmentApi.indexApartmentType = i + 1;
                            });
                          }
                        }
                      });
                    },
                    );
                    // Column(
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                    //           child: Text(
                    //             "نوع السكن",
                    //             style: TextStyle(
                    //               color: Colors.grey.shade800,
                    //               fontSize: 18,
                    //               fontFamily: 'IBM',
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    //       child: DropdownButtonClassWidget(
                    //
                    //         firstItem: typeOfApartmentModelsController.currentType,
                    //         items: typeOfApartmentModelsController.apartmentTypes,
                    //         onSelected: (e) {
                    //           setState(() {
                    //             typeOfApartmentModelsController.currentType = e;
                    //             setState(() {
                    //               for (var i = 0; i <
                    //               typeOfApartmentModelsController.
                    //               apartmentTypes.length; ++i) {
                    //                 if(typeOfApartmentModelsController.
                    //                 currentType == typeOfApartmentModelsController.
                    //                 apartmentTypes[i]){
                    //                   setState(() {
                    //                     typeOfApartmentModelsController.
                    //                     typeIndex = i+1;
                    //                   });
                    //                 }
                    //               }
                    //             });
                    //
                    //           });
                    //
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // )
                  })
                      // :            SizedBox(child: Text("جاري التحميل..",
                  //     style: TextStyle(fontSize: 12,
                  //         color: Colors.grey.shade400,
                  //         fontFamily: 'IBM'
                  //     )
                  // ),)
                  ,
                ),
                ContainerInputTextClassWidget(
                  title: countStudentText,
                  hintInput: countStudentHint,
                  controller: countOfStudentController,
                  inputType: TextInputType.number,
                  focusNode: countStudentFocusNode,
                ),
                //square padding
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: ContainerInputTextClassWidget(
                    title: squareText,
                    hintInput: squareHint,
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
