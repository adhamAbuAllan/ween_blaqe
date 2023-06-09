import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/data_containers/add_ad_data_container.dart';
import 'package:ween_blaqe/skeletons/student_widgets/home_skeleton_widget.dart';
import 'package:ween_blaqe/widgets/toast_widget.dart';
import 'package:ween_blaqe/widgets/user/studnet/from_master_home_to_show_more/new_master_home.dart';
import '../../../api/apartments.dart';
import '../../../urls_of_project/localhost_urls.dart';
import '/classes_that_effect_widgets/apartments/home_screen/screen_home_without_api.dart';
import 'package:get/get.dart'; import 'package:http/http.dart' as http;

import '../../../classes_that_effect_widgets/apartments/home_screen/bar_cities.dart';
/*
          CustomScrollView(

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
                      suffixIcon: IconButton(
                          onPressed: (){},
                          icon:Icon(Icons.search), color: Colors.orange),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.orange)),
                      hintText: 'وين بلاقي "سكن للطلاب في الخليل"',
                      hintStyle: TextStyle(height: 1),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.5, color: Colors.orange.shade300)),

                    ),
                  ),
                ),
                //appBar propriety
                toolbarHeight: 80,
                leadingWidth: 24,
                backgroundColor: Colors.white70,
                floating: true,
                snap: true,
                // primary: true,
                elevation: 0,
                actionsIconTheme: IconThemeData(color: Colors.orange, size: 28),
                surfaceTintColor: Colors.orange,
                //filter Icon-button
                actions: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 7),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.filter_list),
                    ),
                  ),
                ],
              ),
              //this box have many widgets from many classes.
            ],


          ),

 */
      //search
      // appBar: AppBar(
      //   shape: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(7),
      //       borderSide: BorderSide.none),
      //   flexibleSpace: Padding(
      //     padding: const EdgeInsets.fromLTRB(50, 10, 20, 10),
      //     //TextField and make style
      //     child: TextField(
      //       decoration: InputDecoration(
      //         suffixIcon: IconButton(
      //             onPressed: () {},
      //             icon: Icon(Icons.search),
      //             color: Colors.orange),
      //         focusedBorder: OutlineInputBorder(
      //             borderSide: BorderSide(width: 1, color: Colors.orange)),
      //         hintText: 'وين بلاقي "سكن للطلاب في الخليل"',
      //         hintStyle: TextStyle(height: 1),
      //         border:
      //             OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
      //         enabledBorder: OutlineInputBorder(
      //             borderSide:
      //                 BorderSide(width: 0.5, color: Colors.orange.shade300)),
      //       ),
      //     ),
      //   ),
      //   toolbarHeight: 80,
      //   leadingWidth: 24,
      //   backgroundColor: Colors.white70,
      //   // primary: true,
      //   elevation: 0,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(0, 0, 0, 7),
      //       child: IconButton(
      //         onPressed: () {},
      //         icon: Icon(
      //           Icons.filter_list,
      //           color: Colors.orange,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
//testing
void main(){
  runApp(MaterialApp(home: Home(),),);
}

class Home extends StatefulWidget {
  static bool bookmarked  = false;

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    // setState(() async {
    //   // Home.bookmarked = true;
    // // await   getData();
    //
    //
    // });


    // fetchPublicPosts();

  }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   Home.bookmarked;
    // });

    // final controller = ScrollController();
    // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag;
//testing
//     var title = AddAdDataContainer.title??"";
    var image = "assets/images/apartments_images/image1.png";
//     var price = AddAdDataContainer.price??0;
//     var city = AddAdDataContainer.city??"";
    return


    //   FutureBuilder<List<dynamic>>(
    //   future: fetchPublicPosts(),
    //   builder: (context,snapshot){
    //     if(snapshot.connectionState == ConnectionState.waiting){
    //       return const HomeSkeletonWidget();
    //     }else if(snapshot.hasError){
    //       return toast("Error:${snapshot.error}")??Text("Error:${snapshot.error}");
    //     }else{
    //       apartments = snapshot.data ?? [];
    //       return ListView.builder(
    //         itemCount: apartments.length,
    //         itemBuilder: (c,i){
    //           final apartment = apartments[i];
    //           return  AdPost(image: image,price: apartment['price'],title: title,city:city,clicked:false,);
    //
    //         },
    //       );
    //     }
    //   },
    // );





// NewMasterHome();
   AdPost(
     // image: image,
    // price: price,
    // title: title,
    // city:city,
    // clicked:

    // false
    );




  }

}

void go ()async{
  var url = Uri.parse(ServerLocalhost.apartmentAll);
  var data = await http.get(url);
  var json = jsonDecode(data.body);
  print(json['title']);

}
