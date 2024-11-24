import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:ween_blaqe/controller/get_controllers.dart';
import 'package:ween_blaqe/core/widgets/alirt_class_widget.dart';
// import 'package:ween_blaqe/features/user/owner/account_of_owner.dart';
// import 'package:ween_blaqe/features/user/studnet/from_master_home_to_show_more/new_master_home.dart';

import '../../../api/apartments_api/one_apartment.dart';
import '../../../constants/localization.dart';

// import '../../../features/user/owner/apartment_of_owner.dart';

class DeleteButton extends StatelessWidget {
  final void Function()? onPressed;
  final int apartmentId;
  final Apartments apartmentsRes;
  final int index;

  const DeleteButton({
    super.key,
    required this.apartmentId,
    this.onPressed,
    required this.apartmentsRes,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
      ),
      onPressed: () {
        // Call your deleteApartment function here with the apartmentId
        // apiApartmentController.deleteBookmarkedApartment(apartmentId);


        // apiApartmentController.deleteApartmentWithUpdate(widget.apartmentId).then((_) {
        //   // Notify HomeScreen to refresh data
        //   widget.callAPIAndAssignData;
        // });
        AlertWithTwoBtn.show(context, "حذف",
            "حذف شقة ${apartmentsRes.data?[index].title}", "حذف",
            SetLocalization.of(context)!.getTranslateValue("cancel"), () {
              bookmarkController.bookmarks.remove(apartmentId);
              apiApartmentController.deleteApartmentWithUpdate(apartmentId,context);

              // Get.offAll(() => const NewMasterHome());

              Navigator.pop(context);
            });

        // onPressed;
      },
    );
  }
}
