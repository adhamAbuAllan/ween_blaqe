// import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:get/get_core/src/get_main.dart';
// import 'package:ween_blaqe/controller/get_controllers.dart';
// import 'package:ween_blaqe/core/widgets/alirt_class_widget.dart';
// // import 'package:ween_blaqe/view/user/owner/account_of_owner.dart';
// // import 'package:ween_blaqe/view/user/studnet/from_master_home_to_show_more/new_master_home.dart';
//
// import '../../../api/apartments_api/apartments.dart';
// import '../../../constants/localization.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import '../../../view/user/owner/apartment_of_owner.dart';
// class DeleteButtonWidget extends ConsumerStatefulWidget {
//   const DeleteButtonWidget({super.key,required this.apartmentId,
//     this.onPressed,
//     required this.apartmentsRes,
//     required this.index,});
//   final void Function()? onPressed;
//   final int apartmentId;
//   final Apartments apartmentsRes;
//   final int index;
//   @override
//   ConsumerState createState() => _DeleteButtonConsumerState();
// }
//
// class _DeleteButtonConsumerState extends ConsumerState<DeleteButtonWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: const Icon(
//         Icons.delete,
//         color: Colors.red,
//       ),
//       onPressed: () {
//         // Call your deleteApartment function here with the apartmentId
//         // apiApartmentController.deleteBookmarkedApartment(apartmentId);
//
//
//         // apiApartmentController.deleteApartmentWithUpdate(widget.apartmentId).then((_) {
//         //   // Notify HomeScreen to refresh data
//         //   widget.callAPIAndAssignData;
//         // });
//         AlertWithTwoBtn.show(context, "حذف",
//             "حذف شقة ${widget.apartmentsRes.data?[widget.index].title}", "حذف",
//             SetLocalization.of(context)!.getTranslateValue("cancel"), () {
//               bookmarkController.bookmarks.remove(widget.apartmentId);
//               apiApartmentController.deleteApartmentWithUpdate
//                 (widget.apartmentId,
//                   context);
//
//               // Get.offAll(() => const NewMasterHome());
//
//               Navigator.pop(context);
//             });
//
//         // onPressed;
//       },
//     );
//   }
// }

// class DeleteButtonWidget extends StatelessWidget {
//   final void Function()? onPressed;
//   final int apartmentId;
//   final Apartments apartmentsRes;
//   final int index;
//
//   const DeleteButtonWidget({
//     super.key,
//     required this.apartmentId,
//     this.onPressed,
//     required this.apartmentsRes,
//     required this.index,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: const Icon(
//         Icons.delete,
//         color: Colors.red,
//       ),
//       onPressed: () {
//         // Call your deleteApartment function here with the apartmentId
//         // apiApartmentController.deleteBookmarkedApartment(apartmentId);
//
//
//         // apiApartmentController.deleteApartmentWithUpdate(widget.apartmentId).then((_) {
//         //   // Notify HomeScreen to refresh data
//         //   widget.callAPIAndAssignData;
//         // });
//         AlertWithTwoBtn.show(context, "حذف",
//             "حذف شقة ${apartmentsRes.data?[index].title}", "حذف",
//             SetLocalization.of(context)!.getTranslateValue("cancel"), () {
//               bookmarkController.bookmarks.remove(apartmentId);
//               apiApartmentController.deleteApartmentWithUpdate(apartmentId,context);
//
//               // Get.offAll(() => const NewMasterHome());
//
//               Navigator.pop(context);
//             });
//
//         // onPressed;
//       },
//     );
//   }
// }
