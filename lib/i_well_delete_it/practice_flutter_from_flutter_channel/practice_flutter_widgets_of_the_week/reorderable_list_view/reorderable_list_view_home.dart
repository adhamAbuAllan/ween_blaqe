import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

class ReorderableListViewHome extends StatefulWidget {
  const ReorderableListViewHome({super.key});

  @override
  State<ReorderableListViewHome> createState() =>
      _ReorderableListViewHomeState();
}

class _ReorderableListViewHomeState extends State<ReorderableListViewHome> {
  List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "keep cleck and move item 👀",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      body: ColorfulSafeArea(
        color: Colors.orange,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10 * 2, horizontal: 30),
          child: ReorderableListView(
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                String item = items.removeAt(oldIndex);
                items.insert(newIndex, item);
              });
            },
            children: [
              for (final item in items)
                ListTile(
                  key: ValueKey(item),
                  title: Text('Item #$item,'),
                )
            ],
          ),
        ),
      ),
    );
  }
}
