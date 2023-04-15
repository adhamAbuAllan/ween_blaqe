import 'package:flutter/material.dart';
import 'package:ween_blaqe/styles/text_style/aline_style.dart';

import '../../styles/button_of_acount.dart';
class NoInternet extends StatefulWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body:Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 110, 0, 0),
              child: Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  width: 373,
                  height: 200,
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,),
                  child: Column(children: [
                    Row(children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 5, 10),
                        child: Image(image: AssetImage("assets/images/error_images/no network.png"),height: 60,width: 60,),
                      ),

                      Column(children:  [

                        Padding(
                          padding: const EdgeInsets.fromLTRB(100, 0, 5, 0),
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                  'لا يتوفّر اتصال بالانترنت.',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'IBM',
                                      inherit: true,
                                      color: Colors.black87),
                                ),

                              ],
                            ),
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                            children: <TextSpan>[

                              TextSpan(
                                  text: ' جرّب تفعيل بيانات الجوّال أو تفعيل Wi-Fi',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'IBM',
                                      inherit: true,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),


                      ],)

                    ]),
                    aline,
                    ElevatedButton(style: clearButtonWhite,onPressed: (){}, child: Row(children: const [

                      Text("إعادة المحاولة"
                        ,style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'IBM',
                            color:Colors.black87
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0,0),
                        child: Image(image: AssetImage("assets/images/error_images/refresh.png"),height: 32,width: 32,),
                      )
                    ],)),
                    aline,
                    ElevatedButton(style: clearButtonWhite,onPressed: (){}, child: Row(children: const [

                      Text("تفعيل بيانات الهاتف"
                        ,style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'IBM',
                            color:Colors.black87
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0,0),
                        child: Icon(Icons.signal_cellular_alt,size: 32,color: Colors.black87,),
                      )
                    ],)),

                  ],),
                ),
              ),
            ),

          ),
          const Expanded(child: Text(""),flex: 1,),
        ],
      ) ,
    );
  }
}
