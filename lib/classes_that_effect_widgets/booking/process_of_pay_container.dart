import 'package:flutter/material.dart';
class ProcessOfPay extends StatelessWidget {
  String title;
  String subtitle;
   ProcessOfPay({Key? key,
  required this.title,required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
      // height: 140,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white70,
      ),
      child: Column(children: [
        Row(
          children: [

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 10,10),
              child: Text(title,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 18,
                  fontFamily: 'IBM',
                ),
              ),
            ),

          ],
        ),
        Row(children:  [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
            child: Row(
              children: [
                Image(image: AssetImage("assets/images/alert.png"),width: 28,height: 28,),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Text("هام",
                    style: TextStyle(color: Colors.redAccent,fontSize: 18,fontFamily: 'IBM'),
                  ),
                ),
              ],
            ),
          ),
        ],),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10,0),
              child: Text(subtitle,
                style:  TextStyle(color: Colors.grey.shade800,fontSize: 15,fontFamily: 'IBM'),

              ),
            ),
            Expanded(child: Text(""),),

          ],
        )

      ],),
    );
  }    
}
