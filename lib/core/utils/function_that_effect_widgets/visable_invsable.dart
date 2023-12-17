// import 'package:flutter/material.dart';
// class VisibilityInVisibility extends StatefulWidget {
//   final Function toggle;
//   const VisibilityInVisibility({
//     Key? key,
//     required this.toggle,
//   }) : super(key: key);
//
//   @override
//   State<VisibilityInVisibility> createState() => _VisibilityInVisibilityState();
// }
//
// class _VisibilityInVisibilityState extends State<VisibilityInVisibility> {
//   void toggle(bool visibility) {
//     setState(() {
//       visibility = !visibility;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
//
// class Password extends StatefulWidget {
//   const Password({Key? key}) : super(key: key);
//
//   @override
//   State<Password> createState() => _PasswordState();
// }
//
// class _PasswordState extends State<Password> {
//   IconData invisibleIc = Icons.visibility_off;
//   IconData visibleIc = Icons.visibility;
//   IconData c = Icons.visibility_off;
//   bool visible = false;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.green,
//       height: 60,
//       width: MediaQuery.of(context).size.width,
//       child: Row(
//         children: [
//           Expanded(
//             child: TextFormField(
//               obscureText: visible,
//               decoration: const InputDecoration(),
//             ),
//           ),
//           IconButton(
//               onPressed: () {
//                 if (c == Icons.visibility_off) {
//                   setState(() {
//                     visible = true;
//                     c = Icons.visibility;
//                   });
//                 } else {
//                   setState(() {
//                     visible = false;
//                     c = Icons.visibility_off;
//                   });
//                 }
//               },
//               icon: Icon(
//                 c,
//               ))
//         ],
//       ),
//     );
//   }
// }
