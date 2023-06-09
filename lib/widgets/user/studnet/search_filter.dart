import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/container_input_text_class_widget.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/search_filter_classes_widget/search_filter_price_class_widget.dart';

import '../../../classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/add_advantages_container_class_widget.dart';
import '../../../classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/container_choose_item_class_widget.dart';
import '../../../styles/button.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({Key? key}) : super(key: key);

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  @override
  Widget build(BuildContext context) {
    //data of price box
    var titleOfPrice = "الإجرة";
    var subtitleofPrice = "شيكل شهري";
    //data of city box
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
    //data of room box
    String choose_count_rooms_text = "عدد الغرف";
    String hint_count_rooms = "0";
    TextInputType number = TextInputType.number;
    //data of bathrooms box
    String choose_count_bathrooms_text = "عدد الحمامات";
    String hint_count_bathrooms = "0";
    //data of acount of studnets box
    var countStudentText = "حدد عدد الطلاب المسموح به";
    var countStudentHint = "0";
    //square meters of apartment box
    var squareText = "حدد حجم الشقة";
    var squareHint = "يرجى إدخال حجم الشقة بالمتر مربع";
    int city_id = 0;

    return ColorfulSafeArea(
      color: Colors.orange,

      child: Scaffold(

        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed:(){},
                style: fullButton,
                child: const Text("حفظ"),
              ),
            ),
            const Expanded(child: Text("")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: (){},
                style: outlineButton,
                child: const Text(" مسح الكل "),
              ),
            ),


          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 20, 30),
                    child: Text(
                      "تصفية",
                      style: TextStyle(
                        fontSize: 26.0,
                        fontFamily: 'IBM',
                        inherit: true,
                      ),
                    ),
                  ),
                  Expanded(child: Text("")),
                ],
              ),
          PriceOfSearchFilterClassWidget(title: titleOfPrice,
            subtitle: subtitleofPrice,
            inputType: TextInputType.number,
            highLabelName: "الادنى",
            textInputType: TextInputType.number,
            fontSize: 16,
            lowLabelName: "الأعلى",),
              const SizedBox(height: 10,),
              //city box
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: ContainerChooseCityItemClassWidget(
                  title: city_box_title,
                  onSelected: (c){
                    city_id = c.id;
                  },

                ),
              ),
              //rooms box
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: ContainerInputTextClassWidget(
                    title: choose_count_rooms_text,
                    hintInput: hint_count_rooms,
                    inputType: number,
                    // focusNode: count_roomsFocusNode,
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
                    // focusNode: count_bathroomsFocusNode,
                    onFieldSubmitted: (value){}
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
                padding: const EdgeInsets.fromLTRB(10, 2, 10, 10),
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
                            "المزايا",
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
                    const AddAdvantages()
                  ],
                ),
              ),
              //countStudent padding
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: ContainerInputTextClassWidget(title: countStudentText,
                    hintInput: countStudentHint,
                    inputType: TextInputType.number,
                    // focusNode: countStudentFocusNode,
                    onFieldSubmitted: (value){}),
              ),
              //square padding
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: ContainerInputTextClassWidget(title: squareText,
                    hintInput: squareHint,
                    inputType: TextInputType.number,
                    // focusNode: squareFocusNode,
                    onFieldSubmitted: (value){}),
              ),





            ],
          ),
        ),
      ),
    );
  }
}
