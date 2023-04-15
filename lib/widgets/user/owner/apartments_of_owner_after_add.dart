import 'package:flutter/material.dart';

import '../../../classes_that_effect_widgets/your_apartment_class_widget/your_apartment_class_widget.dart';

class ApartmentsOfOwnerAfterAdd extends StatelessWidget {


  const ApartmentsOfOwnerAfterAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = "شقة للطلاب في مدينة الخليل";
    var location = "الخليل - واد الهرية";
    var price = "900";
    var image = "assets/images/apartments_images/image1.png";
    var booking= "محجوز";
    var YourAparmtent = YourApartmentClassWidget(title: title, image: image, price: price, booking: booking, location: location);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      body:Column(
        children: [

          //title
          Padding(
            padding: const EdgeInsets.fromLTRB(250, 50, 0, 0),
            child: Text(
              "شققك     ",
              style: TextStyle(
                fontSize: 26.0,
                fontFamily: 'IBM',
                inherit: true,
              ),
            ),
          ),
          //subtitle of title
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(90, 0,10, 55),
                child: Text(
                  "الشقق التي قمت بإضفتها",

                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontFamily: 'IBM',

                    fontSize: 14,
                  ),
                ),
              ),
              Expanded(child: Text(""))

            ],
          ),
          YourAparmtent,

        ],
      ),



    );
  }
}

