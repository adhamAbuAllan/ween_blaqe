// import 'package:flutter/material.dart';
// import 'package:ween_blaqe/api/apartments_api/apartments.dart';
// import 'package:ween_blaqe/constants/nums.dart';
// import 'package:ween_blaqe/controller/get_controllers.dart';
// import 'package:ween_blaqe/controller/provider_controllers/providers/apartment_provider.dart';
// import 'package:ween_blaqe/core/widgets/apartments/new_master_home_classes_widgets/apartment_container/edit_button_class_wdiget.dart';
//
// import '../../../buttons/delete_button.dart';
// import 'bookmark_button_class_widget.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// class ApartmentTypeTextWidget extends ConsumerStatefulWidget {
//   const ApartmentTypeTextWidget({super.key,      required this.index,
//     required this.apartmentsRes,
//     required this.isDeleteMode,
//     this.onPressed,});
//   final Apartments apartmentsRes;
//   final int index;
//   final bool isDeleteMode;
//   final void Function()? onPressed;
//   @override
//   ConsumerState createState() => _ApartmentTypeTextConsumerState();
// }
//
// class _ApartmentTypeTextConsumerState extends ConsumerState<ApartmentTypeTextWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child: Text(
//             " سكن ${widget.apartmentsRes.data?[widget.index].type?.name ?? ""}",
//             style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//
//                 color: themeMode.isLight
//                     ? kTextColorLightMode
//                     : kTextColorDarkMode),
//           ),
//         ),
//         const Expanded(child: Text("")),
//         if (widget.isDeleteMode)
//           DeleteButtonWidget(
//             apartmentId: widget.apartmentsRes.data?[widget.index].id ?? 0,
//             onPressed: widget.onPressed,
//             apartmentsRes: widget.apartmentsRes,
//             index: widget.index,
//           )
//         else if (
//         ref.watch(isEditModeNotifier)
//         )
//           RefactorButtonClassWdiget(apartmentsRes: widget.apartmentsRes,apartmentId:
//           widget.index,)
//         else if (ref.watch(isDeleteModeNotifier) == false &&
//               ref.watch(isEditModeNotifier) ==
//                   false)
//             BookmarkButtonWidget(apartmentId: widget.apartmentsRes
//                 .data?[widget.index].id
//                 ?? 0),
//       ],
//     );
//   }
// }
//
// class ApartmentTypeTextWidget extends StatelessWidget {
//   const ApartmentTypeTextWidget(
//       {super.key,
//       required this.index,
//       required this.apartmentsRes,
//       required this.isDeleteMode,
//       this.onPressed,
//       });
//
//   final Apartments apartmentsRes;
//   final int index;
//   final bool isDeleteMode;
//   final void Function()? onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child: Text(
//             " سكن ${apartmentsRes.data?[index].type?.name ?? ""}",
//             style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//
//                 color: themeMode.isLight
//                     ? kTextColorLightMode
//                     : kTextColorDarkMode),
//           ),
//         ),
//         const Expanded(child: Text("")),
//         if (isDeleteMode)
//           DeleteButtonWidget(
//             apartmentId: apartmentsRes.data?[index].id ?? 0,
//             onPressed: onPressed,
//             apartmentsRes: apartmentsRes,
//             index: index,
//           )
//         else if (apiApartmentController.isEditMode.value)
//            EditButtonClassWdiget(apartmentsRes: apartmentsRes,apartmentId:
//            index,)
//         else if (apiApartmentController.isDeleteMode.value == false &&
//           apiApartmentController
//               .isEditMode
//               .value ==
//               false)
//           BookmarkButtonWidget(apartmentId: apartmentsRes.data?[index].id ?? 0),
//       ],
//     );
//   }
// }
