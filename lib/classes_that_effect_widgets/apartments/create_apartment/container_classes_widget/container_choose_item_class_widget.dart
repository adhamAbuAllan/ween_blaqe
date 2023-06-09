import 'package:flutter/material.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/dropdown_classes_widgets/dropdown_cities.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/dropdown_classes_widgets/dropdown_type_of_apartment.dart';
import 'package:ween_blaqe/data_containers/add_ad_data_container.dart';
import 'package:ween_blaqe/styles/text_field_form_style.dart';

import '../../../../api/cities.dart';
class ContainerChooseCityItemClassWidget extends StatefulWidget {
  String title;
   ContainerChooseCityItemClassWidget({Key? key,
     required this.title,
     required this.onSelected
   }) : super(key: key);
  Function(City) onSelected;

  @override
  State<ContainerChooseCityItemClassWidget> createState() => _ContainerChooseCityItemClassWidgetState();
}

class _ContainerChooseCityItemClassWidgetState extends State<ContainerChooseCityItemClassWidget> {
  @override

  @override
  Widget build(BuildContext context) {
    return  Container(
          margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.white70,
          ),
          child: Column(
              children: [
                //
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10,10),
                      child: Text(widget.title,
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: DropDownCity(onSelected:widget.onSelected,)
                ),

              ])
      );
  }
}
class ContainerChooseTypeApartmentItemClassWidget extends StatefulWidget {
  String title;

  ContainerChooseTypeApartmentItemClassWidget({Key? key,
    required this.title,

  }) : super(key: key);
  @override
  _ContainerChooseTypeApartmentItemClassWidgetState createState() => _ContainerChooseTypeApartmentItemClassWidgetState();
}
class _ContainerChooseTypeApartmentItemClassWidgetState extends State<ContainerChooseTypeApartmentItemClassWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white70,
        ),
        child: Column(
            children: [
              //
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10,10),
                    child: Text(widget.title,
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 14,
                        fontFamily: 'IBM',
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: DropDownTypeOfApartment()
              ),

            ])
    );
  }
}
