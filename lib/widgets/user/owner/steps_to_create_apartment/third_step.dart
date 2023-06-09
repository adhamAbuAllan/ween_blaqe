import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/container_choose_item_class_widget.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/container_input_text_class_widget.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/dropdown_classes_widgets/dropdown_type_of_user.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/registration/dropdown_button.dart';
import 'package:ween_blaqe/data_containers/add_ad_data_container.dart';
import 'package:ween_blaqe/widgets/user/owner/steps_to_create_apartment/fourth_step.dart';

import '../../../../classes_that_effect_widgets/alirt_class_widget.dart';
import '../../../../classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/add_a_contact_class_widget.dart';
import '../../../../funcations/route_pages/my_pages_routes.dart';
import '../../../../funcations/route_pages/push_routes.dart';
import '../../../../styles/button.dart';

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
  List<String> typeApartmentItems= [
    'طلاب',
    'طالبات'
  ];

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: Colors.orange,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
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
                            try {
                              setState(() {
                                AddAdDataContainer.price = int.parse(priceController.text);
                                setState(() {
                                  AddAdDataContainer.countOfStudent = int.parse(countOfStudentController.text);
                                  AddAdDataContainer.squareMeters  = int.parse(squareMetersController.text);
                                });
                                setState(() {
                                  AddAdDataContainer.type = firstValueTypeApartment;

                                });

                              });

                              // AddAdDataContainer.countOfStudent = student_id;

                              if (price != null &&
                                  countOfStudent != null &&
                                  squareMeters != null) {
                                print("type of apartment after add on class --$typeOfApartment");
                                print("prince  --${AddAdDataContainer.price}");
                                print("count Of student  --${AddAdDataContainer.countOfStudent}");
                                print("square meteres  --${AddAdDataContainer.squareMeters}");
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
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white70,
                  ),
                  child: Column(

                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 10,10),
                            child: Text("نوع السكن",
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 18,
                                fontFamily: 'IBM',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child:DropdownButtonClassWidget(
                          lift: 10,
                          right: 10,
                          firstItem: firstValueTypeApartment,
                          items: typeApartmentItems,fontSize: 15,
                        onSelected: (c){
                          firstValueTypeApartment = c;
                        },),





                      ),
                    ],
                  ),
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
