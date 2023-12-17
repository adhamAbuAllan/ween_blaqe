// import 'package:colorful_safe_area/colorful_safe_area.dart';
// import 'package:flutter/material.dart';
// // ignore: duplicate_import
// import '../../../api/apartments_api/one_apartment.dart';
// import '../../../api/users.dart';
// import 'package:ween_blaqe/constants/nums.dart';
// import '../../../core/widgets/profile_classs_widget/data_of_owner.dart';
// import '../../../core/widgets/profile_classs_widget/profile_image.dart';
// class ProfileOfOwner extends StatefulWidget {
//   const ProfileOfOwner({Key? key, this.userInfo, this.apartments}) : super(key: key);
//   final User ? userInfo;
//   final DataOfOneApartment ? apartments;
//   @override
//   State<ProfileOfOwner> createState() => _ProfileOfOwnerState();
// }
//
// class _ProfileOfOwnerState extends State<ProfileOfOwner> {
//   var image = "https://robohash.org/hicveldicta.png/";
//   // var name =;
//
//   var titleOfAdcount = "عدد الإعلانات التي قمت بنشرها";
//   // var countOfAd = 0;
//   var titleOfacseptOreer = "عدد قبول طلبات الحجز ";
//   var titleOfdisaccsecptOfOrder = "عدد رفض طلبات الحجز";
//   var countOfOrders = " عدد طلبات الحجز";
//   // var joinDate = "2020/3/3";
//   var countOfApartmentsOfOwner = 0;
//   Future<int> countOfApartmentOfOwner(OneApartment apartments)async{
//     var apartmentOfOwner = widget.apartments?.id;
//     for(var i = 0; i < apartments.data!.length; ){
//       if( apartmentOfOwner == apartments.data!.first.id){
//         countOfApartmentsOfOwner += 1;
//         i++;
//       }
//       return countOfApartmentsOfOwner;
//     }
//     return 0;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ColorfulSafeArea(
//       bottomColor: Colors.transparent ,
//       color: kPrimaryColor,
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade200,
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
//                     child: IconButton(
//                         onPressed: () {
//                           Navigator.of(context).pop(context);
//                         },
//                         icon: const Icon(
//                           Icons.arrow_back_ios,
//                           color: Colors.black87,
//                         )),
//                   ),
//                   const Expanded(child: Text(""))
//                 ],
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               ProfileImage(image: image, name:  widget.userInfo!.name, dateOfJoin:widget.userInfo?.createdAt ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
//                 // height: 140,
//                 padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(7),
//                   color: kContainerColor,
//                 ),
//
//                 child: Column(mainAxisSize: MainAxisSize.min, children: [
//                   DataOfOnwer(
//                     title: titleOfAdcount,
//                     number: countOfApartmentsOfOwner,
//                   ),
//                   DataOfOnwer(
//                     title: titleOfacseptOreer,
//                     number: 8,
//                   ),
//                   DataOfOnwer(
//                     title: titleOfdisaccsecptOfOrder,
//                     number: 4,
//                   ),
//                   DataOfOnwer(
//                     title: countOfOrders,
//                     number: 10,
//                   ),
//                 ]),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
