
import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/widgets/subtitle_class_widget.dart';
import 'package:ween_blaqe/core/widgets/title_class_widget.dart';

import '../../../core/widgets/orders_classs_widget/container_order_student_class_widget.dart';

class OrdersOfStudent extends StatefulWidget {
  const OrdersOfStudent({Key? key}) : super(key: key);

  @override
  State<OrdersOfStudent> createState() => _OrdersOfStudentState();
}

var show = false;

class _OrdersOfStudentState extends State<OrdersOfStudent> {
  @override
  Widget build(BuildContext context) {
    var title = "شقة للطلاب في مدينة الخليل";
    var location = "الخليل-واد الهرية";
    var price = 900;
    var image = "assets/images/apartments_images/image1.png";
    var date = "04/14/2020";
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
const TitleClassWidget(title: "الحجوزات"),

const SubtitleCalssWidget(subtitle: "قائمة الحجوزات"),

            show == false
                ? Center(
                    child: Container(
                    margin: const EdgeInsets.fromLTRB(25, 200, 25, 0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          show = true;
                        });
                      },
                      child: Text("لم تقم بحجز أي شقة حتى الان",
                          style: TextStyle(
                            fontFamily: "IBM",
                            color: Colors.grey.shade800,
                            fontSize: 20,
                          )),
                    ),
                  ))
                : ContainerOrderOfStudentClassWidget(
                    title: title,
                    image: image,
                    price: price,
                    location: location,
                    dateOfBooking: date)
          ],
        ),
      ),
    );
  }
}
