import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ween_blaqe/styles/button.dart';
import 'package:ween_blaqe/styles/show_more_widget/about_apartment_style.dart';
import '../../../widgets/user/studnet/show_more.dart';
class AdPost extends StatelessWidget {
   AdPost({Key? key,
    required this.image,
     required this.title,
     required this.price,
     required this.city,
  }) : super(key: key,);
  String image;
  String title;
  int price;
  String city;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.fromLTRB(0, 23, 0, 0),
      width: 373,
      height: 395,
      //decoration of show apartment style
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white70,
      ),


      child:Column(
        // this children have (bookmark IconImage  , image of apartment , title of post , price , and location.
        children: [
          // bookmark iconImage
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 320, 0),
            child: IconButton(
              onPressed: () {
              },
              icon: Icon(
                Icons.bookmark_outline,
                size: 28,
              ),
            ),
          ),
          // image/s of apartment
          ClipRRect(
              borderRadius: BorderRadius.circular(7/2),
              child: Image(
                image: AssetImage(image)
                // child: Image(image: Image.network("src")),
                ,
                height: 240,
                // width:368,
              )),
          // title and price
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(title,
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontFamily: 'IBM',
                      fontSize: 15,
                    )),
              ),
              Expanded(child: Text("")),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
                child: Text(price.toString(),
                    style: TextStyle(color: Colors.orange,
                      fontSize: 16,
                      fontFamily: 'IBM',)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 3, 0),
                child: Text("ش/ش",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontFamily: 'IBM',
                    )),
              ),
            ],
          ),

          // see more and location
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: OutlinedButton(
                  onPressed: () {
                    Get.to(ShowMore());
                    },
                  child: Text(
                    " عرض المزيد ",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'IBM',
                    ),
                  ),
                  style: outlineButton,
                ),
              ),
              Expanded(child: Text("")),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text("الموقع:",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: 'IBM',
                    )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(city,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: 'IBM',
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
