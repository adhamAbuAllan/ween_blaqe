import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';

class Aline extends StatelessWidget {
  const Aline({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
     color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
     height: 1,
     thickness: .5,
    );
  }
}

// Row(
//   children: [
//     Expanded(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//         child: Container(
//           color: Colors.black54,
//           child: Text("",style: TextStyle(fontSize: 1),),
//         ),
//       ),
//     ),
//   ],
// );
// final Widget alineSkeleton = Row(
//   children: [
//     Expanded(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//         child: Container(
//           color: Colors.black12,
//           child: const Text(
//             "",
//             style: TextStyle(fontSize: 0.5),
//           ),
//         ),
//       ),
//     ),
//   ],
// );
