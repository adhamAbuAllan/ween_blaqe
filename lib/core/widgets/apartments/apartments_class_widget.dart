
// Widget homeClassWidget(
//     ArrayOfApartments apartment, Function onClick, BuildContext context) {
//   Photos photo = Photos(id: 0, apartmentId: apartment, url: "");
//   var url = photo.url;
//   // var id = apartment.id;
//   var title = apartment.title;
//   var price = apartment.price;
//   var city = apartment.city;
//   var location = apartment.location;

//   return Container(
//     margin: const EdgeInsets.fromLTRB(0, 23, 0, 0),
//     width: 373,
//     height: 345,
//     //decoration of show apartment style
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(7),
//       color: kContainerColor,
//     ),
//     child: Column(
//       // this children have (bookmark IconImage  , image of apartment , title of post , price , and location.
//       children: [
//         //bookmark iconImage
//         Padding(
//           padding: const EdgeInsets.fromLTRB(0, 0, 320, 0),
//           child: IconButton(
//             onPressed: () {
//               onClick();
//             },
//             icon: const Icon(
//               Icons.bookmark_outline,
//               size: 28,
//             ),
//           ),
//         ),
//         //image/s of apartment
//         ClipRRect(
//             borderRadius: BorderRadius.circular(7),
//             child: Image(
//               image: AssetImage(url)
//               // child: Image(image: Image.network("src")),
//               ,
//               height: 200,
//               // width:368,
//             )),
//         //title and price
//         Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(title!,
//                   style: const TextStyle(
//                     color: Colors.black87,
//                   )),
//             ),
//             const Expanded(child: Text("")),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(0, 0, 3, 0),
//               child: Text(price.toString(),
//                   style: const TextStyle(color: kPrimaryColor)),
//             ),
//             const Padding(
//               padding: EdgeInsets.fromLTRB(10, 0, 3, 0),
//               child: Text("شيكل/شهري",
//                   style: TextStyle(
//                     color: Colors.grey,
//                   )),
//             ),
//           ],
//         ),
//         //see more and location
//         Row(
//           children: [
//             TextButton(
//               onPressed: () {
//                 onClick.call(Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) {
//                     return const ShowMore();
//                   }),
//                 ));
//               },
//               child: const Text(
//                 "عرض المزيد",
//                 style: TextStyle(color: Colors.blue),
//               ),
//             ),
//             const Expanded(child: Text("")),
//             const Padding(
//               padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//               child: Text("الموقع:",
//                   style: TextStyle(
//                     color: Colors.grey,
//                   )),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//               child: Text("$city-$location",
//                   style: const TextStyle(
//                     color: Colors.grey,
//                   )),
//             ),
//           ],
//         )
//       ],
//     ),
//   );
// }
