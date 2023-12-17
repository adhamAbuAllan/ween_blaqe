// import 'package:flutter/material.dart';
//
// import 'package:ween_blaqe/constants/nums.dart';
//
//
//
//
// // List <University>universityItems = [];
// List<String> universityItems = [];
// // University ? currentUniversity;
// String? currentUniversity;
//
// class DropDownUniversity extends StatefulWidget {
//   // University currentValue = currentValue.name ;
//   DropDownUniversity({
//     Key? key,
//     // University ? currentUniversity
//
//     required this.onSelected,
//     required this.currentValue,
//     required this.items,
//   }) : super(key: key);
//   // Function(University) onSelected;
//   final Function(String) onSelected;
//   String? currentValue;
//   List<String>? items;
//   @override
//   State<DropDownUniversity> createState() => _DropDownUniversityState();
// }
//
// class _DropDownUniversityState extends State<DropDownUniversity> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       // await go();
//       // print(currentType?.productName??"");
//       // print(currentArea?.name??"");
//       // focusNodeOfFullName;
//       // FocusScope.of(context).requestFocus();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
//         child: universityItems.isNotEmpty
//             ? DropdownButtonFormField<dynamic>(
//                 // focusNode: focusNode,
//                 style: const TextStyle(fontSize: 16),
//                 // autofocus: true,
//                 decoration: const InputDecoration(
//                   // contentPadding: EdgeInsets.symmetric(vertical: 20),
//                   enabledBorder: OutlineInputBorder(
//                     //<-- SEE HERE
//                     borderSide: BorderSide(color: kPrimaryColor300, width: 0.5),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     //<-- SEE HERE
//                     borderSide: BorderSide(color: kPrimaryColor, width: 1),
//                   ),
//                 ),
//                 value: currentUniversity,
//                 items:
//                     /*
//               be careful don't delete this line
//               --------------------------
//               / universityItems
//               --------------------------
//                */
//
//                     widget.items
//                         ?.map(
//                           (c) => DropdownMenuItem(
//                             value: c,
//                             child: Text(
//                               /*
//               be careful don't delete this line
//               --------------------------
//               c.name,
//               --------------------------
//                */
//                               c,
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey.shade800,
//                                   fontFamily: 'IBM'),
//                             ),
//                           ),
//                         )
//                         .toList(),
//                 onChanged: (i) {
//                   currentUniversity = i;
//                   setState(() {
//                     currentUniversity = i!;
//                     setState(() {
//                       widget.onSelected(currentUniversity!);
//                     });
//                   });
//                 },
//               )
//             : SizedBox(
//                 child: Text("جاري التحميل..",
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey.shade400,
//                         fontFamily: 'IBM')),
//               ));
//   }
//   // go({String? any}) async {
//   //   setState(() {
//   //     universityItems.clear();
//   //   });
//   //   var url = Uri.parse(ServerLocalDiv.university);
//   //   var res = await http.get(url);
//   //   var json = jsonDecode(res.body);
//   //   var data = json["data"] as List<dynamic>;
//   //   universityItems.clear();
//
//   // for (var value in data) {
//   //   universityItems.add(University(id: value['id'], name: value['name']));
//   //   currentUniversity = universityItems.first;
//   //   setState(() {
//   //     if(currentUniversity!=null){
//   //       saveUniversity(currentUniversity!);
//   //
//   //     }});
//   // }
//
//   // }
// }
