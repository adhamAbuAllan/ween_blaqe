import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/apartment_container/image_of_apartment_class_widget.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/apartment_container/locatoin_text_class_widget.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/apartment_container/price_text_class_widget.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/apartment_container/title_class_widget.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/apartment_container/type_text_class_widget.dart';

import 'apartment_container_class_widget.dart';
import 'button_show_more_class_widget.dart';

class WholeWidgetOfApartment extends StatefulWidget {
  const WholeWidgetOfApartment(
      {super.key, required this.index, required this.apartmentsRes});

  final OneApartment apartmentsRes;
  final int index;

  @override
  State<WholeWidgetOfApartment> createState() => _WholeWidgetOfApartmentState();
}

class _WholeWidgetOfApartmentState extends State<WholeWidgetOfApartment> {
  @override
  Widget build(BuildContext context) {
    return ApartmentContainer(
      child: Column(
        children: [
          ApartmentTypeText(
              index: widget.index, apartmentsRes: widget.apartmentsRes),
          ApartmentMainImage(
            index: widget.index,
            apartmentsRes: widget.apartmentsRes,
          ),
          Row(
            children: [
              ApartmentTitleText(
                index: widget.index,
                apartmentsRes: widget.apartmentsRes,
              ),
              const Spacer(),
              ApartmentPriceText(
                index: widget.index,
                apartmentsRes: widget.apartmentsRes,
              )
            ],
          ),
          Row(
            children: [
              ApartmentShowMoreButton(
                index: widget.index,
                apartmentsRes: widget.apartmentsRes,
              ),
              const Spacer(),
              ApartmentLocatoinText(
                index: widget.index,
                apartmentsRes: widget.apartmentsRes,
              )
            ],
          ),
        ],
      ),
    );
  }
}