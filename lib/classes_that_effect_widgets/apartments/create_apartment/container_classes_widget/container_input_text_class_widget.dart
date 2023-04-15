import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ween_blaqe/styles/text_field_form_style.dart';
//container input text class widget
class ContainerInputTextClassWidget extends StatefulWidget {
  String title;
  String hintInput;
  TextInputType inputType;
  FocusNode ? focusNode;
  String ? value;
  Function ? onFieldSubmitted;
  TextEditingController ? controller;
   ContainerInputTextClassWidget({Key? key,
  required this.title,required this.hintInput,required this.inputType,
      this.focusNode,
      this.onFieldSubmitted,
     this.value,
     this.controller
   }) : super(key: key);
  @override
  State<ContainerInputTextClassWidget> createState() => _ContainerInputTextClassWidgetState();
}
class _ContainerInputTextClassWidgetState extends State<ContainerInputTextClassWidget> {
  @override
  Widget build(BuildContext context){
    var title = widget.title;
    var contoller  = widget.controller;
    var hintInput = widget.hintInput;
    var inputType = widget.inputType;
    var focusNode = widget.focusNode;
    var value = widget.value;
    return Container(
      margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
      // height: 140,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white70,
      ),

      child: Column(

        children: [
          Row(
            children: [

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10,10),
                child: Text(title,
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 18,
                    fontFamily: 'IBM',
                  ),
                ),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15,0,10, 10),
            child: TextFormField(
controller: contoller,
              initialValue: value,
                // maxLength: 55,
              textDirection:TextDirection.rtl,
              keyboardType: inputType,

              focusNode: focusNode,
              decoration: InputDecoration(
                  hintTextDirection:TextDirection.rtl,
                hintText: hintInput,
                  border: InputBorder.none,
                  hintMaxLines: 1,
                  hintStyle: TextStyle(

                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.orange,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.orange.shade300,
                      ),
                      borderRadius: BorderRadius.circular(7))),
              style: TextStyle(fontFamily: 'IBM',
                  fontSize: 16,
                  color: Colors.grey.shade800,),

            ),
          ),
        ],
      ),
    );
  }
}
// container input (long) text class widget
class ContainerInputLongTextClassWidget extends StatefulWidget {
  String title;
  String hintInput;
  TextInputType inputType;
  FocusNode focusNode;
   ContainerInputLongTextClassWidget({Key? key,
  required this.title,required this.hintInput,required this.inputType,
     required this.focusNode,
  }) : super(key: key);
  @override
  State<ContainerInputLongTextClassWidget> createState() => _ContainerInputLongTextClassWidgetState();
}
class _ContainerInputLongTextClassWidgetState extends State<ContainerInputLongTextClassWidget> {
  @override
  Widget build(BuildContext context) {
    var title = widget.title;
    var hihtInput = widget.hintInput;
    var inputType = widget.inputType;
  var focusNode = widget.focusNode;
    return Container(
      margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
      width: 373,
      // height: 140,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white70,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10,10),
                child: Text(title,
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 18,
                    fontFamily: 'IBM',
                  ),
                ),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15,0,10, 0),
            child: TextFormField(
              maxLength: 255,
              maxLines: 7,
              textDirection:TextDirection.rtl,
              keyboardType: inputType,
              onFieldSubmitted: (value){

              },
              focusNode: focusNode,
              decoration: InputDecoration(

                  hintTextDirection:TextDirection.rtl,
                  hintText: hihtInput,
                  border: InputBorder.none,
                  hintMaxLines: 7,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.orange,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.orange.shade300,
                      ),
                      borderRadius: BorderRadius.circular(7))),
              style: TextStyle(fontFamily: 'IBM',
                fontSize: 16,
                color: Colors.grey.shade800,),

            ),
          ),
        ],
      ),
    );
  }
}



