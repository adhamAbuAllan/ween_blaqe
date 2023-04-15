import 'package:flutter/material.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/bookmark_class_widget.dart';
class Bookmark extends StatefulWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    var title = "شقة للطلاب في مدينة الخليل";
    var location = "الخليل - واد الهرية";
    var price = "900";
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
          BookmarkClassWidget(title: title, image: image, price: price, booking: booking, location: location,isvisible: false,)


        ],),
      ),
    );
  }
}
