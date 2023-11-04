import 'package:flutter/material.dart';

void main(List<String> args) {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListWheelScrollView(
          useMagnifier: true,
          renderChildrenOutsideViewport: true,
          clipBehavior: Clip.none,
          // scrollBehavior: s,
          // physics: const PageScrollPhysics(),
          magnification: 1.05,
          overAndUnderCenterOpacity: .3,
          perspective: .01,
          
          diameterRatio: .8,
          squeeze: 1,
          offAxisFraction: .01,
          itemExtent: 43,
          children: const [
            Text(
              "1",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "2",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "3",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "4",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "5",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "6",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "7",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "8",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "9",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "10",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "11",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "12",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "13",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "14",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "15",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "16",
              style: TextStyle(fontSize: 30),
            ),
          ]),
    );
  }
}
