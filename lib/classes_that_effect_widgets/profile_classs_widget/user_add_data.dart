// import 'package:flutter/material.dart';
//
// import '../../styles/text_style/aline_style.dart';
// class UserAddData extends StatelessWidget {
//   String title;
//   const UserAddData({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             const Padding(
//               padding: EdgeInsets.fromLTRB(0, 0, 10,0),
//             ),
//             //about user text
//             const Text("نبذة عني"
//               ,style: TextStyle(
//                 fontSize: 18,
//                 fontFamily: 'IBM',
//               ),
//             ),
//             const Expanded(child: SizedBox()),
//             //add TextButton
//             Padding(
//
//               padding: const EdgeInsets.fromLTRB(10, 0, 0,0),
//               child:  TextButton(
//
//                 child:const Text("إضافة",
//                   style: TextStyle( color: Colors.black,
//                     decoration: TextDecoration.underline,
//                     fontFamily: 'IBM',
//                   ),),
//                 onPressed: (){
//                   toggle();
//                 },
//
//               ),
//
//             )
//           ],
//         ),
//         //input something about your self text
//         Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.fromLTRB(210, 0, 10, 10),
//               child: Visibility(
//                 visible: !_visible,
//                 child: const Text("أدخل شيئًا عن نفسك"
//                     ,style: TextStyle(
//                       fontSize: 16,
//                       fontFamily: 'IBM',
//                     )
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(210, 0, 10, 10),
//               child: Visibility(
//                 visible: _visible,
//                 child: TextFormField(
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontFamily: 'IBM',
//                   ),
//                   decoration: InputDecoration(
//                       border: InputBorder.none,
//                       focusedBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(
//                           width: 1,
//                           color: Colors.orange,
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             width: 0.5,
//                             color: Colors.orange.shade300,
//                           ),
//                           borderRadius: BorderRadius.circular(7))
//                   ),
//
//
//                 ),
//
//               ),
//             ),
//
//           ],
//         ),
//         aline,
//       ],
//     );
//   }
// }
