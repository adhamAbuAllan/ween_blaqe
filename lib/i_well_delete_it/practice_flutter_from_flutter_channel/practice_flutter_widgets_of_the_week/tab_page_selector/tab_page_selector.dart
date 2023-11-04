import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
      theme: ThemeData(
          iconTheme: const IconThemeData(
        size: 35,
      )),
      home: const _Home()));
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return const _TabPageSelector();
  }
}

class _TabPageSelector extends StatefulWidget {
  const _TabPageSelector();

  @override
  State<_TabPageSelector> createState() => __TabPageSelectorState();
}

class __TabPageSelectorState extends State<_TabPageSelector>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  int _index = 0;
  @override
  void initState() {
    super.initState();
    controller = TabController(
        initialIndex: _index,
        length: widgetsOfTabPageSelector.length,
        vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        TabBarView(
          controller: controller,
          children: widgetsOfTabPageSelector,
        ),
        Positioned(
            bottom: 40,
            child: TabPageSelector(
              borderStyle: BorderStyle.solid,
              indicatorSize: 10 * 2,
              selectedColor: Colors.orange,
              controller: controller,
              color: Colors.black38,
            )),
      ]),
      floatingActionButton: ButtonBar(children: [
        FloatingActionButton(
          materialTapTargetSize: MaterialTapTargetSize.padded,
          onPressed: () {
            setState(() {
              (_index != widgetsOfTabPageSelector.length - 1 )
                  ? _index++
                  : _index = 0;
            });
            controller.animateTo(_index);
          },
          hoverElevation: 0,
          elevation: 0,
          backgroundColor: Colors.orange,
          child: const Icon(Icons.navigate_next),
        )
      ]),
    );
  }
}

List<Widget> widgetsOfTabPageSelector = const [
  Icon(Icons.home),
  Icon(Icons.settings),
  Icon(Icons.person),
];
