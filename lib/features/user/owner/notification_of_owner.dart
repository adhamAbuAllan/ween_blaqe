import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';
class NotificationOfOwner extends StatefulWidget {
  const NotificationOfOwner({Key? key}) : super(key: key);

  @override
  State<NotificationOfOwner> createState() => _NotificationOfOwnerState();
}

var show = false;

class _NotificationOfOwnerState extends State<NotificationOfOwner> {
  @override
  Widget build(BuildContext context) {
    var title = "شقة للطلاب في مدينة الخليل";
    var location = "الخليل - واد الهرية";
    var responseFromOwner = "إنتهت فترة الحجز لدى الطالب احمد";
    var image = "assets/images/apartments_images/image1.png";
    var dateOfNotification = "تاريخ 04/14/2023";
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
                  child: Text(
                    "الاشعارات",
                    style: TextStyle(
                      fontSize: 26.0,
                      fontFamily: 'IBM',
                      inherit: true,
                    ),
                  ),
                ),
                Expanded(child: Text("")),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 55),
                  child: Text(
                    "قائمة الاشعارات",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                        fontFamily: 'IBM'),
                  ),
                ),
                const Expanded(child: Text("")),
              ],
            ),
            Row(
              children: [
                const Expanded(child: Text("")),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: show == false
                      ? const Text("")
                      : TextButton(
                          onPressed: () {
                            setState(() {
                              show = false;
                            });
                          },
                          child: const Text(
                            "مسح الكل",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black87,
                                fontSize: 16,
                                fontFamily: 'IBM'),
                          )),
                ),
              ],
            ),
            show == false
                ? Center(
                    child: Container(
                    margin: const EdgeInsets.fromLTRB(25, 180, 25, 0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          show = true;
                        });
                      },
                      child: Text("لا يوجد لديك إشعارات",
                          style: TextStyle(
                            fontFamily: "IBM",
                            color: Colors.grey.shade800,
                            fontSize: 20,
                          )),
                    ),
                  ))
                : Container(
                    margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(5, 20, 10, 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: kContainerColor,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(child: Text("")),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                              child: Text(dateOfNotification,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'IBM',
                                    inherit: true,
                                    color: Colors.grey.shade600,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: Image(
                                  image: AssetImage(image),
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                // SizedBox(
                                //   height: 5,
                                // ),
                                Container(
                                  width: 230,
                                  margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: Text(title,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'IBM',
                                        inherit: true,
                                        color: Colors.grey.shade800,
                                      )),
                                ),
                                Container(
                                    width: 230.7,
                                    margin:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Text(
                                      'العنوان:$location',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: 'IBM',
                                          inherit: true,
                                          color: Colors.grey.shade800),
                                    )

                                    // RichText(
                                    //   text: TextSpan(
                                    //     children: <TextSpan>[
                                    //       TextSpan(
                                    //         text: 'العنوان:',
                                    //         style: TextStyle(
                                    //             fontSize: 18.0,
                                    //             fontFamily: 'IBM',
                                    //             inherit: true,
                                    //             color: Colors.grey.shade800),
                                    //       ),
                                    //       TextSpan(
                                    //           text: location,
                                    //           style: TextStyle(
                                    //             fontSize: 16,
                                    //             fontFamily: 'IBM',
                                    //             inherit: true,
                                    //             color: Colors.grey.shade800,
                                    //           )),
                                    //     ],
                                    //   ),
                                    // ),
                                    ),
                                Container(
                                  // padding: EdgeInsets.fromLTRB(5, 10, 5, 10) ,
                                  width: 230,

                                  margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: Text(responseFromOwner,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'IBM',
                                        color: kPrimaryColor,
                                      )),
                                ),

                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )

            // NotificationOfStudentClassWidget(title: title, image: image, responseFromOwner: responseFromOwner, location: location, dateOfNotification: dateOfNotification)
          ],
        ),
      ),
    );
  }
}
