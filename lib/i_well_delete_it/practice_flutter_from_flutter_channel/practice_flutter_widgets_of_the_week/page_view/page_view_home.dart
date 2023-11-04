import 'package:flutter/material.dart';
import 'package:ween_blaqe/i_well_delete_it/practice_flutter_from_flutter_channel/flutter_package_of_the_week/go_router/screens/screen_1.dart';

import '../../flutter_package_of_the_week/go_router/screens/screen_2.dart';
import '../../flutter_package_of_the_week/go_router/screens/screen_3.dart';
import '../../flutter_package_of_the_week/go_router/screens/screen_4.dart';

class PageViewHome extends StatefulWidget {
  const PageViewHome({super.key});

  @override
  State<PageViewHome> createState() => _PageViewHomeState();
}

class _PageViewHomeState extends State<PageViewHome> {
  final controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        allowImplicitScrolling: true,
        padEnds: true,
        pageSnapping: true,
        reverse: false,
      
        children: [
          Screen1(),
          const Screen2(),
          const Screen3(),
          const Screen4(),
        ],
      ),
    );
  }
}
