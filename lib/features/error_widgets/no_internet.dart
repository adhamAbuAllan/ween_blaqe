import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';
import 'package:ween_blaqe/constants/nums.dart';
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
        body: Align(
          alignment: Alignment.topCenter,
          child: AnimatedContainer(
            margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            width: 373,
            height: isWantToSepha ? 700 : 210,
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
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

                buttonHaveTitleAndIcon(
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
