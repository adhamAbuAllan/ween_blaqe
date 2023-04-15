import 'package:flutter/material.dart';
import 'package:ween_blaqe/sesstion/main_session.dart';
import 'package:ween_blaqe/widgets/user/owner/main_owner.dart';
import 'package:ween_blaqe/widgets/user/studnet/main_student.dart';
import 'package:ween_blaqe/widgets/widgets_before_user_reg/account_before_login.dart';
class DropdownButtonClassWidget extends StatefulWidget {

  String firstItem;
  List<String> items;
  FocusNode? focusNode;
  Function? onFieldSubmitted;
  double fontSize;
  bool ? visible;
  TextEditingController ? controller;

  // Function onTab;



  DropdownButtonClassWidget({Key? key,
     required this.items,
     required this.firstItem,
    this.focusNode,
     required this.fontSize,
      this.onFieldSubmitted,
    this.visible,
    this.controller


    // this.onTab,

   }) : super(key: key);


  @override
  State<DropdownButtonClassWidget> createState() => _DropdownButtonClassWidgetState();

}

class _DropdownButtonClassWidgetState extends State<DropdownButtonClassWidget> {

  @override
  Widget build(BuildContext context) {
    var items = widget.items;

    var firstItem = widget.firstItem;
    var focusNode = widget.focusNode;
    var fonstSize = widget.fontSize;
    var visible = widget.visible;
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: DropdownButtonFormField(

        focusNode: focusNode,
        style: TextStyle(fontSize:fonstSize ),
        autofocus: true,
        decoration: InputDecoration(

          enabledBorder: OutlineInputBorder(
            //<-- SEE HERE
            borderSide:
            BorderSide(color: Colors.orange.shade300, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            //<-- SEE HERE
            borderSide: BorderSide(color: Colors.orange, width: 1),
          ),
        ),

          value: firstItem,
          onChanged: (String? newValue) {

            setState(() {
              firstItem = newValue!;
              if (firstItem == "مؤجر"){
                visible = true;
              }

            });
          },
        items:items
        .map<DropdownMenuItem<String>>((String value) {

         Session.get("1", "1") == "1" ? MainStudent:MainOwner();

          return DropdownMenuItem<String>(

            value: value,
            onTap: (){

            },
            child: Text(
              value,
              style: TextStyle(fontSize: fonstSize,
                  color: Colors.grey.shade800,
                  fontFamily: 'IBM'
              ),
            ),
          );
        }).toList()
      ),
    );

  }
}
