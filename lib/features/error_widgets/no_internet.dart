import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

// import 'package:carousel_slider/carousel_slider.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';
import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/sesstion/new_session.dart';
import '../../constants/get_it_controller.dart';
import '../../controller/get_controllers.dart';
import '../../core/utils/styles/button.dart';
import '../../core/widgets/buttons/lines_buttons/line_buttons.dart';
import '../widgets_before_user_reg/account_before_login.dart';
// import 'package:carousel_slider_plus/carousel_controller.dart';

main() {
  runApp(const MaterialApp(
    home: NoInternet(),
  ));
}

class NoInternet extends StatefulWidget {
  const NoInternet({
    super.key,
    this.isHaveAppBar,
  });

  final bool? isHaveAppBar;

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> with WidgetsBindingObserver {
  bool isWantToSepha = false;
  bool isContExpanding = false;
  bool isSephaCountrEnd = false;
  bool isAnimate = false;
  bool isFirstAnimate = false;
  bool isSecondAnimate = false;
  bool isLongPress = false;
  bool isDataLoding = false;
  bool onPerrsed = false;
  int sephaCounter = 0;
  int index = 0;
  int total = 0;
  int onLongPressCounter = 17;

  CarouselSliderController controller = CarouselSliderController();

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
    debugPrint("is snack bark show in init State in NoInternet class :  "
        "--${connectivityController.isSnackBarShow.value}");
    super.initState();
    NewSession.get("language", "ar") == 'en'
        ? sephaText = [
            "Subhan Allah",
            "Alhamdulillah",
            "La Ilaha Illallah",
            "Allahu Akbar",
            "Subhan Allah Wabihamdih",
            "Subhan Allah Azim",
            "Astaghfirullah",
          ]
        : sephaText;

    connectivityController.isSnackBarShow.value = false;

    WidgetsBinding.instance.addObserver(this);
    loadTotal();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Load the total value from SharedPreferences when the app is resumed
      loadTotal();
    }
  }

  void loadTotal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      total = prefs.getInt('total') ?? 0;
    });
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
      bottomColor: Colors.transparent,
      color: themeMode.isLight ? kPrimaryColorLightMode : kPrimaryColorDarkMode,
      child: StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            // debugPrint("snapshot data : ${snapshot.data}");
            return Scaffold(
              appBar: connectivityController.isConnection()
                  ? AppBar(
                      backgroundColor: themeMode.isLight
                          ? kPrimaryColorLightMode
                          : kPrimaryColorDarkMode)
                  : AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      foregroundColor: Colors.transparent,
                      actionsIconTheme: const IconThemeData(
                        color: Colors.transparent,
                        size: 1,
                        opacity: 0,
                      ),
                      iconTheme: const IconThemeData(
                        color: Colors.transparent,
                        size: 1,
                        opacity: 0,
                      ),
                    ),
              backgroundColor: themeMode.isLight
                  ? kBackgroundAppColorLightMode
                  : kBackgroundAppColorDarkMode,
              body: SingleChildScrollView(
                child: AnimatedAlign(
                  alignment:
                      isWantToSepha ? Alignment.center : Alignment.topCenter,
                  duration: const Duration(milliseconds: 800),
                  child: AnimatedContainer(
                    margin: EdgeInsets.fromLTRB(0,getIt<AppDimension>()
                        .isSmallScreen(context)? 50:
                        100, 0,
                        0),
                    width: getIt<AppDimension>().isSmallScreen(context)
                        ? 373 / 1.2
                        : 373,
                    height: isWantToSepha
                        ? (getIt<AppDimension>().isSmallScreen(context)
                            ? 500 / 1.55
                            : 500)
                        : (connectivityController.isConnection() ? 170 : 170),
                    onEnd: () {
                      setState(() {
                        isContExpanding = false;
                      });
                    },
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: themeMode.isLight
                          ? kContainerColorLightMode
                          : kContainerColorDarkMode,
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
                        connectivityController.isConnection()
                            ? SizedBox(
                                height: getIt<AppDimension>().isSmallScreen
                                  (context) ? 10 :10 * 3,
                              )
                            : buildCounterTextRow(),
                        connectivityController.isConnection()
                            ? const SizedBox()
                            : aline,
                        // !isContExpanding?const SizedBox() :  const AnimatedSize(
                        //   duration: Duration(milliseconds: 2800),
                        //   curve: Curves.linear,
                        //   child: SizedBox(height: 80),
                        // ),
                        isWantToSepha
                            ? AnimatedSize(
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.linear,
                                child:
                                    SizedBox(height: !isContExpanding ? 
                                    (getIt<AppDimension>().isSmallScreen
                                      (context)?0:60) :
                                    0),
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
                                child: SizedBox(
                                  height: 25,
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
                                              style: TextStyle(
                                                  
                                                  color: themeMode.isLight
                                                      ? kPrimaryColorLightMode
                                                      : kPrimaryColorDarkMode)),
                                    ],
                                  ),
                                ),
                              ),
                
                        isWantToSepha
                            ? (!isContExpanding
                                ? buildBorderSebhaContainer()
                                : const SizedBox())
                            : connectivityController.isConnection()
                                ? aline
                                : const SizedBox(),
                        isWantToSepha
                            ? AnimatedSize(
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.linear,
                                child: SizedBox(
                                    height: getIt<AppDimension>()
                                            .isSmallScreen(context)
                                        ? 80 / 1.3
                                        : 80),
                              )
                            : const SizedBox(),
                
                        isWantToSepha
                            ? (!isContExpanding
                                ? Column(
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        height: getIt<AppDimension>()
                                                .isSmallScreen(context)
                                            ? 55 / 1.2
                                            : 55,
                                        child: buildSebhaElevatedButton(),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        height: getIt<AppDimension>()
                                                .isSmallScreen(context)
                                            ? 55 / 1.2
                                            : 55,
                                        child: OutlinedButton(
                                            style: outlinedButton(
                                                themeMode: themeMode,context:
                                            context),
                                            onPressed: () {
                                              setState(() {
                                                total = 0;
                                                saveTotal(total);
                                              });
                                            },
                                            child: Text(
                                                SetLocalization.of(context)!
                                                    .getTranslateValue("reset"))),
                                      ),
                                    ],
                                  )
                                : const SizedBox())
                            : (isContExpanding
                                ? const AnimatedSize(
                                    duration: Duration(seconds: 1))
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
                                      SetLocalization.of(context)!
                                          .getTranslateValue("start_tasbih"),
                                      image: Image.asset(
                                          "assets/images/tasbih.png",
                                          color: themeMode.isLight
                                              ? kTextColorLightMode
                                              : kTextColorDarkMode,
                                          width: 35,
                                          height: isContExpanding ? 0 : 35),
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
              floatingActionButton: connectivityController.isConnection()
                  ? FloatingActionButton(
                      tooltip: SetLocalization.of(context)!
                          .getTranslateValue('reload'),
                      onPressed: () {
                        cityModelController.cityId.value = 0;
                        pushToMainPage();
                      },
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(16 / 2)),
                      backgroundColor: themeMode.isLight
                          ? kPrimaryColorLightMode
                          : kPrimaryColorDarkMode,
                      child: const FaIcon(
                        FontAwesomeIcons.rotateRight,
                      ),
                    )
                  : const SizedBox(),
            );
          }),
    );
  }

  ///////////////////////////////////
  //////////////////////////////////
  /////////////////////////////////
//Widgets that usaged in build widget
  //text counter , have two part
  Row buildCounterTextRow() {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 5, 10),
        child: Image(
          image: const AssetImage("assets/images/error_images/no network.png"),
          height: getIt<AppDimension>().isSmallScreen(context) ? 60 / 1.5 : 60,
          color: themeMode.isLight ? kTextColorLightMode : kTextColorDarkMode,
          width: getIt<AppDimension>().isSmallScreen(context) ? 60 / 1.5 : 60,
        ),
      ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 5, 0),
            child: RichText(
              softWrap: true,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: SetLocalization.of(context)!
                        .getTranslateValue("no_internet_connection"),
                    style: TextStyle(
                        fontSize: 16.0,
                        
                        inherit: true,
                        color: themeMode.isLight
                            ? kTextColorLightMode
                            : kTextColorDarkMode),
                  ),
                ],
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: SetLocalization.of(context)!
                        .getTranslateValue("try_enabling_mobile_data_or_wifi"),
                    style: const TextStyle(
                        fontSize: 16,
                        
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
          textStyle: TextStyle(
              
              color: themeMode.isLight
                  ? kPrimaryColorLightMode
                  : kPrimaryColorDarkMode),
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
            color: themeMode.isLight
                ? kPrimaryColorLightMode
                : kPrimaryColorDarkMode,
          )),
      height: 100,
      child: buildSebhaCarouselSlider(),
    );
  }

  //SebhaSlider
  CarouselSlider buildSebhaCarouselSlider() {
    return CarouselSlider(
      items: sephaText.asMap().entries.map((entry) {
        return Builder(builder: (BuildContext context) {
          index = entry.key;
          debugPrint(entry.value);

          return Align(
              alignment: Alignment.center,
              child: Text(
                entry.value,
                style: TextStyle(
                    fontSize: 24,
                    
                    color: themeMode.isLight
                        ? kTextColorLightMode
                        : kTextColorDarkMode),
              ));
        });
      }).toList(),
      controller: controller,
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
        style: fullButton(),
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
                saveTotal(total);
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
        child: Text(
          SetLocalization.of(context)!.getTranslateValue("tasbih"),
          style: TextStyle(color: Colors.white.withOpacity(.95)),
        ));
  }

  var loading = false;

  Future<void> pushToMainPage() async {
    studentController.index = 0;
    await myPushNameAndRemoveUntil(
        context,
        MyPagesRoutes.main,
        (route) => route.settings.name == MyPagesRoutes.main,
        (NewSession.get("logged", "def") == "ok"
            ? MyPagesRoutes.accountOfOwner
            : MyPagesRoutes.accountBeforeLoginInStudent));
    // await  Navigator.of(context).push(MaterialPageRoute(
    //       builder: (BuildContext context) => const HomeBeforeAddData())
    // );

    // studentController.index = 0;
  }
}

void saveTotal(int totalValue) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('total', totalValue);
}

class InternetConnectivityChecker extends StatelessWidget {
  final Widget child;

  const InternetConnectivityChecker({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (connectivityController.isConnection() == false) {
          return const NoInternet(
            isHaveAppBar: false,
          );
        } else if (connectivityController.isConnection()) {
          // Corrected condition
          return child;
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
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
