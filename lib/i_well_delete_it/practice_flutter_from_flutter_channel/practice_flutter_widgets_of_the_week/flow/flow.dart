import 'package:flutter/material.dart';

import 'custom_flow.dart';

//
main() {
  runApp(const MaterialApp(home: _Home()));
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> with SingleTickerProviderStateMixin {
  late AnimationController menuAnimation;
  IconData lastIconClicked = Icons.notifications;
  final List<IconData> menuItems = [
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu
  ];

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(child: Text("")),
            Expanded(
              flex: 2,
              child: customFlow(
                  menuAnimation: menuAnimation,
                  lastIconClicked: lastIconClicked,
                  menuItems: menuItems,
                  menuAnimationController: menuAnimation),
            ),
          ],
        ),
      ),
    );
  }
}
