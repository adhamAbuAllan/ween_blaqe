// import 'package:flutter/material.dart';
// import 'package:upgrader/upgrader.dart';
//
// // Custom class for Arabic messages
// class ArabicUpgraderMessages extends UpgraderMessages {
//   @override
//   String get languageCode => 'ar'; // Set the language code to Arabic
//
//   @override
//   String get buttonTitleUpdate => 'تحديث'; // "Update"
//
//   @override
//   String get promptUpdate => 'اصبح الاصدار الجديد متوفر الآن، هل ترغب في '
//       'التحديث؟'; //
//   // "New
//   // version available, would you like to update?"
//
//   @override
//   String get promptLater => 'لاحقًا'; // "Later"
//
//   @override
//   String get buttonTitleIgnore => 'تجاهل'; // "Ignore"
//
//   @override
//   String get buttonTitleLater => 'لاحقًا'; // "Later"
//
//   @override
//   String get title => 'التحديث متاح'; // "Update Available"
//
//   @override
//   String get releaseNotes => 'قم تحديث التطبيق للحصول على احدث المزايا '
//       'الآن'; // "
// // Rele
// // ase Notes"
// }
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(title: Text('تطبيق التحديث')),
//           body: UpgradeAlert(
//             upgrader: Upgrader(
//               debugDisplayAlways: true,
//               messages: ArabicUpgraderMessages(), // Use the custom Arabic messages
//             ),
//             child: Center(child: Text('مرحبًا بك في التطبيق')),
//           ),
//         ),
//       ),
//     );
//   }
// }
