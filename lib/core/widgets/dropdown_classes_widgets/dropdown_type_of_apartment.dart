// import 'package:flutter/material.dart';
// import '../../../api/type_of_apartment.dart';
// class DropDownTypeOfApartment extends StatefulWidget {
//   const DropDownTypeOfApartment({Key? key,
//   }) : super(key: key);
//   @override
//   State<DropDownTypeOfApartment> createState() => _DropDownTypeOfApartmentState();
// }
// class _DropDownTypeOfApartmentState extends State<DropDownTypeOfApartment> {
//   @override
//   Widget build(BuildContext context) {
//     return
//       SizedBox(
//         width : double.infinity,
//         child: Padding(
//             padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
//             child:typeOfApartmentItems.isNotEmpty
//                 ?
//             DropdownButtonFormField<dynamic>(
//               // focusNode: focusNode,
//               style: const TextStyle(fontSize:14 ),
//               // autofocus: true,
//               decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                   //<-- SEE HERE
//                   borderSide:
//                   BorderSide(color: Colors.orange.shade300, width: 0.5),
//                 ),
//                 focusedBorder: const OutlineInputBorder(
//                   //<-- SEE HERE
//                   borderSide: BorderSide(color: Colors.orange, width: 1),
//                 ),
//               ),
//               value: currentType,
//               items:typeOfApartmentItems
//                   .map((c)=> DropdownMenuItem(value:c,child: Text(c.name,
//                 style: const TextStyle(fontSize: 14,
//                     color: Colors.black54,
//                     fontFamily: 'IBM'
//                 ),),),).toList(),
//               onChanged: (i){
//                 setState(() {
//                   currentType = i!;
//                   if(currentType!=null){
//
//                     // currentCity!.id = AddAdDataContainer.currentCityId!.id;
//                     // currentType!.id = AddAdDataContainer.typOfApartmentId!.id;
//                   }else{
//                     // currentCity?.id = 0;
//                   }
//
//                 });
//               },
//             )
//                 :
//             SizedBox(child: Text("جاري التحميل..",
//                 style: TextStyle(fontSize: 12,
//                     color: Colors.grey.shade400,
//                     fontFamily: 'IBM'
//                 )
//             ),)
//         ),
//       );
//   }
// }