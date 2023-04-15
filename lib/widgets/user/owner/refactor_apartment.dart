import 'package:flutter/material.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/container_choose_item_class_widget.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/container_input_text_class_widget.dart';
import 'package:ween_blaqe/styles/button.dart';
import 'package:ween_blaqe/styles/show_more_widget/about_apartment_style.dart';
import 'package:ween_blaqe/widgets/user/owner/apartment_of_owner.dart';
import 'package:ween_blaqe/widgets/user/owner/steps_to_create_apartment/second_step.dart';

import '../../../classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/add_a_contact_class_widget.dart';
import '../../../classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/add_advantages_container_class_widget.dart';
class RefactorApartment extends StatefulWidget {
  const RefactorApartment({Key? key}) : super(key: key);

  @override
  State<RefactorApartment> createState() => _RefactorApartmentState();
}

class _RefactorApartmentState extends State<RefactorApartment> {
  @override
  Widget build(BuildContext context) {
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
    var address_focusNose = FocusNode();
    var  count_roomsFocusNode = FocusNode();
    var count_bathroomsFocusNode = FocusNode();
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
    // Ad box
    var addSuitableTitleForAdText = "أضف عنوان";
    var addSuitableTitleForAdHnit = "سكن طلاب مفروش";
    var adFocusNode = FocusNode();
    var discrptionFocusedNode = FocusNode();
    //discription box
    var discrptionApartmentText  = "صف الشقة";
    var discrptionApartmentHint = " شقة خاصة"
        " بالطلاب و في مكان هادئ و بعيد عن الضوضاء ،"
        " لدينا تسهيلات للطلاب و بسعر مناسب ، ويتوفر"
        " فيها العديد من الخدمات مثل السوبر ماركت "
        "و مطعم للوجبات السريعة كذلك يوجد العديد "
        "من المكتبات التي تخدم الطلاب بجميع التخصصات.";

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
          appBar: AppBar(


            actions: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: outlineButton,
                child: const Text("إلغاء"),
              ),
            ),
            const Expanded(child: Text("")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const ApartmentOfOwner();
                    },
                  ));
                },
                style: fullButton,
                child: const Text("حفظ"),
              ),
            ),

          ],
          backgroundColor: Colors.white,

          ),

          body:   SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  //city box
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 10),
                    width: 373,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white70,
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
                        const AddAdvantages(),

                      ],
                    ),
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
                  //add title to Ad
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: ContainerInputTextClassWidget(
                        title: addSuitableTitleForAdText,
                        hintInput: addSuitableTitleForAdHnit,
                        inputType: TextInputType.text,focusNode: adFocusNode,
                        onFieldSubmitted: (value){}),
                  ),
                  // discriptopin the apartment
                  ContainerInputLongTextClassWidget(
                      title: discrptionApartmentText ,
                      hintInput: discrptionApartmentHint,
                      inputType: TextInputType.text,focusNode: discrptionFocusedNode),
                  const AddAcontact()

                ],
              ),
            ),
          ),
      ),
    );
  }
}
