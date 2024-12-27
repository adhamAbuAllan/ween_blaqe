import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/alert_provider.dart';
import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';

// import 'package:ween_blaqe/features/user/owner/account_of_owner.dart';
// import 'package:ween_blaqe/features/user/studnet/from_master_home_to_show_more/new_master_home.dart';

import '../../../../../api/apartments_api/apartments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/localization.dart';
import '../../../../../controller/provider_controllers/providers/color_provider.dart';

// import '../../../features/user/owner/apartment_of_owner.dart';
class DeleteButtonWidget extends ConsumerStatefulWidget {
  const DeleteButtonWidget({
    super.key,
    required this.apartmentId,
    this.onPressed,
    required this.apartmentsRes,
    required this.index,
  });

  final void Function()? onPressed;
  final int apartmentId;
  final Apartments apartmentsRes;
  final int index;

  @override
  ConsumerState createState() => _DeleteButtonConsumerState();
}

class _DeleteButtonConsumerState extends ConsumerState<DeleteButtonWidget> {
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
// title , message , two buttons -> cancel btn , and delete button
        ref.read(alertNotifier.notifier).alertWithTwoBtn(
            textColor:
            ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
            borderColor: ref
                .read(themeModeNotifier.notifier)
                .primaryTheme(ref: ref),
            containerColor: ref
                .read(themeModeNotifier.notifier)
                .containerTheme(ref: ref),
            context: context,
            title: SetLocalization.of(context)!.getTranslateValue("delete"),
            message:
                "${SetLocalization.of(context)!.getTranslateValue("deleteApartment")} "
                "${widget.apartmentsRes.data?[widget.index].title}",
            textOfOkButton:
                SetLocalization.of(context)!.getTranslateValue("delete"),
            textOfCancelButton:
                SetLocalization.of(context)!.getTranslateValue("cancel"),
            onClickOkBtn: () {
              ref
                  .read(deleteApartmentNotifier.notifier)
                  .deleteApartmentWithUpdate(widget.apartmentId, ref);

              ref.read(bookmarkNotifier).bookmarkIds.remove(widget.apartmentId);
              ref
                  .read(fetchApartmentNotifier.notifier)
                  .fetchApartments(isOwnerApartments: true, );

              Navigator.pop(context);
              // ref.read(isDeletedNotifier.notifier).state = false;
            });
        // AlertWithTwoBtn.show(context, "حذف",
        //     "حذف شقة ${widget.apartmentsRes.data?[widget.index].title}", "حذف",
        //     SetLocalization.of(context)!.getTranslateValue("cancel"), () {
        //       bookmarkController.bookmarks.remove(widget.apartmentId);
        //       apiApartmentController.deleteApartmentWithUpdate
        //         (widget.apartmentId,
        //           context);
        // Get.offAll(() => const NewMasterHome());

        //   Navigator.pop(context);
        // });

        // onPressed;
      },
    );
  }
}
