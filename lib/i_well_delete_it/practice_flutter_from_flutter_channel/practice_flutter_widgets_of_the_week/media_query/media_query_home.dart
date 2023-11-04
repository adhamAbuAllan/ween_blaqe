import 'package:flutter/material.dart';
class MediaQueryHome extends StatefulWidget {
  const MediaQueryHome({super.key});

  @override
  State<MediaQueryHome> createState() => _MediaQueryHomeState();
}

class _MediaQueryHomeState extends State<MediaQueryHome> {
 var size,height,width;


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(body: Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(color:Colors.orange,height: height/4,width: width/2,),
          const SizedBox(height: 10,),
          Container(color:Colors.black26,height: height/2,width: width/2,),
        ],
      ),
    ),);
  }
}
