import 'package:flutter/material.dart';
main(){
  runApp(const MaterialApp(home: _Home(),));
}
class _Home extends StatefulWidget {
  const _Home
();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  Offset dragGesturePosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Drag on the logo!'),
            buildRepaintBoundary(),
          ],
        ),
      ),
    );
  }

  RepaintBoundary buildRepaintBoundary() {
    return RepaintBoundary(
            child: Stack(
              children: <Widget>[
                buildGestureDetector(),
                Positioned(
                  left: dragGesturePosition.dx - 50,
                  top: dragGesturePosition.dy -100,
                  child:  RawMagnifier(
                    decoration: buildMagnifierDecoration(),
                    size: const Size(80, 80),
                    magnificationScale:1.5,
                  ),
                )
              ],
            ),
          );
  }

  GestureDetector buildGestureDetector() {
    return GestureDetector(
                  onPanUpdate: (DragUpdateDetails details) => setState(
                        () {
                      dragGesturePosition = details.localPosition;
                    },

                  ),
                  onTap: (){
                    setState(() {
                      dragGesturePosition = Offset.zero;

                    });
                  },
                  child: const Text("This sample demonstrates what a magnifier is, and how it can be used. ")
                  // const FlutterLogo(size: 200),
                );
  }

  MagnifierDecoration buildMagnifierDecoration() {
    return const MagnifierDecoration(
                      shape: CircleBorder(
                        side: BorderSide(color: Colors.orange, width: 3,strokeAlign: .1),
                      ),
                    );
  }
}