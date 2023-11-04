import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';
import 'package:ween_blaqe/constants/nums.dart';
import '../../core/widgets/buttons/lines_buttons/line_buttons.dart';



class NoInternet extends StatefulWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: kPrimaryColor,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 110, 0, 0),
                child: Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    width: 373,
                    height: 205,
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                    ),
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
                                padding:
                                    const EdgeInsets.fromLTRB(100, 0, 5, 0),
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
                        buttonHaveTitleAndIcon(() {
                          checkWifiStatus();
                        },
                            "أعد المحاولة",
                            const Icon(
                              Icons.refresh,
                              color: Colors.black,
                              size: 27,
                            )),
                        aline,
                        buttonHaveTitleAndIcon(
                            () {},
                            "تفعيل بيانات الهاتف",
                            const Icon(
                              Icons.cell_wifi_outlined,
                              size: 27,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Text(""),
            ),
          ],
        ),
      ),
    );
  }

  var loading = false;
  Future<void> checkWifiStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    loading = true;

    if (connectivityResult == ConnectivityResult.wifi) {
      // loading == true ?
      // CircularProgressIndicator(color: kPrimaryColor,strokeWidth: 2, backgroundColor: Colors.white,)
      //     :
      // Navigator.pop(context);
    } else {
      // loading == true ?
      const CircularProgressIndicator(
        color: kPrimaryColor,
        strokeWidth: 2,
        backgroundColor: Colors.white,
      )
          // :  myPushName(context, MyPagesRoutes.noInternet)
          ;
    }
    loading = false;
  }
}
