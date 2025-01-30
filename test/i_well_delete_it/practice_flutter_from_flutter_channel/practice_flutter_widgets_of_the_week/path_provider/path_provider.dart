// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
//
// import 'package:ween_blaqe/i_well_delete_it/practice_flutter_from_flutter_channel/practice_flutter_widgets_of_the_week/theme/dark_theme.dart';
//
// main() {
//   runApp(MaterialApp(theme: darkTheme(), home: _Home()));
// }
//
// class _Home extends StatefulWidget {
//   const _Home();
//
//   @override
//   State<_Home> createState() => _HomeState();
// }
//
// String writeString = "";
// String writeDirectory = "";
// String readString = "";
// String readDirectory = "";
//
// class _HomeState extends State<_Home> {
//   bool isWrite = false;
//   bool isRead = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//         const Align(
//             alignment: Alignment.centerLeft,
//             child: Text("try path provider", style: TextStyle(fontSize: getIt<AppDimension>().isSmallScreen(context) ? 16 : 18))),
//         sizeBox10Height(),
//         isWrite == true
//             ? Text("the write is : $writeString")
//             : const SizedBox(),
//         sizeBox10Height(),
//         isRead == true ? Text("the read is : $readString") : const SizedBox(),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     isWrite = true;
//                     writeFile();
//                   });
//                 },
//                 child: const Text("write file")),
//             sizeBox10Width(),
//             ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     isWrite = true;
//                     readFile();
//                   });
//                 },
//                 child: const Text("read file")),
//           ],
//         )
//       ]),
//     );
//   }
//
//   SizedBox sizeBox10Height() => const SizedBox(
//         height: 10,
//       );
//
//   SizedBox sizeBox10Width() => const SizedBox(
//         width: 10,
//       );
// }
//
// Future<void> writeFile() async {
//   final directory = await getApplicationDocumentsDirectory();
//   var file = File('${directory.path}/myFile.txt');
//   await file.writeAsString('Hello, world!');
//   debugPrint("write file : $file");
//
//   debugPrint("write directory : $directory");
//   writeString = file.toString();
//   writeDirectory = directory.toString();
// }
//
// Future<String> readFile() async {
//   final directory = await getApplicationDocumentsDirectory();
//   final file = File('${directory.path}/myFile.txt');
//   if (await file.exists()) {
//     return await file.readAsString();
//   }
//   debugPrint("read file : $file");
//   readString = file.toString();
//   readDirectory = directory.toString();
//   return 'File not found';
// }
