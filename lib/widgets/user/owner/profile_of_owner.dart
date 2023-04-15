import 'package:flutter/material.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/profile_classs_widget/ProfileImage.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/profile_classs_widget/data_of_owner.dart';
class ProfileOfOwner extends StatefulWidget {
  const ProfileOfOwner({Key? key}) : super(key: key);

  @override
  State<ProfileOfOwner> createState() => _ProfileOfOwnerState();
}

class _ProfileOfOwnerState extends State<ProfileOfOwner> {
  var image = "https://robohash.org/hicveldicta.png/";
  var name = "احمد النتشة";
  var titleOfAdcount = "عدد الإعلانات التي قمت بنشرها";
  var countOfAd = 10;
  var titleOfacseptOreer = "عدد قبول طلبات الحجز ";
  var titleOfdisaccsecptOfOrder = "عدد رفض طلبات الحجز";
  var countOfOrders = " عدد طلبات الحجز";
  var joinDate = "2020/3/3";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 50,),

          ProfileImage(image: image, name: name,dateOfJoin: joinDate),
          const SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
            // height: 140,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white70,
            ),

            child: Column(children: [
              DataOfOnwer(title: titleOfAdcount,number: 10,),
              DataOfOnwer(title: titleOfacseptOreer,number: 8,),
              DataOfOnwer(title: titleOfdisaccsecptOfOrder,number: 4,),
              DataOfOnwer(title: countOfOrders,number: 10,),

            ]),
          )


        ],),
      ),
    );
  }
}
