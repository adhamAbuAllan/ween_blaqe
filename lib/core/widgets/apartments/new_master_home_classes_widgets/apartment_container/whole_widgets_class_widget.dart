import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/apartments.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/apartment_container/image_of_apartment_class_widget.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/apartment_container/locatoin_text_class_widget.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/apartment_container/price_text_class_widget.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/apartment_container/title_class_widget.dart';
import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/apartment_container/type_text_class_widget.dart';

import '../../../../../features/user/studnet/from_master_home_to_show_more/new_show_more.dart';
import 'apartment_container_class_widget.dart';
// import 'button_show_more_class_widget.dart';

class WholeWidgetOfApartment extends StatefulWidget {
  const WholeWidgetOfApartment({
    super.key,
    required this.index,
    required this.apartmentsRes,
    required this.isDarkMode,
    this.onPressed,
  });

  final Apartments apartmentsRes;
  final int index;
  final bool isDarkMode;
  final void Function()? onPressed;

  @override
  State<WholeWidgetOfApartment> createState() => _WholeWidgetOfApartmentState();
}

class _WholeWidgetOfApartmentState extends State<WholeWidgetOfApartment> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => NewShowMore(
                  oneApartment: widget.apartmentsRes.data?[widget.index],
                )));
      },
      child: ApartmentContainer(
        child: Column(
          children: [
            ApartmentTypeText(
              index: widget.index,
              apartmentsRes: widget.apartmentsRes,
              isDeleteMode: widget.isDarkMode,
              onPressed: widget.onPressed,
            ),
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
              ],
            ),
            Row(
              children: [
                // ApartmentShowMoreButton(
                //   index: widget.index,
                //   apartmentsRes: widget.apartmentsRes,
                // ),
                // const Spacer(),
                ApartmentLocatoinText(
                  index: widget.index,
                  apartmentsRes: widget.apartmentsRes,
                )
              ],
            ),
            ApartmentPriceText(
              index: widget.index,
              apartmentsRes: widget.apartmentsRes,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    "${widget.apartmentsRes.data?[widget.index].timeAgo ?? "التاريخ"} ",
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
