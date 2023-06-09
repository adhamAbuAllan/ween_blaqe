import 'dart:convert';
import 'dart:ffi';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; import 'package:http/http.dart' as http;

import 'package:get/get_core/src/get_main.dart';
import 'package:ween_blaqe/api/apartments.dart';
import 'package:ween_blaqe/widgets/user/owner/steps_to_create_apartment/fourth_step.dart';
import 'package:ween_blaqe/widgets/user/studnet/search_filter.dart';

import '../../../classes_that_effect_widgets/apartments/home_screen/bar_cities.dart';
import '../../../data_containers/add_ad_data_container.dart';
import '../../../main.dart';
import '../../../sesstion/new_session.dart';
import '../../../urls_of_project/localhost_urls.dart';
import 'home.dart';


class MasterHome extends StatefulWidget {
  const MasterHome({Key? key}) : super(key: key);

  @override
  State<MasterHome> createState() => _MasterHomeState();
}

class _MasterHomeState extends State<MasterHome> {



  @override
  void initState() {
    // fetchApartmentsAll();

    super.initState();
  }
  late AnimationController animationController;
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: Colors.orange,

      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          //hide keyboard when scroll
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          //controller for Bottom-nav-bar that hide it when scrolling
          controller: controller,
          slivers: <Widget>[
            //SliverAppBar to hide AppBar when scrolling.
            //this appBar have Input to Search and have filter.
            SliverAppBar(
              // collapsedHeight: 25,
              //shape of Input Search
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide.none),
              flexibleSpace: Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 20, 10),
                //TextField and make style
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.orange)),
                    hintText: 'وين بلاقي "سكن للطلاب في الخليل"',
                    hintStyle: const TextStyle(height: 1),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.5, color: Colors.orange.shade300)),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                        color: Colors.orange),

                  ),

                ),
              ),
              //appBar propriety
              toolbarHeight: 80,
              leadingWidth: 24,
              backgroundColor: Colors.white70,
              floating: true,
              snap: true,
              pinned: false,
              // primary: true,
              elevation: 0,
              actionsIconTheme: const IconThemeData(color: Colors.orange, size: 28),
              surfaceTintColor: Colors.orange,
              //filter Icon-button
              actions: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 7),
                  child: IconButton(
                    onPressed: () {
                      // Get.to(SearchFilter);
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return const SearchFilter();
                        }),
                      );
                    },
                    icon: const Icon(Icons.filter_list),
                  ),
                ),
              ],
            ),
            //this box have many widgets from many classes.
            SliverToBoxAdapter(child:CitiesBar() ,),
            SliverList(
              delegate: SliverChildBuilderDelegate
                ((BuildContext cxt, int i) {
                return

                //   AddAdDataContainer.price == null ?
                // SizedBox(
                //     height: 500,child: Container(
                //   margin: EdgeInsets.fromLTRB(25, 0 ,25, 0),
                //       child: Center(
                //
                //       child: Text(style: TextStyle(
                //   fontFamily: "IBM",
                //   color: Colors.grey.shade800,
                //   fontSize: 20,
                // ),
                //       "لا يوجد إي إعلان حاليًا يرجى المحاولة فيما بعد")),
                //     )):
                Home();

              },
                  childCount: 1
              ),
            ),
          ],
        ),
      ),
    );

  }
}

// Future<List<ArrayOfApartments>> fetchApartmentsAll() async {
//
//   final url = Uri.parse(ServerLocalDiv.apartmentAll);
//   var headers = {
//     "Authorization" : "Bearer ${(await sp).get("token")}",
//
//   // 'Content-Type': 'application/json',
//   };
//    http.Response response = await http.get(url,
//       headers: headers
//   );
//
//   if (response.statusCode == 200) {
//     // Request succeeded, parse the response body
//     var jsonData = jsonDecode(response.body);
//     List<ArrayOfApartments> apartments = [];
//
//     for(var apartment in jsonData){
//       apartments.add(ArrayOfApartments.fromJson(apartment));
//       print(apartments[0]);
//     }
//     return apartments;
//     // final posts = jsonData['data'] as List<dynamic>;
//     // return posts;
//
//   } else {
//     // Request failed
//     // print('Failed to fetch public posts. Status code: ${response.statusCode}');
//     return [];
//   }
// }
// class AllApartmentsTest{
//   int id,price,rooms,bathRooms;
//   String title,description;
  // AllApartmentsTest.fromJson(Map<String,dynamic> map){
  //   this.id = map['id'];
  //   this.description = map['description'];
  //   this.price = map['price'];
  //   this.title = map['title'];
  //   this.rooms = map['rooms'];
  //   this.bathRooms = map['bath_rooms'];
  // }
// }