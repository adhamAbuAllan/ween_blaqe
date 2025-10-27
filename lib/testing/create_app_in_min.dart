import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/get_it_controller.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/elevated_button_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//hide debug banner,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        useMaterial3: false,
        fontFamily: 'Cairo',
      ),
      home: Scaffold(
        backgroundColor: Color(0xff2B2B2B),
        appBar: AppBar(backgroundColor: Color(0xff2B2B2B)
      ,
          title: Text('صفحة بناء التطبيق',style: TextStyle(color: Color(0xfdfCfCfC)),
          
          ),
        ),
        //add a  Column widget here
        // in it add a button

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              // add padding horizontally 20
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'قم بالضغط على الزر أدناه لإنشاء التطبيق الخاص بك',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,
                  color: Color(0xfdfCfCfC)
                  ),
                ),
              ),
              ElevatedButton(
                style: fullButton(color: Colors.blue.shade900, context: context),
                onPressed: () {
                  // Handle button press
                },
                child: Padding(
                  //infinite horizontal padding 20
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'إضغط هنا',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white54),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ButtonStyle fullButton(
      {required Color color, required BuildContext context}) {
    return ElevatedButton.styleFrom(
      backgroundColor: color,
      elevation: 0,
      textStyle: TextStyle(
        fontFamily: "Cairo",
        fontWeight: FontWeight.w500,
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7))),
    );
  }
}
