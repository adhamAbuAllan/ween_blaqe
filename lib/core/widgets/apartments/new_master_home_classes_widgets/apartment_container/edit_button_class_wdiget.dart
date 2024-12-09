// import 'package:flutter/material.dart';
// import 'package:ween_blaqe/controller/get_controllers.dart';
//
// // import 'package:ween_blaqe/constants/strings.dart';
// // import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
//
// import '../../../../../api/apartments_api/apartments.dart';
// import '../../../../../constants/nums.dart';
// import '../../../../../features/user/owner/update_apartment_notifier.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// class RefactorButtonClassWdiget extends ConsumerStatefulWidget {
//   const RefactorButtonClassWdiget({
//     super.key,
//     required this.apartmentsRes,
//     required this.apartmentId,
//   });
//
//   final Apartments apartmentsRes;
//   final int apartmentId;
//
//   @override
//   ConsumerState createState() => _EditButtonClassWidgetConsumerState();
// }
//
// class _EditButtonClassWidgetConsumerState
//     extends ConsumerState<RefactorButtonClassWdiget> {
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       splashColor: Colors.transparent,
//
//       icon: Icon(Icons.edit,
//           color: themeMode.isLight
//               ? kTextColorLightMode
//               : kTextColorDarkMode), // Adjust colors based on theme
//       onPressed: () {
//         imagesModelController.imageFiles?.clear();
//         Navigator.of(context).push(MaterialPageRoute(
//             builder: (BuildContext context) => RefactorApartment(
//               oneApartment: widget.apartmentsRes.data?[widget.apartmentId],
//             )));
//         debugPrint("apartment id is : --$widget.apartmentId");
//       },
//     );
//   }
// }

// class EditButtonClassWdiget extends StatelessWidget {
//   const EditButtonClassWdiget({
//     super.key,
//     required this.apartmentsRes,
//     required this.apartmentId,
//   });
//
//   final Apartments apartmentsRes;
//   final int apartmentId;
//
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       splashColor: Colors.transparent,
//
//       icon: Icon(Icons.edit,
//           color: themeMode.isLight
//               ? kTextColorLightMode
//               : kTextColorDarkMode), // Adjust colors based on theme
//       onPressed: () {
//         imagesModelController.imageFiles?.clear();
//         Navigator.of(context).push(MaterialPageRoute(
//             builder: (BuildContext context) => RefactorApartment(
//                   oneApartment: apartmentsRes.data?[apartmentId],
//                 )));
//         debugPrint("apartment id is : --$apartmentId");
//       },
//     );
//   }
// }
