import 'package:flutter/material.dart';
import '/classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/container_choose_item_class_widget.dart';
import '/classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/container_input_text_class_widget.dart';
import '/styles/button.dart';
import '/styles/show_more_widget/about_apartment_style.dart';
import '/widgets/user/owner/steps_to_create_apartment/second_step.dart';


class FirstStep extends StatefulWidget {
  const FirstStep({Key? key}) : super(key: key);

  @override
  State<FirstStep> createState() => _FirstStepState();
}

class _FirstStepState extends State<FirstStep> {
//Cities box
  String firstCity = 'الخليل';
  String city_box_title = "المدينة";

  List<String> cities = [
    'الخليل',
    'نابلس',
    'بيرزيت',
    ' القدس',
    'رام الله',
    'طولكرم',
    ' جنين',
    'أريحا',
    'بيت لحم',
    'سلفيت',
  ];

  //choose address box
  String choose_address_title = "حدد العنوان";
  String hint_address = "مثال:الخليل-وادالهرية-بجانب مسجد ابوعيشة";
  TextInputType text = TextInputType.text;

//choose rooms box
  String choose_count_rooms_text = "حدد عدد الغرف ";
  String hint_count_rooms = "0";
  TextInputType number = TextInputType.number;

  //choose bathrooms box
  String choose_count_bathrooms_text = "حدد عدد الحمامات";
  String hint_count_bathrooms = "0";

  @override
  Widget build(BuildContext context) {
    var address_focusNose = FocusNode();
    var  count_roomsFocusNode = FocusNode();
    var count_bathroomsFocusNode = FocusNode();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Center(
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
                        child: const Text("إلغاء"),
                      ),
                      const Expanded(child: Text("")),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return const SecondStep();
                            },
                          ));
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
                    "الخطوة الاولى",
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
                    'step_one.png',
                    width: 65,
                    height: 65,
                    fit: BoxFit.fill,
                  ),
                ),
                //city box
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: ContainerChooseItemClassWidget(
                    title: city_box_title,
                    firstItem: firstCity,
                    items: cities,
                  ),
                ),
                //location box
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: ContainerInputTextClassWidget(
                    title: choose_address_title,
                    hintInput: hint_address,
                    inputType: text,
                    focusNode:address_focusNose,
                      onFieldSubmitted: (value){}
                  ),
                ),
                //rooms box
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: ContainerInputTextClassWidget(
                    title: choose_count_rooms_text,
                    hintInput: hint_count_rooms,
                    inputType: number,
                    focusNode: count_roomsFocusNode,
                      onFieldSubmitted: (value){}
                  ),
                ),
                //bathrooms box
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: ContainerInputTextClassWidget(
                    title: choose_count_bathrooms_text,
                    hintInput: hint_count_bathrooms,
                    inputType: number,
                    focusNode: count_bathroomsFocusNode,
                      onFieldSubmitted: (value){}
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
