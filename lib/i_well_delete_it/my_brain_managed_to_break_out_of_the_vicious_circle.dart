import 'package:flutter/material.dart';
class BreakCircle extends StatelessWidget {
  var  i = 0;
  String IWillBreakCircle = "كُسرَ التّشتّت";
   BreakCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Container(
      child: SingleChildScrollView(
        clipBehavior: Clip.antiAlias,
        scrollDirection: Axis.vertical,
        child: Column(children: [
          for (int i = 0; i < 10000; i++) Padding(
            padding: const EdgeInsets.fromLTRB(250, 5, 0, 0),
            child: Text( "$IWillBreakCircle"
                "${i.toString()}",),

          ),

        ],),
      )
    ),
      );
  }
}
