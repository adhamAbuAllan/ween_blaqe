import 'package:flutter/material.dart';

import '../../../styles/text_style/aline_style.dart';

Widget ButtonAccount(Function onClick, Icon icon, String title) {
  return ListTile(
    onTap: () {
      onClick.call();
    },
    // minVerticalPadding: ,
    contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    // leading: icon ,
    leading: icon,
    title: Text(
      title,
      style: TextStyle(fontSize: 16, fontFamily: 'IBM', color: Colors.black87),
    ),
    trailing: Icon(Icons.arrow_forward_ios_rounded),
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
Widget AskForHelpButton(Function onClick, String title) {
  return ListTile(
    onTap: () {
      onClick.call();
    },
    // minVerticalPadding: ,
    contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    // leading: icon ,
    title: Text(
      title,
      style: TextStyle(fontSize: 18, fontFamily: 'IBM', color: Colors.black87),
    ),
    trailing: Icon(Icons.arrow_forward_ios_rounded),
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
Widget ButtonGoToPage(Function onClick, String title) {
  return ListTile(
    onTap: () {
      onClick.call();
    },
    // minVerticalPadding: ,
    contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    // leading: icon ,
    title: Text(
      title,
      style: TextStyle(fontSize: 16, fontFamily: 'IBM', color: Colors.black87),
    ),
    trailing: Icon(Icons.arrow_forward_ios_rounded),
  );

}
Widget ButtonHaveTitleAndIcon(Function onClick, String title,Icon icon) {
  return ListTile(
      onTap: () =>
      {
        onClick.call()
      },
      contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    title: Text(
      title,
      style: TextStyle(fontSize: 16, fontFamily: 'IBM', color: Colors.black87),
    ),
    trailing: icon,

  );
}
