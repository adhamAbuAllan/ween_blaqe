// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';

import 'package:ween_blaqe/constants/nums.dart';
import '../../../core/widgets/orders_classs_widget/container_order_class_wiget.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

var firstShow = false;
var secondShow = false;

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    // var date = DateAsText(date: DateTime.april);
    // var date = "1/3/2023";
    var studentName = "علي شاهين";
    var title = "قام $studentName بطلب حجز شقة";
    var profileImage = "https://robohash.org/h2icv3eldiadsf2cta.png";
    var apartmentImage = "assets/images/apartments_images/image1.png";
    var apartmentTitle = "شقة للطلاب في مدينة الخليل";
    var messageOfOrderStatus = "تمت الموافقة على الطلب";
    var checkIcon = Icons.check_circle;
    // var cancelIcon = Icons.cancel;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //title
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 20, 20),
                  child: Text(
                    "الطلبات",
                    style: TextStyle(
                      fontSize: 26.0,
                      fontFamily: 'IBM',
                      inherit: true,
                    ),
                  ),
                ),
                Expanded(child: Text(""))
              ],
            ),
            firstShow == false
                ? Center(
                    child: Container(
                    margin: const EdgeInsets.fromLTRB(25, 215, 25, 0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          firstShow = true;
                        });
                      },
                      child: Text("لا يوجد أي طلب حجز حتى الآن",
                          style: TextStyle(
                            fontFamily: "IBM",
                            color: Colors.grey.shade800,
                            fontSize: 20,
                          )),
                    ),
                  ))
                : Container(
                    margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
                    width: 373,
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: kContainerColor,
                    ),
                    child: Column(
                      children: <Widget>[
                        //this row for date
                        Row(
                          children: [
                            const Expanded(child: Text("")),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text("",
                                  // "$date",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'IBM',
                                    inherit: true,
                                    color: Colors.grey.shade600,
                                  )),
                            ),
                          ],
                        ),
                        //this padding for profile and name of student
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(profileImage),
                                  radius: 30,
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(130, 0, 0, 0),
                                    child: Text(
                                      studentName,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'IBM',
                                          color: Colors.black87),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(30, 0, 0, 0),
                                    child: Text(
                                      title,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'IBM',
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              const Expanded(
                                  child: SizedBox(
                                child: Text(""),
                              )),
                            ],
                          ),
                        ),
                        //     //image/s of apartment
                        ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Image(
                              image: AssetImage(apartmentImage)
                              // child: Image(image: Image.network("src")),
                              ,
                              height: 200,
                              // width:368,
                            )),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 40, 0),
                              child: Text(apartmentTitle,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'IBM',
                                    fontSize: 16,
                                  )),
                            ),
                            const Expanded(child: Text("")),
                          ],
                        ),
                        Row(children: [
                          Visibility(
                            visible: !secondShow,
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(25, 10, 40, 10),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        secondShow = true;
                                      });
                                    },
                                    style: fullButton,
                                    child: const Text("قبول"),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(25, 10, 10, 10),
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    style: outlineButton,
                                    child: const Text("رفض"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])
                      ],
                    ),
                  ),
            secondShow == false
                ? const SizedBox(
                    width: 10,
                    height: 10,
                  )
                : ResponseOrderMessageClassWidget(
                    // dateTime: date,
                    studentName: studentName,
                    profileImage: profileImage,
                    title: title,
                    messageOfOrderStatus: messageOfOrderStatus,
                    icon: checkIcon,
                  )
          ],
        ),
      ),
    );
  }
}
