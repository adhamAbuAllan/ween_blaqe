import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/apartments.dart';

 class GenericInfoClassWidget extends StatelessWidget {
    GenericInfoClassWidget({Key? key,
    required this.title,
      required this.location,
      required this.city,
      required this.price,
      required this.numberOfAllowedStudnet
    }) : super(key: key);
    String title;
    String location;
    String city;
    int price;
    int  numberOfAllowedStudnet;
    @override
   Widget build(BuildContext context) {
     return Container(
       margin: const EdgeInsets.fromLTRB(10, 23, 10, 0),
       padding:const EdgeInsets.all(5),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(7),
         color: Colors.white70,
       ),
       child: Column(
         // this children have ( general info that : title, price , and location
         // .
         children: [
           Row(
             children: const [
               Padding(
                 padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                 child: Text(
                   "معلومات عامة",
                   style: TextStyle(
                     fontSize: 20,
                     fontFamily: 'IBM',
                   ),
                 ),
               ),
               Expanded(child: Text(""),),

             ],
           ),
           //title
           Row(
             children: [
               Padding(
                 padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                 child: Text(title,
                     style: const TextStyle(
                       color: Colors.black87,
                       fontSize: 18,
                       fontFamily: 'IBM',
                     )),
               ),
             ],
           ),
           // location
           Row(
             children: [
               Padding(
                 padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                 child: Text(
                   "المكان:$city-$location",
                   textDirection: TextDirection.rtl,
                   style: TextStyle(
                     color: Colors.grey.shade800,
                     fontFamily: 'IBM',
                   ),
                 ),
               ),
             ],
           ),
           //price
           Row(
             children: [
               Padding(
                 padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                 child: Text(
                   "الأجرة:$price",
                   style: const TextStyle(
                     color: Colors.orange,
                     fontFamily: 'IBM',
                   ),
                 ),
               ),
               const Padding(
                 padding: EdgeInsets.fromLTRB(0, 0, 3, 10),
                 child: Text("شيكل/شهري",
                     style: TextStyle(
                       color: Colors.orange,
                       fontSize: 16,
                       fontFamily: 'IBM',
                     )),
               ),
               const Expanded(child: Text("")),

               Padding(

                 padding: const EdgeInsets.fromLTRB(0, 0, 5, 10),
                 child: Text("العدد المسموح به:$numberOfAllowedStudnet",
                     style: const TextStyle(
                       color: Colors.grey,
                       fontSize: 16,
                       fontFamily: 'IBM',
                     )),
               ),
             ],
           )
         ],
       ),
     );
   }
 }

  //general info about apartment

