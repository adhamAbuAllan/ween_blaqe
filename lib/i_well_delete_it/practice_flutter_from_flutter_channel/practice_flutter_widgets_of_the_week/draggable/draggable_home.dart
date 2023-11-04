import 'package:flutter/material.dart';

class DraggableHome extends StatefulWidget {
  const DraggableHome({super.key});

  @override
  State<DraggableHome> createState() => _DraggableHomeState();
}

class _DraggableHomeState extends State<DraggableHome> {
  Color caughtColor = Colors.red;
  String myText = "hello world";
  String nowText = "Drag here";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Draggable(
                  data: const Color(0xFFFFAB40),
                  onDraggableCanceled: (velocity, offset) {},
                  feedback: Container(
                    width: 150,
                    height: 150,
                    color: Colors.orangeAccent.withOpacity(.5),
                    child: const Center(
                      child: Text(
                        "Box...",
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.orangeAccent,
                    child:  Center(child: Text(myText)),
                  )),
              DragTarget(
                onAccept: (Color color) {
                  caughtColor = color;
                  nowText = myText;
                },
                builder: (context, accepted, rejected) {
                  return Container(
                    width: 200,
                    height: 200,
                    color:
                        accepted.isEmpty ? caughtColor : Colors.grey.shade200,
                    child:  Center(
                      child: Text( accepted.isEmpty ? nowText : "undrag"),
                    ),
                  );
                },
              ),
            ]),
      ),
    );
  }
}
