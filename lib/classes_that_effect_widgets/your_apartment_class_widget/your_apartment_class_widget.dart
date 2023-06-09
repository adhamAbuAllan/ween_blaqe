import 'package:flutter/material.dart';
import 'package:ween_blaqe/classes_that_effect_widgets/date_as_a_text.dart';

class YourApartmentClassWidget extends StatefulWidget {
  String image;
  String title;
  String location;
  int price;
  String booking;

  YourApartmentClassWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.price,
    required this.booking,
    required this.location,
  }) : super(key: key);

  @override
  State<YourApartmentClassWidget> createState() =>
      _YourApartmentClassWidgetState();
}

class _YourApartmentClassWidgetState extends State<YourApartmentClassWidget> {
  var width = 100.0;
  var height = 100.0;

  @override
  Widget build(BuildContext context) {
    var image = widget.image;
    var title = widget.title;
    var location = widget.location;
    var price = widget.price;
    var booking = widget.booking;
    // var date = DateAsText(date: DateTime.now());
    return GestureDetector(
      // onTap: (){
      //   Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) {
      //       // return ApartmentOfOwner();
      //     }),
      //   );
      // },
      child: Container(
          margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
          width: double.infinity,
          height: 180,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.white70,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text("")),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text("",
                        // "$date",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'IBM',
                          inherit: true,
                          color: Colors.grey.shade600,
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Image(
                        image: AssetImage(image),
                        width: width,
                        height: height,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Text(title,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'IBM',
                            inherit: true,
                            color: Colors.grey.shade800,
                          )),
                      RichText(

                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'العنوان:',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'IBM',
                                  inherit: true,
                                  color: Colors.grey.shade800),
                            ),
                            TextSpan(
                                text: location,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'IBM',
                                  inherit: true,
                                  color: Colors.grey.shade800,
                                )),
                          ],
                        ),
                      ),

                      // Text(location),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'الاجرة:',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'IBM',
                                  inherit: true,
                                  color: Colors.grey.shade800),
                            ),
                            TextSpan(
                                text: "$price",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'IBM',
                                  inherit: true,
                                  color: Colors.grey.shade800,
                                )),
                            TextSpan(
                                text: "شيكل/شهري",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'IBM',
                                  inherit: true,
                                  color: Colors.grey.shade800,
                                )),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),

               ],
              ),
              Row(children: [
                Expanded(child: Text("")),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(booking,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'IBM',
                        inherit: true,
                        color: Colors.grey.shade800,
                      )),
                ),
              ])
            ],
          ),
        ),
    );

  }
}
