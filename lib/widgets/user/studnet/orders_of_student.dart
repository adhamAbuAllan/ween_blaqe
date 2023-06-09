import 'package:ween_blaqe/classes_that_effect_widgets/orders_classs_widget/container_order_student_class_widget.dart';

import '../../../data_containers/add_ad_data_container.dart';
import 'main_student.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/bookmark_class_widget.dart';
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
    var date= "04/14/2020";
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
                child: Text(
                  "الحجوزات",
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
                padding: const EdgeInsets.fromLTRB(0, 0,20, 55),
                child: Text(
                  "قائمة الحجوزات",

                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      fontFamily: 'IBM'
                  ),
                ),
              ),
              const Expanded(child: Text("")),

            ],
          ),
          show == false ? Center(child: Container(
            margin: EdgeInsets.fromLTRB(25, 200, 25, 0),child: TextButton(
            onPressed: (){
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
            ),)) : ContainerOrderOfStudentClassWidget(title: title, image: image, price: price, location: location, dateOfBooking: date)


        ],),
      ),
    );
  }
}
