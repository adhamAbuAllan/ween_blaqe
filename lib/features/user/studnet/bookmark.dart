// import 'package:flutter/material.dart';
// import 'package:ween_blaqe/core/widgets/subtitle_class_widget.dart';
// import 'package:ween_blaqe/core/widgets/title_class_widget.dart';
//
// import '../../../core/widgets/bookmark_class_widget.dart';
//
//
// class Bookmark extends StatefulWidget {
//   const Bookmark({Key? key}) : super(key: key);
//
//   @override
//   State<Bookmark> createState() => _BookmarkState();
// }
//
// var show = false;
//
// class _BookmarkState extends State<Bookmark> {
//   @override
//   Widget build(BuildContext context) {
//     var title = "شقة للطلاب مفروش الخليل";
//     var location = "الخليل-واد الهرية";
//     var price = 999;
//     var image = "assets/images/apartments_images/image1.png";
//     var booking = "غير محجوز";
//     return Scaffold(
//       backgroundColor: Colors.grey.shade200,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const TitleClassWidget(title: "المحفوظات"),
// const SubtitleCalssWidget(subtitle: "قائمة المحفوظات"),
//             show == false
//                 ? Center(
//                     child: Container(
//                     margin: const EdgeInsets.fromLTRB(25, 215, 25, 0),
//                     child: TextButton(
//                       onPressed: () {
//                         setState(() {
//                           show = true;
//                         });
//                       },
//                       child: Text("لا يوجد لديك إعلانات محفوظة",
//                           style: TextStyle(
//                             fontFamily: "IBM",
//                             color: Colors.grey.shade800,
//                             fontSize: 20,
//                           )),
//                     ),
//                   ))
//                 : BookmarkClassWidget(
//                     title: title,
//                     image: image,
//                     price: price,
//                     booking: booking,
//                     location: location,
//                     // isvisible: false,
//                   )
//           ],
//         ),
//       ),
//     );
//   }
// }
// /*
// To save a specific index of `apartmentsRes.data` from the `NewMasterHome` screen, you can create a function that handles the saving logic and call it when the user clicks the bookmark button. Here's an example implementation:
//
// First, create a function in the `NewMasterHome` class that can handle the saving logic:
//
// ```dart
// void saveBookmark(int index) {
//   // Add your logic to save the specific index from apartmentsRes.data
//   // For example, you can use shared_preferences or any other storage method.
//   // Here is a simple example using shared_preferences.
//   String postId = apartmentsRes.data![index].id; // Assuming id is the unique identifier for the post
//   // Call the function to add the post to bookmarks
//   BookmarkManager.addBookmark(postId);
// }
// ```
//
// Then, in the `apartments` method, add an `onPressed` callback to the bookmark `IconButton` that calls the `saveBookmark` function:
//
// ```dart
// Padding(
//   padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
//   child: checked
//       ? IconButton(
//           onPressed: () {
//             setState(() {
//               clicked = false;
//             });
//             saveBookmark(index); // Call the saveBookmark function here
//           },
//           icon: const Icon(
//             Icons.bookmark_outline,
//             size: 28,
//           ),
//         )
//       : IconButton(
//           onPressed: () {
//             setState(() {
//               clicked = true;
//             });
//             saveBookmark(index); // Call the saveBookmark function here
//           },
//           icon: const Icon(
//             Icons.bookmark,
//             size: 28,
//           ),
//         ),
// ),
// ```
//
// By implementing the `saveBookmark` function and calling it when the user clicks the bookmark button, you can save the specific index of `apartmentsRes.data` to bookmarks. Make sure to handle the bookmark retrieval and display in the `Bookmark` screen accordingly.
//  */