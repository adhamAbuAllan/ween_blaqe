import 'package:flutter/material.dart';
import '../../api/apartments.dart';
import '../../api/apartment_advantages.dart';
import '../../styles/button.dart';
import 'package:ween_blaqe/widgets/user/studnet/show_more.dart';
import '../../api/photos.dart';
import '../../urls_of_project/localhost_urls.dart';


Widget HomeClassWidget (Apartment apartment, Function onClick ,BuildContext context) {
   Photos photo = Photos( id: 0, apartment_id: apartment, url: "");
 var url = photo.url ;
  var id = apartment.id;
  var title = apartment.title;
  var price = apartment.price;
  var city = apartment.city;
  var location = apartment.location;

 return  Container(
    margin: EdgeInsets.fromLTRB(0, 23, 0, 0),
    width: 373,
    height: 345,
    //decoration of show apartment style
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      color: Colors.white70,
    ),
    child: Column(
      // this children have (bookmark IconImage  , image of apartment , title of post , price , and location.
      children: [
        //bookmark iconImage
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 320, 0),
          child: IconButton(
            onPressed: () {
              onClick();
            },
            icon: Icon(
              Icons.bookmark_outline,
              size: 28,
            ),
          ),
        ),
        //image/s of apartment
        ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image(
              image: AssetImage(url)
              // child: Image(image: Image.network("src")),
              ,
              height: 200,
              // width:368,
            )),
        //title and price
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(title,
                  style: TextStyle(
                    color: Colors.black87,
                  )),
            ),
            Expanded(child: Text("")),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
              child: Text(price.toString(),
                  style: TextStyle(color: Colors.orange)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 3, 0),
              child: Text("شيكل/شهري",
                  style: TextStyle(
                    color: Colors.grey,
                  )),
            ),
          ],
        ),
        //see more and location
        Row(
          children: [
            TextButton(
              onPressed: () {
                onClick.call(
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return ShowMore();
                      }),
                    )
                );

              },
              child: Text(
                "عرض المزيد",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Expanded(child: Text("")),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text("الموقع:",
                  style: TextStyle(
                    color: Colors.grey,
                  )),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text("$city-$location",
                  style: TextStyle(
                    color: Colors.grey,
                  )),
            ),
          ],
        )
      ],
    ),
  );
}
