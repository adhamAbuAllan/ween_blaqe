import 'package:flutter/material.dart';
import 'dart:math' as math;


main() {
  runApp(const MaterialApp(home: _Home()));
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {

  late List<Widget> _items;

  @override
  void initState() {
    super.initState();
    _items = [
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer(),
      _myContainer()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.horizontal,
        // clipBehavior: ,
        physics:
            // ClampingScrollPhysics(),
        // FixedExtentScrollPhysics(),
        const PageScrollPhysics(),



        
        // BouncingScrollPhysics(
        //   decelerationRate: ScrollDecelerationRate.fast,
        // ),
        children: _items,
      ),
      floatingActionButton: GestureDetector(
        onLongPress: (){

        },
        child: Align(
          alignment: Alignment.bottomCenter,
          widthFactor: 6.5,
          child: FloatingActionButton(
            tooltip: "change color",
// clipBehavior: Clip.antiAlias,
//               enableFeedback: true,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
//               elevation: 20,
//               isExtended: true,
//               autofocus: true,
//               materialTapTargetSize: MaterialTapTargetSize.padded,
//               mini: false,
//
//               focusColor: ColorEffect.neutralValue,
//               disabledElevation: 10*10,
//               focusElevation: 10*2,
//               focusNode: primaryFocus,
              // hoverColor: Colors.orange,
              // highlightElevation: 23,
              // splashColor:Color((math.Random().nextDouble() * 0xFFFFFF).toInt()) ,
              // backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()),
              onPressed: () {
                setState(() {
                  _items = [
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer(),
                    _myContainer()
                  ];
                });
              },
              child: const Icon(Icons.refresh,)),
        ),
      ),
    );
  }

  Widget _myContainer() {
    return FractionallySizedBox(
      // widthFactor: 1,
      heightFactor: 1,
      child: Container(
        width: 400,
        height: 150,
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0),
        child: Align(
            alignment: Alignment.center,
            child: Text(
              "${math.Random().nextDouble() * 0xFFFFFFd}",
              style: const TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
