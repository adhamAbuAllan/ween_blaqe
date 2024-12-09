// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:ween_blaqe/constants/strings.dart';
// import '../../../core/widgets/apartments/home_screen/screen_home_without_api.dart';
// import '../../../urls_of_project/localhost_urls.dart';
//
// /*
//           CustomScrollView(
//
// //hide keyboard when scroll
//             keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//             //controller for Bottom-nav-bar that hide it when scrolling
//             controller: controller,
//             slivers: <Widget>[
//               //SliverAppBar to hide AppBar when scrolling.
//               //this appBar have Input to Search and have filter.
//               SliverAppBar(
//                 // collapsedHeight: 25,
//
//                 //shape of Input Search
//                 shape: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(7),
//                     borderSide: BorderSide.none),
//                 flexibleSpace: Padding(
//                   padding: const EdgeInsets.fromLTRB(50, 10, 20, 10),
//                   //TextField and make style
//                   child: TextField(
//                     decoration: InputDecoration(
//                       suffixIcon: IconButton(
//                           onPressed: (){},
//                           icon:Icon(Icons.search), color: kPrimaryColor),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(width: 1, color: kPrimaryColor)),
//                       hintText: 'وين بلاقي "سكن للطلاب في الخليل"',
//                       hintStyle: TextStyle(height: 1),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(7)),
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               width: 0.5, color: kPrimaryColor300)),
//
//                     ),
//                   ),
//                 ),
//                 //appBar propriety
//                 toolbarHeight: 80,
//                 leadingWidth: 24,
//                 backgroundColor: kContainerColor,
//                 floating: true,
//                 snap: true,
//                 // primary: true,
//                 elevation: 0,
//                 actionsIconTheme: IconThemeData(color: kPrimaryColor, size: 28),
//                 surfaceTintColor: kPrimaryColor,
//                 //filter Icon-button
//                 actions: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 0, 0, 7),
//                     child: IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.filter_list),
//                     ),
//                   ),
//                 ],
//               ),
//               //this box have many widgets from many classes.
//             ],
//
//
//           ),
//
//  */
// //search
// // appBar: AppBar(
// //   shape: OutlineInputBorder(
// //       borderRadius: BorderRadius.circular(7),
// //       borderSide: BorderSide.none),
// //   flexibleSpace: Padding(
// //     padding: const EdgeInsets.fromLTRB(50, 10, 20, 10),
// //     //TextField and make style
// //     child: TextField(
// //       decoration: InputDecoration(
// //         suffixIcon: IconButton(
// //             onPressed: () {},
// //             icon: Icon(Icons.search),
// //             color: kPrimaryColor),
// //         focusedBorder: OutlineInputBorder(
// //             borderSide: BorderSide(width: 1, color: kPrimaryColor)),
// //         hintText: 'وين بلاقي "سكن للطلاب في الخليل"',
// //         hintStyle: TextStyle(height: 1),
// //         border:
// //             OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
// //         enabledBorder: OutlineInputBorder(
// //             borderSide:
// //                 BorderSide(width: 0.5, color: kPrimaryColor300)),
// //       ),
// //     ),
// //   ),
// //   toolbarHeight: 80,
// //   leadingWidth: 24,
// //   backgroundColor: kContainerColor,
// //   // primary: true,
// //   elevation: 0,
// //   actions: [
// //     Padding(
// //       padding: const EdgeInsets.fromLTRB(0, 0, 0, 7),
// //       child: IconButton(
// //         onPressed: () {},
// //         icon: Icon(
// //           Icons.filter_list,
// //           color: kPrimaryColor,
// //         ),
// //       ),
// //     ),
// //   ],
// // ),
// //testing
// void main() {
//   runApp(
//     const MaterialApp(
//       home: Home(),
//     ),
//   );
// }
//
// class Home extends StatefulWidget {
//   static bool bookmarked = false;
//
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   @override
//   void initState() {
//     super.initState();
//     // setState(() async {
//     //   // Home.bookmarked = true;
//     // // await   getData();
//     //
//     //
//     // });
//
//     // fetchPublicPosts();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // setState(() {
//     //   Home.bookmarked;
//     // });
//
//     // final controller = ScrollController();
//     // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag;
// //testing
// //     var title = AddAdDataContainer.title??"";
// //     var image = "assets/images/apartments_images/image1.png";
// //     var price = AddAdDataContainer.price??0;
// //     var city = AddAdDataContainer.city??"";
//     return
//
//         //   FutureBuilder<List<dynamic>>(
//         //   future: fetchPublicPosts(),
//         //   builder: (context,snapshot){
//         //     if(snapshot.connectionState == ConnectionState.waiting){
//         //       return const HomeSkeletonWidget();
//         //     }else if(snapshot.hasError){
//         //       return toast("Error:${snapshot.error}")??Text("Error:${snapshot.error}");
//         //     }else{
//         //       apartments = snapshot.data ?? [];
//         //       return ListView.builder(
//         //         itemCount: apartments.length,
//         //         itemBuilder: (c,i){
//         //           final apartment = apartments[i];
//         //           return  AdPost(image: image,price: apartment['price'],title: title,city:city,clicked:false,);
//         //
//         //         },
//         //       );
//         //     }
//         //   },
//         // );
//
// // NewMasterHome();
//         const AdPost(
//             // image: image,
//             // price: price,
//             // title: title,
//             // city:city,
//             // clicked:
//
//             // false
//             );
//   }
// }
//
// void go() async {
//   var url = Uri.parse(ServerLocalDiv.apartmentAll);
//   var data = await http.get(url);
//   var json = jsonDecode(data.body);
//   debugPrint(json['title']);
// }
