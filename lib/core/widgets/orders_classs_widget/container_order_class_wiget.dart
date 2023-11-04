  import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';

import 'package:ween_blaqe/constants/nums.dart';



class OrderContainerClassWidget extends StatefulWidget {
  final String profileImage;
  final String studentName;
  final String title;
// String dateTime;
  final Function(bool)? onClick;
  final String apartmentImage;
  final String apartmentTitle;
  bool? showRequest;
  OrderContainerClassWidget({
    Key? key,
    // required this.dateTime,
    required this.studentName,
    this.onClick,
    this.showRequest,
    required this.profileImage,
    required this.title,
    required this.apartmentImage,
    required this.apartmentTitle,
  }) : super(
          key: key,
        );
  @override
  State<OrderContainerClassWidget> createState() =>
      _OrderContainerClassWidgetState();
}

class _OrderContainerClassWidgetState extends State<OrderContainerClassWidget> {
  @override
  Widget build(BuildContext context) {
    var studentName = widget.studentName;
    var profileImage = widget.profileImage;
    var title = widget.title;
    var apartmentImage = widget.apartmentImage;
    var apartmentTitle = widget.apartmentTitle;
    // var date = widget.dateTime;
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
      width: 373,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: kContainerColor,
      ),
      child: Column(
        children: <Widget>[
          //this row for date
          Row(
            children: [
              const Expanded(child: Text("")),
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
          //this padding for profile and name of student
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(profileImage),
                    radius: 30,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(130, 0, 0, 0),
                      child: Text(
                        studentName,
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'IBM',
                            color: Colors.black87),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'IBM',
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const Expanded(
                    child: SizedBox(
                  child: Text(""),
                )),
              ],
            ),
          ),
          //     //image/s of apartment
          ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image(
                image: AssetImage(apartmentImage)
                // child: Image(image: Image.network("src")),
                ,
                height: 200,
                // width:368,
              )),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 40, 0),
                child: Text(apartmentTitle,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontFamily: 'IBM',
                      fontSize: 16,
                    )),
              ),
              const Expanded(child: Text("")),
            ],
          ),
          Row(children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 40, 10),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        (value) {
                          setState(() {
                            widget.showRequest = !value;
                          });
                        };
                      });
                    },
                    style: fullButton,
                    child: const Text("قبول"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 10, 10),
                  child: OutlinedButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) {
                      //     return const SecondStep();
                      //   },
                      // ));
                    },
                    style: outlineButton,
                    child: const Text("رفض"),
                  ),
                ),
              ],
            ),
          ])
        ],
      ),
    );
  }
}

class ResponseOrderMessageClassWidget extends StatefulWidget {
  final String profileImage;
  final String studentName;
  final String title;
  // String dateTime;
  final String messageOfOrderStatus;
  final IconData? icon;
  const ResponseOrderMessageClassWidget(
      {Key? key,
      // required this.dateTime,
      required this.studentName,
      required this.profileImage,
      required this.title,
      required this.messageOfOrderStatus,
      this.icon})
      : super(key: key);
  @override
  State<ResponseOrderMessageClassWidget> createState() =>
      _ResponseOrderMessageClassWidgetState();
}

class _ResponseOrderMessageClassWidgetState
    extends State<ResponseOrderMessageClassWidget> {

  @override
  Widget build(BuildContext context) {
    var studentName = widget.studentName;
    var profileImage = widget.profileImage;
    var title = widget.title;
    // var date = widget.dateTime;
    var messageOfResponse = widget.messageOfOrderStatus;
    var icon = Icon(widget.icon);
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
      width: 373,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: kContainerColor,
      ),
      child: Column(
        children: [
          //this row for date
          Row(
            children: [
              const Expanded(child: Text("")),
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
          //this padding for profile and name of student
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(profileImage),
                    radius: 30,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(130, 0, 0, 0),
                      child: Text(
                        studentName,
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'IBM',
                            color: Colors.black87),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'IBM',
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const Expanded(
                    child: SizedBox(
                  child: Text(""),
                )),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 70, 0),
                child: Icon(
                  (icon.icon),
                  size: 24,
                  color: kPrimaryColor,
                ),
              ),
              Text(
                messageOfResponse,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'IBM',
                    color: Colors.grey.shade800),
              )
            ],
          )
        ],
      ),
    );
  }
}
