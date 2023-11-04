import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

main() {
  runApp(const MaterialApp(
    home: MyHomePageState(),
  ));
}

class MyHomePageState extends StatefulWidget {
  const MyHomePageState({super.key});

  @override
  State<MyHomePageState> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageState> {
  final List<String> myList = [];

  @override
  void initState() {
    myList.add("1");
    myList.add("2");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 235, 235),
        body: _listView());
  }

  ListView _listView() {
    return ListView.builder(
      itemCount: myList.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: ((context, index) {
        return _slidable(index);
      }),
    );
  }

  Slidable _slidable(int index) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: .2,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => {
              setState(() {
                myList.add(myList[index]);
              })
            },
            icon: Icons.add,
          ),
        ],
      ),
      startActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              setState(() {
                myList.removeAt(index.bitLength);
              });
            },
            icon: Icons.delete,
          )
        ],
      ),
      child: _listTile(index),
    );
  }

  ListTile _listTile(int index) {
    return ListTile(
      // hoverColor: Colors.amber,
      shape: Border.all(width: .01, color: Colors.black54),
      focusColor: Colors.black,
      trailing: const Icon(Icons.compare_arrows),
      // splashColor: Colors.amber,
      title: Text("slid left or right ${1 + index}"),
    );
  }
}

void doNothing(BuildContext context) {}
