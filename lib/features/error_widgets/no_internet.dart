import 'dart:collection';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';
import 'package:ween_blaqe/constants/nums.dart';
import '../../core/utils/styles/button.dart';
import '../../core/widgets/buttons/lines_buttons/line_buttons.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({
    Key? key,
  }) : super(key: key);

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  bool isWantToSepha = false;
  int isContExpands = 0;

  int sephaCounter = 0;
  int index = 0;
  int total = 0;
  List<String> sephaText = ["s1", "a1", "b3", ",e4", "f5"];
  CarouselController controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: kPrimaryColor,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: AnimatedAlign(
          alignment: isWantToSepha ? Alignment.center : Alignment.topCenter,
          duration: const Duration(milliseconds: 700),
          child: AnimatedContainer(
            margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            width: 373,
            height: isWantToSepha ? 500 : 170,
            // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
            ),
            duration: const Duration(milliseconds: 700),
            child: Column(
              children: [
                Row(children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 5, 10),
                    child: Image(
                      image: AssetImage(
                          "assets/images/error_images/no network.png"),
                      height: 60,
                      width: 60,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(100, 0, 5, 0),
                        child: RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'لا يتوفّر اتصال بالانترنت.',
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
                                text:
                                    ' جرّب تفعيل بيانات الجوّال أو تفعيل Wi-Fi',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'IBM',
                                    inherit: true,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  )
                ]),
                aline,
                Row(children: [
                  sephaCounter != 0
                      ? AnimatedTextKit(animatedTexts: [

                    FadeAnimatedText(
                        duration:
                        const Duration(milliseconds: 700),
                        "$total+",
                        textStyle: const TextStyle(
                            fontFamily: "IBM",
                            color: Colors.orange)),
                  ])
                      : Text("$total+",
                      style: const TextStyle(
                          fontFamily: "IBM", color: Colors.orange)),
                ],),
                isWantToSepha
                    ? AnimatedAlign(
                  alignment: Alignment(isWantToSepha ? -.5 : .5,isWantToSepha ? -.5:.5),
                      duration: const Duration(milliseconds: 5000),
                      child: CarouselSlider(
                          items: sephaText.map((entry) {
                            return Builder(builder: (BuildContext context) {
                              return Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    entry[index],
                                    style: const TextStyle(
                                        fontSize: 24, fontFamily: "IBM"),
                                  ));
                            });
                          }).toList(),
                          carouselController: controller,
                          options: CarouselOptions(

                              // onPageChanged: (i, reason) {
                              //   setState(() {
                              //     index = i;
                              //   });
                              // },
                              scrollDirection: Axis.vertical,
                              height: 50),
                        ),
                    )
                    : const SizedBox(),

                isWantToSepha
                    ? AnimatedAlign(
                  duration: const Duration(milliseconds: 4050),

                 alignment:    Alignment(isContExpands<2 ? -.5: .5,isContExpands<2 ? -.5: .5) ,
                      child: SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                            style: fullButton,
                            onPressed: () async {
                              setState(() {
                                if (sephaCounter < sephaText.length) {
                                  sephaCounter++;
                                  total++;
                                  debugPrint(
                                      "sephaCounter++ : $sephaCounter++");
                                  return setState(() {
                                    controller.animateToPage(
                                        duration: const Duration(
                                            milliseconds: 700),
                                        curve: Curves.linear,
                                        sephaCounter);
                                  });
                                }
                                setState(() {
                                  sephaCounter = 0;
                                });
                              });
                            },
                            child: const Text("سّبح")),
                      ),
                    )
                    : buttonHaveTitleAndIcon(
                        () {
                          setState(() {
                            isWantToSepha = true;
                          });
                        },
                        "إبدأ التسبيح",
                        image: Image.asset("assets/images/tasbih.png",
                            width: 35, height: 35),
                        isIcon: false,
                      )

                // const Icon(
                //   // Icons.tasb,
                //   FontAwesomeIcons.tas
                //   color: Colors.black,
                //   size: 27,
                // )),
                // aline,
                // buttonHaveTitleAndIcon(
                //     () {},
                //     "تفعيل بيانات الهاتف",
                //     const Icon(
                //       Icons.cell_wifi_outlined,
                //       size: 27,
                //       color: Colors.black,
                //     ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  var loading = false;
}

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   void _restartApp(BuildContext context) {
//     // Restart the entire application
//     runApp(MyApp());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Restart App Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             _restartApp(context);
//           },
//           child: Text('Restart App'),
//         ),
//       ),
//     );
//   }
// }
