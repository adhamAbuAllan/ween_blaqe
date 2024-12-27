// import 'package:colorful_safe_area/colorful_safe_area.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';
//
// import '../../../../constants/nums.dart';
// import '../../../../controller/function_controller/change_theme_mode.dart';
// import '../../../../core/utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';
//
// class TheAdIsFreeOrNot extends StatefulWidget {
//   const TheAdIsFreeOrNot({super.key});
//
//   @override
//   State<TheAdIsFreeOrNot> createState() => _TheAdIsFreeOrNotState();
// }
//
// class _TheAdIsFreeOrNotState extends State<TheAdIsFreeOrNot> {
//   ChangeThemeMode themeMode = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return ColorfulSafeArea(
//       color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
//       bottomColor: Colors.transparent,
//       child: Scaffold(
//         backgroundColor: themeMode.isLight
//             ? kBackgroundAppColorLightMode
//             : kBackgroundAppColorDarkMode,
//         appBar: AppBar(
//           backgroundColor: themeMode.isLight
//               ? kPrimaryColorLightMode
//               : kPrimaryColorDarkMode,
//         ),
//         body: Column(
//           children: [
//             //title
//             Container(
//               margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
//               padding: const EdgeInsets.fromLTRB(0, 50, 25, 10),
//               child: Text(
//                 "كم يُكلفة الإشتراك لعرض إعلاناتي داخل تطبيق وين بلاقي؟",
//                 style: TextStyle(
//                   fontSize: 20.0,
//                   color: themeMode.isLight
//                       ? kTextColorLightMode
//                       : kTextColorDarkMode.withOpacity(.8),
//
//                   inherit: false,
//                 ),
//               ),
//             ),
//
//             // Container(
//             //   width: double.infinity,
//             //   margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
//             //   child: Text(
//             //     "التكلفة ",
//             //     style: TextStyle(
//             //       fontSize: 18.0,
//             //       color: Colors.grey.shade800,
//             //
//             //       inherit: true,
//             //     ),
//             //   ),
//             // ),
//             // Container(
//             //   width: double.infinity,
//             //   margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
//             //   child: Text(
//             //     // "الخطة السنوية : عند شرائك الخطة السنوية لأول مرة تكون تكلفة الاشتراك هي 1100 شيقل ، و عند تجديد الاشتراك تكون تكلفة الاشتراك 1200 شيقل",
//             //     "",
//             //     style: TextStyle(
//             //       fontSize: 16.0,
//             //       color: Colors.grey.shade800,
//             //
//             //       inherit: true,
//             //     ),
//             //   ),
//             // ),
//             Container(
//               width: double.infinity,
//               margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     "أعرض إعلاناتك بلا حدود على تطبيق وين بلاقي بتكلفة قليلة نسبيًا",
//                     style: TextStyle(
//                       fontSize: 18.0,
//
//                       color: themeMode.isLight
//                           ? kTextColorLightMode
//                           : kTextColorDarkMode.withOpacity(.8),
//                       inherit: true,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         RichText(
//                             text: TextSpan(children: [
//                           TextSpan(
//                               style: TextStyle(
//
//                                 fontSize: 22,
//                                 color: themeMode.isLight
//                                     ? kTextColorLightMode
//                                     : kTextColorDarkMode.withOpacity(.8),
//                               ),
//                               text: "التكلفة الشهرية: "),
//                           TextSpan(
//                               style: TextStyle(
//
//                                 color: themeMode.isLight
//                                     ? kTextColorLightMode
//                                     : kTextColorDarkMode.withOpacity(.8),
//                                 fontSize: 22,
//                               ),
//                               text: "199"),
//                         ])),
//                         const SizedBox(
//                           width: 3,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 6.0),
//                           child: FaIcon(
//                             FontAwesomeIcons.shekelSign,
//                             size: 18,
//                             color: themeMode.isLight
//                                 ? kTextColorLightMode
//                                 : kTextColorDarkMode.withOpacity(.8),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         SizedBox(
//                           height: 60,
//                           width: 140,
//                           child: RichText(
//                               softWrap: true,
//                               text: TextSpan(
//                                 children: [
//                                   TextSpan(
//                                       style: TextStyle(
//
//                                         fontSize: 22,
//                                         color: themeMode.isLight
//                                             ? kTextColorLightMode
//                                             : kTextColorDarkMode
//                                                 .withOpacity(.8),
//                                       ),
//                                       text: "التكلفة السنوية:"),
//                                 ],
//                               )),
//                         ),
//                         SizedBox(
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 child: Row(
//                                   children: [
//                                     SizedBox(
//                                       child: RichText(
//                                           softWrap: true,
//                                           text: TextSpan(children: [
//                                             TextSpan(
//                                                 style: TextStyle(
//
//                                                   color: themeMode.isLight
//                                                       ? kTextColorLightMode
//                                                       : kTextColorDarkMode,
//                                                   decoration: TextDecoration
//                                                       .lineThrough,
//                                                   decorationColor: Colors.red,
//                                                   fontSize: 24,
//                                                 ),
//                                                 text: "2388")
//                                           ])),
//                                     ),
//                                     const SizedBox(
//                                       width: 3,
//                                     ),
//                                     FaIcon(
//                                       size: 20,
//                                       FontAwesomeIcons.shekelSign,
//                                       color: themeMode.isLight
//                                           ? kTextColorLightMode
//                                           : kTextColorDarkMode,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 child: Row(
//                                   children: [
//                                     SizedBox(
//                                       child: RichText(
//                                           text: TextSpan(children: [
//                                         TextSpan(
//                                           style: TextStyle(
//
//                                             color: themeMode.isLight
//                                                 ? kTextColorLightMode
//                                                 : kTextColorDarkMode
//                                                     .withOpacity(.8),
//                                             fontSize: 20,
//                                           ),
//                                           text: "1999",
//                                         )
//                                       ])),
//                                     ),
//                                     const SizedBox(
//                                       width: 3,
//                                     ),
//                                     FaIcon(
//                                       FontAwesomeIcons.shekelSign,
//                                       size: 16,
//                                       color: themeMode.isLight
//                                           ? kTextColorLightMode
//                                           : kTextColorDarkMode.withOpacity(.8),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // const Divider(thickness: 1),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   aline,
//                   Row(
//                     children: [
//                       Text(
//                           softWrap: true,
//                           "إشترك الأن من خلال التواصل عبر ",
//                           style: TextStyle(
//
//                               fontSize: 14,
//                               color: themeMode.isLight
//                                   ? kTextColorLightMode
//                                   : kTextColorDarkMode)),
//                       TextButton(
//                         style: ButtonStyle(
//                             overlayColor: WidgetStatePropertyAll(
//                           const Color(0xff25D366).withOpacity(.0),
//                         )),
//                         child: const Text("واتس أب",
//                             style: TextStyle(
//
//                               fontSize: 14,
//                               color: Color(0xff25D366),
//                             )),
//                         onPressed: () {
//                           sendMessageToWhatsApp('2569339613', "السلام عليكم، ",
//                               image: "");
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
