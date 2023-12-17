import 'package:flutter/material.dart';
Widget buttonAccount(Function onClick, Icon icon, String title, {Color ? color}) {
  return ListTile(
    onTap: () {
      onClick.call();
    },
     splashColor: Colors.grey,
    // minVerticalPadding: ,

    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    // leading: icon ,
    leading: icon,
    title: Text(
      title,
      style: const TextStyle(
          fontSize: 16, fontFamily: 'IBM', color: Colors.black87),
    ),
    trailing: const Icon(Icons.arrow_forward_ios_rounded),
  );
  // return Padding(
  //   padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
  //   child: GestureDetector(
  //     onTap: (){
  //       onClick();
  //     },
  //       child:Row(children: [
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(0, 0, 10,0),
  //           child:icon,
  //         ),
  //         Text(title
  //           ,style: const TextStyle(
  //               fontSize: 18,
  //               fontFamily: 'IBM',
  //               color:Colors.black87
  //           ),
  //         ),
  //         const Expanded(child: SizedBox()),
  //         const Padding(
  //           padding: EdgeInsets.fromLTRB(10, 0, 0,0),
  //           child:  Icon(Icons.arrow_forward_ios_rounded,
  //             color: Colors.black87,),
  //
  //         )
  //       ],),
  //
  //
  //   ),
  // );
}

Widget askForHelpButton(Function onClick, String title) {
  return ListTile(
    onTap: () {
      onClick.call();
    },
    // minVerticalPadding: ,
    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    // leading: icon ,
    title: Text(
      title,
      style: const TextStyle(
          fontSize: 18, fontFamily: 'IBM', color: Colors.black87),
    ),
    trailing: const Icon(Icons.arrow_forward_ios_rounded),
  );
  // return Padding(
  //   padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
  //   child: GestureDetector(
  //     onTap: (){
  //       onClick();
  //     },
  //       child:Row(children: [
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(0, 0, 10,0),
  //           child:icon,
  //         ),
  //         Text(title
  //           ,style: const TextStyle(
  //               fontSize: 18,
  //               fontFamily: 'IBM',
  //               color:Colors.black87
  //           ),
  //         ),
  //         const Expanded(child: SizedBox()),
  //         const Padding(
  //           padding: EdgeInsets.fromLTRB(10, 0, 0,0),
  //           child:  Icon(Icons.arrow_forward_ios_rounded,
  //             color: Colors.black87,),
  //
  //         )
  //       ],),
  //
  //
  //   ),
  // );
}

// Widget buttonGoToPage(Function onClick, String title) {
//   return ListTile(
//     onTap: () {
//       onClick.call();
//     },
//     // minVerticalPadding: ,
//     contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//     // leading: icon ,
//     title: Text(
//       title,
//       style: const TextStyle(
//           fontSize: 16, fontFamily: 'IBM', color: Colors.black87),
//     ),
//     trailing: const Icon(Icons.arrow_forward_ios_rounded),
//   );
// }

Widget buttonHaveTitleAndIcon(Function onClick, String title, {Icon? icon,bool? isIcon,Image ? image }) {
  return ListTile(
    onTap: () => {onClick.call()},
    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    title: Text(
      title,
      style: const TextStyle(
          fontSize: 16, fontFamily: 'IBM', color: Colors.black87),
    ),
    trailing: isIcon?? false ? icon : image,
  );
}
