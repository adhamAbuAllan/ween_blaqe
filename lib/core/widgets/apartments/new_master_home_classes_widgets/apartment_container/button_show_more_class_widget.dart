import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
// import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/features/user/studnet/from_master_home_to_show_more/new_show_more.dart';

import '../../../../../constants/nums.dart';

// class ApartmentShowMoreButton extends StatefulWidget {
//   final OneApartment apartmentsRes;
//   final int index;
//
//   const ApartmentShowMoreButton(
//       {super.key, required this.index, required this.apartmentsRes});
//
//   @override
//   State<ApartmentShowMoreButton> createState() =>
//       _ApartmentShowMoreButtonState();
// }

class _ApartmentShowMoreButtonState extends State<ApartmentShowMoreButton> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  NewShowMore(
                    oneApartment: widget.apartmentsRes.data?[widget.index],
                    // onPageChanged:   (index, p1) {
                    //     imageOfApartmentController.currentPhotoIndex.value = index;
                    //     imageOfApartmentController.carouselSliderController.animateToPage(
                    //       imageOfApartmentController.currentPhotoIndex.value,
                    //       duration: const Duration(
                    //         milliseconds: 300,
                    //       ),
                    //     );
                    //   },
                  )));
          // myPushName(context, MyPagesRoutes.showMore);
        },
        style: outlinedButton(themeMode: themeMode, context: context),
        child: const Text(
          " عرض المزيد ",
          style: TextStyle(
            fontSize: 14,
            
          ),
        ),
      ),
    );
  }
}
