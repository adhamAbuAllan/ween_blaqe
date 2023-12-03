import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/features/user/studnet/from_master_home_to_show_more/new_master_home.dart';
import '../../core/utils/styles/button.dart';
import '../../core/widgets/buttons/lines_buttons/line_buttons.dart';
import '../../main.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({
    Key? key,
  }) : super(key: key);

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  bool isWantToSepha = false;
  bool isContExpanding = false;
  bool isSephaCountrEnd = false;
  bool isAnimate = false;
  bool isFirstAnimate = false;
  bool isSecondAnimate = false;
  bool isLongPress = false;
  bool isDataLoding  = false;
  int sephaCounter = 0;
  int index = 0;
  int total = 0;
  int onLongPressCounter = 17;


  CarouselController controller = CarouselController();
  List<String> sephaText = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله اكبر",
    "سبحان الله وبحمده",
    "سبحان الله العظيم",
    "استغفر الله",
    "ولا حول ولا قوة إلا بالله",
  ];

  @override
  void initState() {
    super.initState();
  }
//   Container yourFirstChildWidget (){
//     return Container();
//   }
//   Container yourSecondChildWidget (){
//     return Container();
//   }
// AnimatedContainer yourChildrenWidgets (){
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 700),
//       curve: Curves.linear,
//       width: 373,
//       height: isAnimate ? 80: 80*3, //Assume that 80 is the height of the
//       // container, then 3 is the total number of containers,
//       decoration: const BoxDecoration(color: Colors.transparent),
//       child:  Column(children: [
//         yourFirstChildWidget(),
//         yourSecondChildWidget(),
//       ],),
//     );
// }
// GestureDetector yourPerantWidget (){
//     return  // in your peran widget
//       GestureDetector(
//         onTap: () {
//           setState(() {
//             isAnimate != isAnimate;
//           });
//         },
//       );
// }
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent ,
      color: kPrimaryColor,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body:AnimatedAlign(
          alignment: isWantToSepha ? Alignment.center : Alignment.topCenter,
          duration: const Duration(milliseconds: 800),
          child: AnimatedContainer(
            margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            width: 373,
            height: isWantToSepha ? 500 : 170,
            onEnd: () {
              setState(() {
                isContExpanding = false;
              });
            },
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
            ),
            duration: const Duration(milliseconds: 800),
            child: Column(
              children: [

                //
                // isAnimate ? AnimatedAlign(duration: const Duration(milliseconds: 700),
                //     curve: Curves.linear,
                //     alignment: Alignment.bottomCenter,
                //     child: yourChildrenWidgets()) : yourPerantWidget(),
                //



                buildCounterTextRow(),
                aline,
                // !isContExpanding?const SizedBox() :  const AnimatedSize(
                //   duration: Duration(milliseconds: 2800),
                //   curve: Curves.linear,
                //   child: SizedBox(height: 80),
                // ),
                isWantToSepha
                    ? AnimatedSize(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.linear,
                  child: SizedBox(height: !isContExpanding ? 60 : 0),
                )
                    : const SizedBox(),
                isContExpanding
                    ? const AnimatedSize(
                    duration: Duration(milliseconds: 2900),
                    curve: Curves.linear,
                    child: SizedBox())
                    : AnimatedAlign(
                  duration: const Duration(milliseconds: 2900),
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      isAnimate
                          ? SizedBox(
                        height: 28,
                        child: buildAnimatedTextKit(),
                      )
                          : Text("$total+",
                          style: const TextStyle(
                              fontFamily: "IBM",
                              color: Colors.orange)),
                    ],
                  ),
                ),

                isWantToSepha
                    ? (!isContExpanding
                    ? buildBorderSebhaContainer()
                    : const SizedBox())
                    : const SizedBox(),
                isWantToSepha
                    ? AnimatedSize(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.linear,
                  child: SizedBox(height: !isContExpanding ? 150 : 80),
                )
                    : const SizedBox(),

                isWantToSepha
                    ? (!isContExpanding
                    ? SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: buildSebhaElevatedButton(),
                )
                    : const SizedBox())
                    : (isContExpanding
                    ? const AnimatedSize(duration: Duration(seconds: 1))
                    : AnimatedAlign(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.bounceInOut,
                  alignment: Alignment.bottomCenter,
                  child: buttonHaveTitleAndIcon(
                        () {
                      setState(() {
                        isWantToSepha = true;
                        isContExpanding = true;
                      });
                    },
                    "إبدأ التسبيح",
                    image: Image.asset("assets/images/tasbih.png",
                        width: 35, height: isContExpanding ? 0 : 35),
                    isIcon: false,
                  ),
                ))
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
  ///////////////////////////////////
  //////////////////////////////////
  /////////////////////////////////
//Widgets that usaged in build widget
  //text counter , have two part
  Row buildCounterTextRow() {
    return Row(children: [
      const Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 5, 10),
        child: Image(
          image: AssetImage("assets/images/error_images/no network.png"),
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
        ],
      )
    ]);
  }

// counter
  AnimatedTextKit buildAnimatedTextKit() {
    return AnimatedTextKit(
      totalRepeatCount: 3,
      pause: Duration.zero,
      onFinished: () {
        setState(() {
          isAnimate = false;
        });
      },
      //aniatedTextOfCounter
      animatedTexts: [
        FadeAnimatedText(
          "$total+",
          textStyle: const TextStyle(fontFamily: "IBM", color: Colors.orange),
          duration: const Duration(
            milliseconds: 100,
          ),
        ),
      ],
    );
  }

//containerOfSebha
  Container buildBorderSebhaContainer() {
    //BordarOfSebhaContaner
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(7)),
          border: Border.all(
            width: 1,
            color: kPrimaryColor,
          )),
      height: 100,
      child: buildSebhaCarouselSlider(),
    );
  }

  //SebhaSlider
  CarouselSlider buildSebhaCarouselSlider() {
    return CarouselSlider(
      items: sephaText
          .asMap()
          .entries
          .map((entry) {
        return Builder(builder: (BuildContext context) {
          index = entry.key;
          debugPrint(entry.value);

          return Align(
              alignment: Alignment.center,
              child: Text(
                entry.value,
                style: const TextStyle(fontSize: 24, fontFamily: "IBM"),
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
    );
  }

//SebhaButton
  ElevatedButton buildSebhaElevatedButton() {
    return ElevatedButton(
        style: fullButton,
        onLongPress: () {
          setState(() {
            isLongPress = true;

            onLongPressCounter++;


            // index = onLongPressCounter;
            controller.animateToPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
                onLongPressCounter);
            debugPrint("longPressCounter = $onLongPressCounter");
          });

          // setState(() {
          // if(isLongPress){
          //    debugPrint("isLongPress in ifStatment : $isLongPress");
          //    // index = onLongPressCounter;
          // }
          Duration(milliseconds: onLongPressCounter);
          //
          // });

          Vibration.vibrate(duration: onLongPressCounter);
          setState(() {
            sephaCounter++;

            debugPrint("long prees is Finish");
          });
        },

        onPressed: () async {
          setState(() {
            onLongPressCounter = 17;
            isLongPress = false;
            Vibration.vibrate(duration: 10);

            if (index <= sephaText.length) {
              isSephaCountrEnd = false;
              isAnimate = false;
              isFirstAnimate = false;
              isSecondAnimate = false;
              debugPrint("sephaCounter++ : $sephaCounter++");
              debugPrint("index++ : $index++");
              return setState(() {
                controller.animateToPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                    index);
                total++;

                total % 10 == 0 ? isAnimate = true : false;
                isAnimate ? isSephaCountrEnd = true : isSephaCountrEnd = false;
                isAnimate ? isFirstAnimate = true : isFirstAnimate = false;
                !isFirstAnimate
                    ? isSecondAnimate = true
                    : isSecondAnimate = false;
              });
            }
            setState(() {
              // index = 0;
              // isSephaCountrEnd = !isSephaCountrEnd;

              // if(isSephaCountrEnd = !isSephaCountrEnd){
              //   setState(() {
              //     sephaCounter+1;
              //
              //   });
              // }
            });
          });
        },
        child: const Text("سّبح"));
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
