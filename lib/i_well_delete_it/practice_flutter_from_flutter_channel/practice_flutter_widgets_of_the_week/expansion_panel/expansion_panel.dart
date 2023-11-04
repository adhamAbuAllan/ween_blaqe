import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(
    home: _Home(),
  ));
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => __HomeState();
}

class __HomeState extends State<_Home> {
  final List<Item> _data = List<Item>.generate(10, (index) {
    return Item(
      headerText: 'Item $index',
      expandedText: 'This is itme number $index',
    );
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: _expansionPanelList(),
      ),
    );
  }



  ExpansionPanelList _expansionPanelList() {
    return ExpansionPanelList(
      expansionCallback: (index, isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;

          debugPrint(
              "you click on the row , and the index is $index and the state is $isExpanded");
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text(item.headerText),
              );
            },
            body: _listTile(item),
            isExpanded: item.isExpanded);
      }).toList(),
    );
  }




  ListTile _listTile(Item item) {
    return ListTile(
      title: Text(item.expandedText),
      subtitle: const Text('To delete this item, click trash icon'),
      trailing: const Icon(
        Icons.delete,
        color: Colors.orange,
      ),
      onTap: () {
        setState(() {
          _data.removeWhere((Item currentItem) => item == currentItem);
        });
      },
    );
  }
}

class Item {
  Item({
    required this.expandedText,
    required this.headerText,
    this.isExpanded = false,
  });
  String headerText, expandedText;
  bool isExpanded;
}
