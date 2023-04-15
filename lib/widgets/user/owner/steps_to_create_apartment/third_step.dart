import 'package:flutter/material.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/container_choose_item_class_widget.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/container_input_text_class_widget.dart';
import 'package:ween_blaqe/widgets/user/owner/steps_to_create_apartment/fourth_step.dart';

import '../../../../classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/add_a_contact_class_widget.dart';
import '../../../../styles/button.dart';
class ThirdStep extends StatefulWidget {
  const ThirdStep({Key? key}) : super(key: key);

  @override
  State<ThirdStep> createState() => _ThirdStepState();
}

class _ThirdStepState extends State<ThirdStep> {
  //price box
  var priceText = "حدد السعر";
  var priceHint = "يرجى إدخال الإيجار بشكل شهري";
  var priceFocusNode = FocusNode();
  // var numberInputType

  //count of students box
  var countStudentText = "حدد عدد الطلاب المسموح به";
  var countStudentHint = "0";
  var countStudentFocusNode = FocusNode();
  //square meters of apartment box
  var squareText = "حدد حجم الشقة";
  var squareHint = "يرجى إدخال حجم الشقة بالمتر مربع";
  var squareFocusNode = FocusNode();
  //type of apartment box
  var typeApartmentText = "حدد نوع السكن";
  var firstValueTypeApartment = "طلاب";
  var typeOfApartmentFoucsNode = FocusNode();
  List<String> typeApartmentItems= [
    'طلاب',
    'طالبات'
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,

        body: SingleChildScrollView(
          child: Column(children: [
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
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const FourthStep();
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
              child: Text("الخطوة الثالثة",
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
              child: Image.asset('assets/'
                  'images/'
                  'apartments_images/'
                  'images_to_create_apartment/'
                  'step_three.png',
                width: 65,
                height: 65,fit: BoxFit.fill,),
            ),
            //price padding
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: ContainerInputTextClassWidget(title: priceText,
                  hintInput: priceHint,
                  inputType: TextInputType.number,focusNode: priceFocusNode,
                onFieldSubmitted: (value){},),
            ),
            //countStudent padding
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: ContainerInputTextClassWidget(title: countStudentText,
                  hintInput: countStudentHint,
                  inputType: TextInputType.number,focusNode: countStudentFocusNode,
                  onFieldSubmitted: (value){}),
            ),
            //square padding
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: ContainerInputTextClassWidget(title: squareText,
                  hintInput: squareHint,
                  inputType: TextInputType.number,focusNode: squareFocusNode,
                  onFieldSubmitted: (value){}),
            ),
            //type of apartment container
            ContainerChooseItemClassWidget(title: typeApartmentText,
                items: typeApartmentItems,
                firstItem: firstValueTypeApartment,),

          ],),
        ),
      ),
    );
  }
}
