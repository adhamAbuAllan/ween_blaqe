// import 'package:flutter/material.dart';

// import 'package:ween_blaqe/constants/nums.dart';

// import '../../../constants/coordination.dart';
// import '../../../constants/get_it_controller.dart';

// @immutable
// class DropDownTypeOfUser extends StatefulWidget {
// // static TypeOfUser? currentValue = currentType;
// // static bool ?testing = visible;
//   DropDownTypeOfUser({
//     Key? key,
//     required this.onSelected,
//     required this.typeOfUserItems,
//     required this.currentType,
//     this.visible,
//     // this.test
//   }) : super(key: key);
//   final Function(String)? onSelected;
//  final List<String> typeOfUserItems = [];
//   final String? currentType;
//   final bool? visible = false;

//  final bool? test;

//   @override
//   State<DropDownTypeOfUser> createState() => _DropDownTypeOfUserState();
// }

// class _DropDownTypeOfUserState extends State<DropDownTypeOfUser> {
//   // get kPrimaryColor300 => null;

//   @override
//   void initState() {
//     // DropDownTypeOfUser.currentValue?.id;
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       // await go();
//       // print(currentType?.productName??"");
//       // print(currentArea?.name??"");
//       // focusNodeOfFullName;
//       // FocusScope.of(context).requestFocus();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // var currentType = widget.currentType;

//     return Padding(
//         padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//         child: widget.typeOfUserItems.isNotEmpty
//             ? DropdownButtonFormField<dynamic>(
//                 dropdownColor: themeMode.isLight
//                     ? kContainerColorLightMode
//                     : kContainerColorDarkMode,

//                 // focusNode: focusNode,
//                 style: const TextStyle(fontSize: 14),
//                 // autofocus: true,
//                 decoration: InputDecoration(
//                     contentPadding:  EdgeInsets.symmetric(vertical:
//                     getIt<AppDimension>().isSmallScreen(context) ? 20/2 : 20,
//                         horizontal: 10),
//                   enabledBorder: OutlineInputBorder(
//                     //<-- SEE HERE
//                     borderSide: BorderSide(
//                         color: themeMode.isLight
//                             ? kPrimaryColor300LightMode
//                             : kPrimaryColor300DarkMode,
//                         width: 0.5),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     //<-- SEE HERE
//                     borderSide: BorderSide(
//                         color: themeMode.isLight
//                             ? kPrimaryColorLightMode
//                             : kPrimaryColorDarkMode,
//                         width: 1),
//                   ),
//                 ),
//                 value: widget.currentType,

//                 items: widget.typeOfUserItems
//                     //be careful don't delete this line
//                     // widget. typeOfUserItems

//                     .map(
//                       (c) => DropdownMenuItem(
//                         value: c,
//                         child: Text(
//                           c,
//                           // c.name,
//                           style: TextStyle(
//                               fontSize: 15.0,
//                               color: themeMode.isLight
//                                   ? kTextColorLightMode
//                                   : kTextColorDarkMode,
//                               fontFamily: 'IBM'),
//                         ),
//                       ),
//                     )
//                     .toList(),
//                 onChanged: (i) {
//                   setState(() {
//                     widget.currentType = i!;
//                     setState(() {
//                       widget.visible;
//                       widget.onSelected!(widget.currentType!);

//                       // widget.onSelected!( widget.currentType!);
//                     });
//                     // visible = !visible;
//                     // print(widget.visible);
//                   });
//                 },
//               )
//             : SizedBox(
//                 child: Text("جاري التحميل..",
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: themeMode.isLight
//                             ? kTextColorLightMode
//                             : kTextColorDarkMode,
//                         fontFamily: 'IBM')),
//               ));
//   }
// //be careful!!
// //Don't delete this function anytime
// // go() async {
// //   setState(() {
// //     widget.typeOfUserItems.clear();
// //   });
// //   var url = Uri.parse(ServerLocalDiv.typeUser);
// //   var res = await http.get(url);
// //   var json = jsonDecode(res.body);
// //   var data = json["data"] as List<dynamic>;
// //   widget.typeOfUserItems.clear();
// //   for (var value in data) {
// //     widget.typeOfUserItems
// //         .add(TypeOfUser(id: value['id'], name: value['name']));
// //     widget.currentType = widget. typeOfUserItems.first;
// //     // widget.test = !visible;
// //     setState(() {
// //       if ( widget.currentType!= null) {
// //         saveTypeOfUser( widget.currentType!);
// //       }});
// //   }
// //
// // }
// }
