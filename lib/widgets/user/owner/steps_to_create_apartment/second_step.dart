import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/apartments/create_apartment/container_classes_widget/add_advantages_container_class_widget.dart';
import 'package:ween_blaqe/widgets/user/owner/steps_to_create_apartment/third_step.dart';

import '../../../../styles/button.dart';

class SecondStep extends StatelessWidget {
  const SecondStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var desktopAdvText = "مكتب";
    var desktopAdvIcon =
        "assets/images/apartments_images/advantages/desktop.png";
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: outlineButton,
                    child: const Text("رجوع"),
                  ),
                  const Expanded(child: Text("")),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const ThirdStep();
                        },
                      ));
                    },
                    style: fullButton,
                    child: const Text("التالي"),
                  ),
                ],
              ),
            ),
            //text steps
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                "الخطوة الثانية",
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 20,
                  fontFamily: 'IBM',
                ),
              ),
            ),
            //image steps
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 30),
              child: Image.asset(
                'assets/'
                'images/'
                'apartments_images/'
                'images_to_create_apartment/'
                'step_two.png',
                width: 65,
                height: 65,
                fit: BoxFit.fill,
              ),
            ),
            //this container have 2 main items own: text of advantages , and advantages
            Container(
              margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
              padding: const EdgeInsets.fromLTRB(10, 2, 10, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.white70,
              ),
              child: Column(
                children: [
                  //this row for text
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: Text(
                          "حدد المزايا",
                          style: TextStyle(
                              fontFamily: 'IBM',
                              fontSize: 20,
                              color: Colors.grey.shade800),
                        ),
                      ),
                      const Expanded(child: Text("")),
                    ],
                  ),
                  //here could owner add advantages
                  const AddAdvantages()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
