import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import 'package:ween_blaqe/constants/nums.dart';
import 'package:ween_blaqe/constants/strings.dart';
import 'package:ween_blaqe/core/utils/funcations/route_pages/push_routes.dart';

 



class SearchNotFound extends StatefulWidget {
  const SearchNotFound({Key? key}) : super(key: key);

  @override
  State<SearchNotFound> createState() => _SearchNotFoundState();
}

class _SearchNotFoundState extends State<SearchNotFound> {
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: kPrimaryColor,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    //this container have 6 Text Widgets that in Row because
                    // they tow items container and expanded widget
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(210, 100, 10, 0),
                        child: Text("لا توجد نتائج بحث عن",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'IBM',
                              inherit: true,
                              color: Colors.grey.shade800,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(170, 0, 10, 20),
                        child: Text("سكن طلاب في مدينة أريحا",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'IBM',
                              inherit: true,
                              color: Colors.grey.shade600,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(75, 0, 10, 10),
                        child: Text("إليك بعض الاقتراحات لبحث أكثر جدوى:",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'IBM',
                              inherit: true,
                              color: Colors.grey.shade800,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(88.2, 0, 10, 0),
                        child: Text("• تأكد من كتابة الكلمات بشكل صحيح.",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'IBM',
                              inherit: true,
                              color: Colors.grey.shade800,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(211.7, 0, 10, 0),
                        child: Text("• جرّب كلمات مختلفة.",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'IBM',
                              inherit: true,
                              color: Colors.grey.shade800,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(43.7, 0, 10, 0),
                        child: Text("• جرّب استخدام كلمات لمدن معروفة في بلدك",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'IBM',
                              inherit: true,
                              color: Colors.grey.shade800,
                            )),
                      ),
                    ]),
                    const Expanded(
                      child: Text(""),
                    ),
                  ],
                ),
                //
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Image(
                    image: AssetImage(
                        "assets/images/error_images/search_not_found.png"),
                    height: 170,
                    width: 170,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                  child: TextButton(
                    child: const Text(
                      "البحث في مدينة اخرى",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'IBM',
                          decoration: TextDecoration.underline),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}





class TypeNotFound extends StatefulWidget {
  const TypeNotFound({Key? key,this.type}) : super(key: key);
  final String ? type;
  @override
  State<TypeNotFound> createState() => _TypeNotFoundState();
}

class _TypeNotFoundState extends State<TypeNotFound> {
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: kPrimaryColor,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    //this container have 6 Text Widgets that in Row because
                    // they tow items container and expanded widget
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(210, 100, 10, 0),
                        child: Text("لا توجد نتائج عن",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'IBM',
                              inherit: true,
                              color: Colors.grey.shade800,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(11*20, 0, 10, 20),
                        child: Text(" سكن ${widget.type}",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'IBM',
                              inherit: true,
                              color: Colors.grey.shade600,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(75, 0, 10, 10),
                        child: Text("  سيتم إضافة شقق لل${widget.type} قريبًا",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'IBM',
                              inherit: true,
                              color: Colors.grey.shade800,
                            )),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(88.2, 0, 10, 0),
                      //   child: Text("• تأكد من كتابة الكلمات بشكل صحيح.",
                      //       style: TextStyle(
                      //         fontSize: 16.0,
                      //         fontFamily: 'IBM',
                      //         inherit: true,
                      //         color: Colors.grey.shade800,
                      //       )),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(211.7, 0, 10, 0),
                      //   child: Text("• جرّب كلمات مختلفة.",
                      //       style: TextStyle(
                      //         fontSize: 16.0,
                      //         fontFamily: 'IBM',
                      //         inherit: true,
                      //         color: Colors.grey.shade800,
                      //       )),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(43.7, 0, 10, 0),
                      //   child: Text("• جرّب استخدام كلمات لمدن معروفة في بلدك",
                      //       style: TextStyle(
                      //         fontSize: 16.0,
                      //         fontFamily: 'IBM',
                      //         inherit: true,
                      //         color: Colors.grey.shade800,
                      //       )),
                      // ),
                    ]),
                    const Expanded(
                      child: Text(""),
                    ),
                  ],
                ),
                //
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Image(
                    image: AssetImage(
                        "assets/images/error_images/search_not_found.png"),
                    height: 170,
                    width: 170,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                  child: TextButton(
                    child: const Text(
                      "إعادة الطلب",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'IBM',
                          decoration: TextDecoration.underline),
                    ),
                    onPressed: () {
                      myPushReplacementNamed(MyPagesRoutes.main,context: context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}