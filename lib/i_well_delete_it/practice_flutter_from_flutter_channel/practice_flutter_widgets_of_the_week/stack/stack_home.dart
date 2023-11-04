import 'package:flutter/material.dart';

class StackHome extends StatelessWidget {
  const StackHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Stack(
          clipBehavior: Clip.antiAlias,

          // fit: StackFit.passthrough,
          alignment: Alignment.bottomCenter,
          children: [
            myGrayBox(),
            
            Positioned(bottom: 50, right: -50, child: myWhiteBox()),
            myBlueBox()
          ],
        ),
      ),
    );
  }
  

  Widget myGrayBox() {
    return Container(
      width: 100,
      height: 100,
      color: Colors.grey,
    );
  }

  Widget myBlueBox() {
    return Container(
      width: 80,
      height: 80,
      color: Colors.blue,
    );
  }

  Widget myWhiteBox() {
    return Container(
      width: 80,
      height: 80,
      color: Colors.white,
    );
  }
}
//cerate ListView.separated?