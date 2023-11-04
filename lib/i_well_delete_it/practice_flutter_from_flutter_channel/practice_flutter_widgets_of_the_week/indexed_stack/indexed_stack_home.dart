import 'package:flutter/material.dart';

class IndexedStackHome extends StatefulWidget {
  const IndexedStackHome({super.key});

  @override
  State<IndexedStackHome> createState() => _IndexedStackHomeState();
}

class _IndexedStackHomeState extends State<IndexedStackHome> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [WidgetOne(), WidgetTow()],
      ),
      bottomNavigationBar: BottomNavigationBar(currentIndex: index, items: [
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  setState(() {
                    index = 0;
                  });
                },
                icon: const Icon(
                  Icons.home,
                  size: 30,

                  color: Colors.red,
                )),
            label: "red Screen"),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  setState(() {
                    index = 1;
                  });
                },
                icon: const Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.green,
                )), label:"green Screen",),
      ]),
    );
  }

  Widget WidgetOne() {
    return Container(
      color: Colors.red,
    );
  }

  Widget WidgetTow() {
    return Container(
      color: Colors.green,
    );
  }
}
