import 'package:flutter/material.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/bookmark_class_widget.dart';
import 'package:ween_blaqe/data_containers/add_ad_data_container.dart';

import '../../../testing_code/drop_down_bottom_get_data.dart';
import '../../../testing_code/exams/second_exam.dart';
import '../../../testing_code/responses_code.dart';
import 'home.dart';

class Bookmark extends StatefulWidget {
   Bookmark({Key? key}) : super(key: key);

  @override
  State<Bookmark> createState() => _BookmarkState();

}
var show = false;
class _BookmarkState extends State<Bookmark> {

  @override
  Widget build(BuildContext context) {



    var title = "شقة للطلاب مفروش الخليل";
    var location = "الخليل-واد الهرية";
    var price = 999;
    var image = "assets/images/apartments_images/image1.png";
    var booking= "غير محجوز";
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
                child: Text(
                  "المحفوظات",
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
                  "قائمة المحفوظات",

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
        show   == false ? Center(child: Container(
            margin: EdgeInsets.fromLTRB(25, 215, 25, 0),child: TextButton(
          onPressed: (){
            setState(() {
              show = true;

            });
          },
              child: Text("لا يوجد لديك إعلانات محفوظة",
                style: TextStyle(
                  fontFamily: "IBM",
                  color: Colors.grey.shade800,
                  fontSize: 20,
                )),
            ),)) :  BookmarkClassWidget(title: title??"", image: image, price: price??0, booking: booking, location: location??"",isvisible: false,)


        ],),
      ),
    );
  }
}
