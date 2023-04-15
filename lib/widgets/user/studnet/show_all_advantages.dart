import 'package:flutter/material.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/apartments/show_more_classes_widget/advantages_class_widget.dart';

import '../../../api/advantages.dart';
class ShowAllAdvantages extends StatelessWidget {
  const ShowAllAdvantages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child:Column(
          children: [
            //back arrow button
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: IconButton(onPressed: (){
                    Navigator.of(context).pop(context);
                  }, icon: const Icon(Icons.arrow_back_ios,color: Colors.black87,)),
                ),
                const Expanded(child: Text("")),

              ],
            ),
            //all advantages in this container
            Container(
              margin: const EdgeInsets.fromLTRB(10, 50, 10, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.white70,
              ),
              child: Column(
                children: [

                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.fromLTRB(305, 0, 10, 0),
                        child: Text("المزايا",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontFamily: 'IBM',
                            )),
                      ),
                      Expanded(child: Text("")),


                    ],
                  ),
                  AdvantagesClassWidget()


                ],
              ),
            ),
          ],
        )
        ,
      ),
    );
  }
}
