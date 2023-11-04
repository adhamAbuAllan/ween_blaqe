// import 'package:flutter/material.dart'; import 'package:flutter/material.dart';//
// import '../../../styles/button.dart';
// import 'package:ween_blaqe/api/social_media.dart';
// import 'package:ween_blaqe/api/users.dart';
//
// // Widget ForInquiries(SocialMedia socialMedia , Function onClick,User user){
// //   var socialName = socialMedia.name;
// //   var soc1ialicon = socialMedia.icon;
//   var urlOfSocial = socialMedia.url;
// //   var socialId = socialMedia.id;
//   String number_phone = "https://wa.me/+972$phone}";
//   String number_phone2 = "https://api.whatsapp.com/send?phone=+972$phone";
//   final Uri _url = Uri.parse(urlOfSocial);
// //
// //   return Padding(
// //     padding: const EdgeInsets.all(8.0),
// //     child: SizedBox(
// //       width: 115,
// //       height: 50,
// //       child: OutlinedButton(
// //         child: Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: Row(
// //             children: [
// //               //whtsapp icon
// //               Padding(
// //                 padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
// //                 child: Image(
// //                   image:
// //                   AssetImage(soc1ialicon),
// //                   width: 28,
// //                   height: 28,
// //                 ),
// //               ),
// //
// //               //text
// //               Padding(
// //                 padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
// //                 child: Text(socialName,
// //                     style: TextStyle(
// //                       color: Colors.black87,
// //                       fontSize: 16,
// //                       fontFamily: 'IBM',
// //                     )),
// //               ),
// //             ],
// //           ),
// //         ),
// //         onPressed: () {
// //           onClick;
// //           // _launchUrl;
// //           // final value = ClipboardData(text: number_phone);
// //           // Clipboard.setData(value);
// //           if (socialName=="واتساب"){
// //             number_phone2;
// //           }else {
// //             urlOfSocial;
// //           }
// //
// //           // Fluttertoast.showToast(
// //           //     msg: "الرقم غير صحيح",
// //           //     toastLength: Toast.LENGTH_SHORT,
// //           //     gravity: ToastGravity.BOTTOM_RIGHT,
// //           //     timeInSecForIosWeb: 10,
// //           //     backgroundColor: Colors.blue,
// //           //     textColor: Colors.white,
// //           //     fontSize: 16.0
// //           // );
// //         },
// //         style: outlineButton,
// //       ),
// //     ),
// //   );
// //
// // }
// class ForInquiries extends StatelessWidget {
//   String contactName;
//   String contactIcon;
//   Function onClick;
//   const ForInquiries({Key? key,
//   required this.contactName,
//     required this.contactIcon,
//     required this.onClick
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return    Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//         width: 115,
//         height: 50,
//         child: OutlinedButton(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 //whtsapp icon
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                   child: Image(
//                     image:
//                     AssetImage(contactIcon),
//                     width: 28,
//                     height: 28,
//                   ),
//                 ),
//
//                 //text
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                   child: Text(contactName,
//                       style: TextStyle(
//                         color: Colors.black87,
//                         fontSize: 16,
//                         fontFamily: 'IBM',
//                       )),
//                 ),
//               ],
//             ),
//           ),
//           onPressed: () {
//             onClick;
//             // _launchUrl;
//             // final value = ClipboardData(text: number_phone);
//             // Clipboard.setData(value);
//             if (contactName=="واتساب"){
//               number_phone2;
//             }else {
//               urlOfSocial;
//             }
//
//             // Fluttertoast.showToast(
//             //     msg: "الرقم غير صحيح",
//             //     toastLength: Toast.LENGTH_SHORT,
//             //     gravity: ToastGravity.BOTTOM_RIGHT,
//             //     timeInSecForIosWeb: 10,
//             //     backgroundColor: Colors.blue,
//             //     textColor: Colors.white,
//             //     fontSize: 16.0
//             // );
//           },
//           style: outlineButton,
//         ),
//       ),
//     );
//     ;
//   }
// }
