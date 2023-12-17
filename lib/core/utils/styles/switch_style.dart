// import 'package:flutter/material.dart';
// import 'package:ween_blaqe/constants/nums.dart';
//
// // class MatiralOfSwitch extends StatelessWidget {
// //   const MatiralOfSwitch({Key? key}) : super(key: key);
// @override
// // Widget build(BuildContext context) {
// //   return MaterialApp(
// //     home: OwnSwitch(),
// //   );
// // }
// // }
// class Switcher extends StatefulWidget {
//    Switcher({super.key,required this.onChanged,required this.light1});
//   void Function(bool)? onChanged;
//    bool light1 = true;
//    @override
//   State<Switcher> createState() => _SwitcherState();
//
// }
//
// class _SwitcherState extends State<Switcher> {
//   // bool light0 = true;
//   // bool light2 = true;
//   late final MaterialStateProperty<Icon?> thumbIcon ;
//   @override
//   void initState() {
//     super.initState();
//     thumbIcon = materialStateProperty();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Switch(
//       activeColor: kPrimaryColor,
//       thumbIcon: thumbIcon,
//       value: widget.light1,
//       onChanged: widget.onChanged,
//     );
//   }
//
//   void onChanged(bool value) {
//       setState(() {
//         widget.light1 = value;
//         // value ==
//             // false
//             // ? toast("تم كتم الاشعارات")
//             // : toast("تم تفعيل الاشعارات");
//       });
//     }
//   MaterialStateProperty<Icon?> materialStateProperty() {
//     return MaterialStateProperty.resolveWith<Icon?>(
//           (Set<MaterialState> states) {
//         // Thumb icon when the switch is selected.
//         if (states.contains(MaterialState.selected)) {
//           return const Icon(Icons.check);
//
//         }
//         return const Icon(Icons.close);
//       },
//     );
//   }
//
// }
