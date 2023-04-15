import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        //
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("وين",style: TextStyle(
            fontFamily: 'IBM',
            fontSize: 70,
            color: Colors.white,
            // height: 4
            // debugLabel: "Alamat"
            // decoration: TextDecoration.combine([TextDecoration.overline,TextDecoration.lineThrough,TextDecoration.underline,TextDecoration.none])
            //     fontStyle:FontStyle.normal
            // inherit: true
            // backgroundColor: Colors.grey
            // fontWeight: FontWeight.w700
          shadows: [Shadow(color: Colors.black38,blurRadius: 20,offset: Offset.fromDirection(2,4))], ),textScaleFactor: 1.4,
          // selectionColor: Colors.blue

          ),
          Text("بلاقي",style: TextStyle(
            // letterSpacing: 1,
            fontFamily: 'IBM',
            fontSize: 70,
            color: Colors.white,
            // height: 4
            // debugLabel: "Alamat"
            // decoration: TextDecoration.combine([TextDecoration.overline,TextDecoration.lineThrough,TextDecoration.underline,TextDecoration.none])
            //     fontStyle:FontStyle.normal
            // inherit: true
            // backgroundColor: Colors.grey
            // fontWeight: FontWeight.w700
          shadows: [Shadow(color: Colors.black38,blurRadius: 20,offset: Offset.fromDirection(2,4))], ),textScaleFactor: 1.4,
          // selectionColor: Colors.blue

          ),


        ],
        ),
      ),
    );
  }
}
