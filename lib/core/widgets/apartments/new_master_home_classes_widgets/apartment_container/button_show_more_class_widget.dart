import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments_api/one_apartment.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';
import 'package:ween_blaqe/features/user/studnet/from_master_home_to_show_more/new_show_more.dart';

class ApartmentShowMoreButton extends StatelessWidget {
 final OneApartment apartmentsRes;
 final int index;

  const ApartmentShowMoreButton({super.key, required this.index, required this.apartmentsRes}

      );

  @override
  Widget build(BuildContext context) {
    return               Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => NewShowMore(
                oneApartment: apartmentsRes.data?[index],
              )));
          // myPushName(context, MyPagesRoutes.showMore);
        },
        style: outlineButton,
        child: const Text(
          " عرض المزيد ",
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'IBM',
          ),
        ),
      ),
    );
  }
}
