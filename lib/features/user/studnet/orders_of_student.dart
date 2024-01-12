import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/widgets/subtitle_class_widget.dart';
import 'package:ween_blaqe/core/widgets/title_class_widget.dart';

// import '../../../core/widgets/orders_classs_widget/container_order_student_class_widget.dart';

class OrdersOfStudent extends StatefulWidget {
  const OrdersOfStudent({Key? key}) : super(key: key);

  @override
  State<OrdersOfStudent> createState() => _OrdersOfStudentState();
}

class _OrdersOfStudentState extends State<OrdersOfStudent> {
  var show = false;
  bool isScreenIsReady = false;
  bool isEnd = false;

  @override
  Widget build(BuildContext context) {
    // var title = "شقة للطلاب في مدينة الخليل";
    // var location = "الخليل-واد الهرية";
    // var price = 900;
    // var image = "assets/images/apartments_images/image1.png";
    // var date = "04/14/2020";
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TitleClassWidget(title: "الحجوزات"),
            const SubtitleCalssWidget(subtitle: "قائمة الحجوزات"),
            const SizedBox(height: 25,),
            !isScreenIsReady
                ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Image.asset(
                    "assets/images/mobile-development.png",width: 450/1.3,height: 420/1.3,color: Colors.black.withOpacity(.7),
                  ),
                )

                :
            // (show == false
            //         ? Center(
            //             child: Container(
            //             margin: const EdgeInsets.fromLTRB(25, 200, 25, 0),
            //             child: TextButton(
            //               onPressed: () {
            //                 setState(() {
            //                   show = true;
            //                 });
            //               },
            //               child: Text("لم تقم بحجز أي شقة حتى الان",
            //                   style: TextStyle(
            //                     fontFamily: "IBM",
            //                     color: Colors.grey.shade800,
            //                     fontSize: 16,
            //                   )),
            //             ),
            //           ))
            //         : ContainerOrderOfStudentClassWidget(
            //             title: title,
            //             image: image,
            //             price: price,
            //             location: location,
            //             dateOfBooking: date)
            // ),
            !isScreenIsReady  ?
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text("هذه الميزة قيد التطوير وسيتم إضافتها قريبًا",style: TextStyle(
                fontSize: 16,
                  fontFamily: 'IBM',
                  color: Colors.black.withOpacity(.7)),),
            ):
          const Text("")
          ],
        ),
      ),
    );
  }
}
