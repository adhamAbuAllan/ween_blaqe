import 'package:flutter/material.dart';
final Widget aline =
Divider(color: Colors.black54,
  height: 2,
  thickness: 1,
);


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
final Widget alineSkeleton = Row(
  children: [
    Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Container(
          color: Colors.black12,
          child: Text("",style: TextStyle(fontSize: 0.5),),
        ),
      ),
    ),
  ],
);
