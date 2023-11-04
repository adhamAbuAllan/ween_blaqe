import 'package:flutter/material.dart';

class FlexibleHome extends StatelessWidget {
  const FlexibleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Flexible(flex:2,child:Container(height: 100,color: Colors.cyan,)),
        Flexible(flex:3,child:Container(color: Colors.teal,)),
        Expanded(
          child: Row(children: [
            Flexible(flex:1,child:Container(color: Colors.purpleAccent,)),
            Flexible(flex:1,child:Container(color: Colors.orange,)),
          ]),
        ),
        Flexible(flex:1,child:Container(color: Colors.indigo,)),

      ]),
    );
  }
}
Widget simpleCointainer(double height,Color color){
  return Container(height: height,color: color,);
}