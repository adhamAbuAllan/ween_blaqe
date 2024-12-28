import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

// import 'package:carousel_slider/carousel_slider.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';
import 'package:ween_blaqe/constants/coordination.dart';
import 'package:ween_blaqe/constants/localization.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';
import 'package:ween_blaqe/session/new_session.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/elevated_button_widget.dart';
import 'package:ween_blaqe/view/common_widgets/button_widgets/outline_button_widget.dart';
import '../../constants/get_it_controller.dart';
import '../../controller/get_controllers.dart';
import '../../controller/provider_controllers/providers/color_provider.dart';
import '../../core/widgets/buttons/lines_buttons/line_buttons.dart';
import '../common_widgets/aline_widget.dart';
// import 'package:carousel_slider_plus/carousel_controller.dart';

class NoInternetUi extends ConsumerStatefulWidget {
  const NoInternetUi({super.key, this.isHaveAppBar});

  final bool? isHaveAppBar;

  @override
  ConsumerState createState() => _NoInternetUiState();
}

class _NoInternetUiState extends ConsumerState<NoInternetUi>
    with WidgetsBindingObserver {
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

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      bottomColor: Colors.transparent,
      color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref),
      child: StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            return Scaffold(
              appBar: AppBar(
                  backgroundColor: ref
                      .read(themeModeNotifier.notifier)
                      .primaryTheme(ref: ref),
                  title: Text(
                      SetLocalization.of(context)!.getTranslateValue("sebha"))),
              backgroundColor:ref.read(themeModeNotifier.notifier).backgroundAppTheme(ref: ref),

              body: SingleChildScrollView(
                child: AnimatedAlign(
                  alignment:
                      isWantToSepha ? Alignment.center : Alignment.topCenter,
                  duration: const Duration(milliseconds: 800),
                  child: AnimatedContainer(
                    margin: EdgeInsets.fromLTRB(
                        0,
                        getIt<AppDimension>().isSmallScreen(context) ? 50 : 100,
                        0,
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
                      color: ref
                          .read(themeModeNotifier.notifier)
                          .containerTheme(ref: ref),
                    ),
                    duration: const Duration(milliseconds: 800),
                    child: Column(
                      children: [
                        connectivityController.isConnection()
                            ? SizedBox(
                                height:
                                    getIt<AppDimension>().isSmallScreen(context)
                                        ? 10
                                        : 10 * 3,
                              )
                            : buildCounterTextRow(),
                        connectivityController.isConnection()
                            ? const SizedBox()
                            : aline,
                        isWantToSepha
                            ? AnimatedSize(
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.linear,
                                child: SizedBox(
                                    height: !isContExpanding
                                        ? (getIt<AppDimension>()
                                                .isSmallScreen(context)
                                            ? 0
                                            : 60)
                                        : 0),
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
                                                color: ref
                                                    .read(themeModeNotifier
                                                        .notifier)
                                                    .primaryTheme(ref: ref),
                                              )),
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
                                        child: OutlinedButtonWidget(

                                            onPressed: () {
                                              setState(() {
                                                total = 0;
                                                saveTotal(total);
                                              });
                                            },
                                            child: Text(SetLocalization.of(
                                                    context)!
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
                                          color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

                                          width: 35,
                                          height: isContExpanding ? 0 : 35),
                                      isIcon: false,
                                    ),
                                  ))
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
                        pushToMainPage();
                      },
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(16 / 2)),
                      backgroundColor: ref.read(themeModeNotifier.notifier)
                          .primaryTheme(ref: ref),
                child: const FaIcon(
                        FontAwesomeIcons.rotateRight,
                      ),
                    )
                  : const SizedBox(),
            );
          }),
    );
  }

  Row buildCounterTextRow() {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 5, 10),
        child: Image(
          image: const AssetImage("assets/images/error_images/no network.png"),
          height: getIt<AppDimension>().isSmallScreen(context) ? 60 / 1.5 : 60,
          color: ref.read(themeModeNotifier.notifier).textTheme(ref: ref),

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
                        color:ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                    ),
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
              color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref)
          ),
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
            color: ref.read(themeModeNotifier.notifier).primaryTheme(ref: ref)
            ,
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
                    color:ref.read(themeModeNotifier.notifier).textTheme(ref: ref),
                ),
              ));
        });
      }).toList(),
      controller: controller,
      options: CarouselOptions(scrollDirection: Axis.vertical, height: 50),
    );
  }

  //SebhaButton
  ElevatedButtonWidget buildSebhaElevatedButton() {
    return ElevatedButtonWidget(

        onLongPress: () {
          setState(() {
            isLongPress = true;
            onLongPressCounter++;
            controller.animateToPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
                onLongPressCounter);
            debugPrint("longPressCounter = $onLongPressCounter");
          });
          Duration(milliseconds: onLongPressCounter);
          Vibration.vibrate(duration: onLongPressCounter);
          setState(() {
            sephaCounter++;
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
          });
        },
        child: Text(
          SetLocalization.of(context)!.getTranslateValue("tasbih"),
          style: TextStyle(color: Colors.white.withOpacity(.95)),
        ));
  }

  var loading = false;

  Future<void> pushToMainPage() async {
    // studentController.index = 0;
    await myPushNameAndRemoveUntil(
        context,
        MyPagesRoutes.main,
        (route) => route.settings.name == MyPagesRoutes.main,
        (NewSession.get("logged", "def") == "ok"
            ? MyPagesRoutes.accountOfOwner
            : MyPagesRoutes.accountBeforeLoginInStudent));
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
          return const NoInternetUi(
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
