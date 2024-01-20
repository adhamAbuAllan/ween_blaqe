import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ween_blaqe/core/utils/styles/text_style/aline_style.dart';

import '../../../../constants/nums.dart';
import '../../../../core/utils/funcations/go_url_launcher_methodes/go_to_whatsapp_method.dart';

class TheAdIsFreeOrNot extends StatelessWidget {
  const TheAdIsFreeOrNot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: kPrimaryColor,
      bottomColor: Colors.transparent,
      child: Scaffold(
        backgroundColor: kBackgroundAppColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
        ),
        body: Column(
          children: [
            //title
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              padding: const EdgeInsets.fromLTRB(0, 50, 25, 10),
              child: Text(
                "كم يُكلفة الإشتراك لعرض إعلاناتي داخل تطبيق وين بلاقي؟",
                style: TextStyle(
                  fontSize: 20.0,
                  color: kTextColor.withOpacity(.8),
                  fontFamily: 'IBM',
                  inherit: false,
                ),
              ),
            ),

            // Container(
            //   width: double.infinity,
            //   margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
            //   child: Text(
            //     "التكلفة ",
            //     style: TextStyle(
            //       fontSize: 18.0,
            //       color: Colors.grey.shade800,
            //       fontFamily: 'IBM',
            //       inherit: true,
            //     ),
            //   ),
            // ),
            // Container(
            //   width: double.infinity,
            //   margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
            //   child: Text(
            //     // "الخطة السنوية : عند شرائك الخطة السنوية لأول مرة تكون تكلفة الاشتراك هي 1100 شيقل ، و عند تجديد الاشتراك تكون تكلفة الاشتراك 1200 شيقل",
            //     "",
            //     style: TextStyle(
            //       fontSize: 16.0,
            //       color: Colors.grey.shade800,
            //       fontFamily: 'IBM',
            //       inherit: true,
            //     ),
            //   ),
            // ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(25, 0, 30, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "أعرض إعلاناتك بلا حدود على تطبيق وين بلاقي بتكلفة قليلة نسبيًا",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'IBM',
                      color: kTextColor.withOpacity(.8),
                      inherit: true,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              style: TextStyle(
                                fontFamily: "IBM",
                                fontSize: 22,
                                color: kTextColor.withOpacity(.8),
                              ),
                              text: "التكلفة الشهرية: "),
                          TextSpan(
                              style: TextStyle(
                                fontFamily: "IBM",
                                color: kTextColor.withOpacity(.8),
                                fontSize: 22,
                              ),
                              text: "199"),
                        ])),
                        const SizedBox(
                          width: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: FaIcon(
                            FontAwesomeIcons.shekelSign,
                            size: 18,
                            color: kTextColor.withOpacity(.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 140,
                          child: RichText(
                              softWrap: true,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      style: TextStyle(
                                        fontFamily: "IBM",
                                        fontSize: 22,
                                        color: kTextColor.withOpacity(.8),
                                      ),
                                      text: "التكلفة السنوية:"),
                                ],
                              )),
                        ),
                        SizedBox(
                          child: Column(
                            children: [


                              SizedBox(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      child: RichText(
                                          softWrap: true,
                                          text: const TextSpan(children: [
                                            TextSpan(
                                                style: TextStyle(
                                                  fontFamily: "IBM",
                                                  color: kTextColor,
                                                  decoration: TextDecoration
                                                      .lineThrough,decorationColor: Colors.red,
                                                  fontSize: 24,
                                                ),
                                                text: "2388")
                                          ])),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    const FaIcon(
                                      size: 20,
                                      FontAwesomeIcons.shekelSign,
                                      color: kTextColor,
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          style: TextStyle(
                                            fontFamily: "IBM",
                                            color: kTextColor.withOpacity(.8),
                                            fontSize: 20,
                                          ),
                                          text: "1999",
                                        )
                                      ])),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.shekelSign,
                                      size: 16,
                                      color: kTextColor.withOpacity(.8),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const Divider(thickness: 1),
                  const SizedBox(height: 10,),
                  aline,
                  Row(
                    children: [
                      const Text(
                          softWrap: true,
                          "إشترك الأن من خلال التواصل عبر ",style: TextStyle(
                        fontFamily: "IBM",
                        fontSize: 14,
                        color: kTextColor


                      )),
                      TextButton(
                        style: ButtonStyle(overlayColor: MaterialStatePropertyAll(const Color(0xff25D366).withOpacity(.0),) ),

                        child: const Text("واتس أب",style: TextStyle(
                        fontFamily: "IBM",
                        fontSize: 14,
                        color: Color(0xff25D366),


                      )),onPressed: (){
                        sendMessageToWhatsApp(
                            '2569339613', "السلام عليكم، ",image: "");
                      },),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
