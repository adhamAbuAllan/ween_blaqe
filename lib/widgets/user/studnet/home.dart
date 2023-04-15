import 'package:flutter/material.dart';
import '/classes_that_effect_widgets/apartments/home_screen/screen_home_without_api.dart';
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
class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = ScrollController();
    // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag;

    var title = "شقة للطالبات في مدينة الخليل";
    var image = "assets/images/apartments_images/image1.png";
    var price = 900;
    var city = "الخليل";


    return
    Column(
          children: [
            // CitiesBar(),
            AdPost(image: image,price: price,title: title,city:city,)
          ],
        );

  }
}
