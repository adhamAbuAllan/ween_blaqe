import 'package:flutter/material.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/orders_classs_widget/container_order_class_wiget.dart';

import '../../../classes_that_effect_widgets/date_as_a_text.dart';
class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
     // var date = DateAsText(date: DateTime.april);
    var date = "1/3/2023";
     var studentName = "علي شاهين" ;
    var title = "قام $studentName بطلب حجز شقة" ;
    var profileImage = "https://robohash.org/hicveldicta.png" ;
    var apartmentImage = "assets/images/apartments_images/image1.png" ;
    var apartmentTitle = "شقة للطلاب في مدينة الخليل" ;
    var messageOfOrderStatus = "تمت الموافقة على الطلب";
    var checkIcon =   Icons.check_circle;
    var cancelIcon = Icons.cancel;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(children: [
          //title
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
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
          OrderContainerClassWidget(dateTime: date,
              studentName: studentName,
              profileImage: profileImage,
              title: title,
              apartmentImage: apartmentImage,
              apartmentTitle: apartmentTitle),
          ResponseOrderMessageClassWidget(dateTime: date,
              studentName: studentName,
              profileImage: profileImage,
              title: title,
              messageOfOrderStatus: messageOfOrderStatus,
          icon:checkIcon,)

        ],),
      ),
    );
  }
}
