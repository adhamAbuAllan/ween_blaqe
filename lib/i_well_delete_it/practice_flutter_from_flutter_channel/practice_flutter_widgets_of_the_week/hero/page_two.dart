import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return      Scaffold(
      appBar: AppBar(title: const Text("page two"),),
      body: GestureDetector(
          onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const PageTwo())),
          child: const Hero(tag: "myImage", child: FlutterLogo())),
    );

  }
}