import 'package:flutter/material.dart';
import 'package:ween_blaqe/main.dart';
import 'package:ween_blaqe/styles/button.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          //title-nameApp
           Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 195, 5),
            child: Text(
              "وين بلاقي",
              style: TextStyle(
                  fontSize: 28,
                  inherit: true,
                  fontFamily: 'IBM',
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          //title
          Padding(
            padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
            child: Text(
              "شقق للطلاب",
              style: TextStyle(
                  fontSize: 28.0,
                  inherit: true,
                  fontFamily: 'IBM',
                  color: Colors.orange),
            ),
          ),
          //follow title
          Padding(
            padding: const EdgeInsets.fromLTRB(180, 0, 0, 0),
            child: Text(
              " والطالبات",
              style: TextStyle(
                  fontSize: 28.0,
                  inherit: true,
                  fontFamily: 'IBM',
                  color: Colors.orange),
            ),
          ),
          //past-nameApp
          Padding(
            padding: const EdgeInsets.fromLTRB(130, 0, 0, 0),
            child: Text(
              "...بتلاقي",
              style: TextStyle(
                  fontSize: 28.0,
                  inherit: true,
                  fontFamily: 'IBM',
                  color: Colors.blue),
            ),
          ),
//image of apartment
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 50, 25, 55),
            child: Image.asset('assets/images/apartment_get_started.png'),
          ),
          //button get started
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 25),
            child: SizedBox(
              width: 350,
              height: 55,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder:(context){
                          return Main();
                        })

                    );
                  }, child: Text("لنبدأ"), style: fullButton),
            ),
          ),
        ],
      ),
    );
  }
}
