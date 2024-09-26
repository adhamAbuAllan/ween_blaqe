import 'package:flutter/material.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
// import 'package:ween_blaqe/constants/strings.dart';
// import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';

import '../../../../../api/apartments_api/one_apartment.dart';
import '../../../../../constants/nums.dart';
import '../../../../../features/user/owner/refactor_apartment.dart';

class EditButtonClassWdiget extends StatelessWidget {
  const EditButtonClassWdiget({
    super.key,
    required this.apartmentsRes,
    required this.apartmentId,
  });

  final OneApartment apartmentsRes;
  final int apartmentId;


  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,

      icon: Icon(Icons.edit,
          color: themeMode.isDark
              ? kTextColorLightMode
              : kTextColorDarkMode), // Adjust colors based on theme
      onPressed: () {
        imagesModelController.imageFiles?.clear();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => RefactorApartment(
              oneApartment: apartmentsRes.data?[apartmentId],
            )));
        debugPrint("apartment id is : --$apartmentId");
        },
    );
  }
}
