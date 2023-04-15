import 'package:flutter/material.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/profile_classs_widget/ProfileImage.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/profile_classs_widget/profile_saved_data.dart';
class ShowProfileOfStudent extends StatefulWidget {
  const ShowProfileOfStudent({Key? key}) : super(key: key);

  @override
  State<ShowProfileOfStudent> createState() => _ShowProfileOfStudentState();
}

class _ShowProfileOfStudentState extends State<ShowProfileOfStudent> {
  @override
  Widget build(BuildContext context) {
    var image = "https://robohash.org/hicveldicta.png";
    var name = "علي شاهين";
    var aboutStudentTitle = "نبذة عن الطالب";
    var aboutStudent = "-";
    var locationTitle = "الموقع";
    var location = "الظاهرية";
    var majorTitle = "التعليم";
    var major = "علم حاسوب";
    var universityTitle = "الجامعة";
    var university = "جامعة بولتكنك فلسطين";
    var dateJoin = " 14 ديسمبر 2022";
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
              child: ProfileImage(image: image, name: name,dateOfJoin: dateJoin),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.white70,),
              child:Column(
                children: [
                  ProfileSavedData(title:aboutStudentTitle,subtitle: aboutStudent,),
                  ProfileSavedData(title:locationTitle,subtitle: location,),
                  ProfileSavedData(title:majorTitle,subtitle: major,),
                  ProfileSavedData(title:universityTitle,subtitle: university,),
                ],
              ),


            )


          ],),
        ),
      ),
    );
  }
}
