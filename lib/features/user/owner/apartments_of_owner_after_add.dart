// import 'package:colorful_safe_area/colorful_safe_area.dart';
// import 'package:flutter/material.dart';
// import '../../../core/widgets/your_apartment_class_widget/your_apartment_class_widget.dart';
// import '../../../data_containers/add_ad_data_container.dart';
// import 'package:ween_blaqe/constants/nums.dart';
// class ApartmentsOfOwnerAfterAdd extends StatelessWidget {
//
//
//   const ApartmentsOfOwnerAfterAdd({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var title = AddAdDataContainer.title;
//     var location = AddAdDataContainer.address;
//     var price = AddAdDataContainer.price ?? 0;
//     var image = "assets/images/apartments_images/image1.png";
//     var booking = "غير محجوز";
//     var yourAparmtent = YourApartmentClassWidget(
//         title: title ?? "",
//         image: image,
//         price: price,
//         booking: booking,
//         location: location ?? "");
//
//     return ColorfulSafeArea(
// bottomColor: Colors.transparent ,
//       color: kPrimaryColor,
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade200,
//         body: Column(
//           children: [
//             //title
//             const Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
//                   child: Text(
//                     "شققك",
//                     style: TextStyle(
//                       fontSize: 28.0,
//                       
//                       inherit: true,
//                     ),
//                   ),
//                 ),
//                 Expanded(child: Text(''))
//               ],
//             ),
//             //subtitle of title
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(90, 0, 10, 55),
//                   child: Text(
//                     "الشقق التي قمت بإضفتها",
//
//                     style: TextStyle(
//                       color: Colors.grey.shade600,
//                       
//                       fontSize: 14,
//                     ),
//                   ),
//                 ),
//                 const Expanded(child: Text(""))
//               ],
//             ),
//             yourAparmtent,
//           ],
//         ),
//       ),
//     );
//   }
// }
