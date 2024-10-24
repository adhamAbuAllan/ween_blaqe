import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';

import '../../../../constants/coordination.dart';
import '../../../../constants/get_it_controller.dart';

Widget buttonAccount(Function onClick, String title,
    {Image? image, IconData? icon, Color? color, required BuildContext
    context}) {

  return ListTile(

    iconColor: themeMode.isLight
        ? kTextColorLightMode
        : kTextColorDarkMode,
    onTap: () {
      onClick.call();
    },
    dense:
        getIt<AppDimension>().isSmallScreen(context),
    splashColor: themeMode.isLight
        ? kBackgroundAppColorLightMode
        : kBackgroundAppColorDarkMode,
    // minVerticalPadding: ,

    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    // leading: icon ,
    leading:image ?? Icon(icon
    ,
    size: getIt<AppDimension>().isSmallScreen(context) ?  32 - 5
        : 32,
    ) ,
    title: Text(
      title,
      style: TextStyle(
          fontSize: 16,
          fontFamily: 'IBM',
          color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode),
    ),
    trailing: Icon(
      Icons.arrow_forward_ios_rounded,
      color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
    ),
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
  //             kTextColor,),
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
      style: TextStyle(
          fontSize: 18,
          fontFamily: 'IBM',
          color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode),
    ),
    trailing: Icon(
      Icons.arrow_forward_ios_rounded,
      color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
    ),
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
  //             kTextColor,),
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
//           fontSize: 16, fontFamily: 'IBM', kTextColor),
//     ),
//     trailing: const Icon(Icons.arrow_forward_ios_rounded),
//   );
// }

Widget buttonHaveTitleAndIcon(Function onClick, String title,
    {Icon? icon, bool? isIcon, Image? image}) {
  return ListTile(
    onTap: () => {onClick.call()},
    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    title: Text(
      title,
      style: TextStyle(
          fontSize: 16,
          fontFamily: 'IBM',
          color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode),
    ),
    trailing: isIcon ?? false ? icon : image,
  );
}
