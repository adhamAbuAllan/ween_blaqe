import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ween_blaqe/styles/text_field_form_style.dart';

class PasswordContainerClassWidget extends StatefulWidget {
  String title;
  String hintInput;
  TextInputType inputType;
FocusNode?  focusNode;
  Function? onFieldSubmitted;
  TextEditingController ? controller;


  PasswordContainerClassWidget(
      {Key? key,
      required this.title,
      required this.hintInput,
      required this.inputType,
       this.focusNode,
       this.onFieldSubmitted,
        this.controller

      })
      : super(key: key);

  @override
  State<PasswordContainerClassWidget> createState() =>
      _PasswordContainerClassWidgetState();
}

class _PasswordContainerClassWidgetState
    extends State<PasswordContainerClassWidget> {
  @override
  Widget build(BuildContext context) {

    var title = widget.title;
    var hihtInput = widget.hintInput;
    var inputType = widget.inputType;
    bool isvisible = true;
    var focusNode = FocusNode();
    return Container(
      margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white70,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: Text(
                  title,
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
            padding: const EdgeInsets.fromLTRB(15, 0, 10, 10),
            child: TextFormField(
              obscureText: !isvisible,
              keyboardType: inputType,
              onFieldSubmitted: (value){

              },
              focusNode: focusNode,
              controller: widget.controller ,
              decoration: InputDecoration(
                  hintText: hihtInput,
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Visibility(
                      child: Icon(
                        color: Colors.grey.shade300,
                        isvisible! ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isvisible = !isvisible;
                      });
                    },
                  ),
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
              style: TextStyle(
                  fontFamily: 'IBM', fontSize: 16, color: Colors.grey.shade800),
            ),
          ),
        ],
      ),
    );
  }
}
