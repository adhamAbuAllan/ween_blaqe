import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ween_blaqe/widgets/user/studnet/search_filter.dart';

import '../../../classes_that_effect_widgets/apartments/home_screen/bar_cities.dart';
import 'home.dart';
class MasterHome extends StatefulWidget {
  const MasterHome({Key? key}) : super(key: key);

  @override
  State<MasterHome> createState() => _MasterHomeState();
}

class _MasterHomeState extends State<MasterHome> {
  late AnimationController animationController;

  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
            return  Home();
          },
              childCount: 3
          ),
        ),
      ],
    );

  }
}

