import 'package:flutter/material.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/notification_class_widget/notification_of_student_class_widget.dart';
class NotificationOfOwner extends StatefulWidget {
  const NotificationOfOwner({Key? key}) : super(key: key);

  @override
  State<NotificationOfOwner> createState() => _NotificationOfOwnerState();
}

class _NotificationOfOwnerState extends State<NotificationOfOwner> {
  @override
  Widget build(BuildContext context) {
    var title = "شقة للطلاب في مدينة الخليل";
    var location = "الخليل - واد الهرية";
    var responseFromOwner = "إنتهت فترة الحجز لدى الطالب احمد";
    var image = "assets/images/apartments_images/image1.png";
    var dateOfNotification = "تاريخ 04/14/2020";
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body:SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: const [
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
                  padding: const EdgeInsets.fromLTRB(0, 0,20, 55),
                  child: Text(
                    "قائمة الاشعارات",

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
            Row(
              children: [
                const Expanded(child: Text("")),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(onPressed: (){}, child:  const Text("مسح الكل",

                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black87,
                        fontSize: 16,
                        fontFamily: 'IBM'
                    ),
                  )),
                ),
              ],
            ),
            NotificationOfStudentClassWidget(title: title, image: image, responseFromOwner: responseFromOwner, location: location, dateOfNotification: dateOfNotification)

          ],
        ),
      ) ,
    );
  }
}
