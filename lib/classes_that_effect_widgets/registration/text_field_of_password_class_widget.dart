import 'package:flutter/material.dart';
class TextFieldOfPasswordClassWidget extends StatefulWidget {
  TextInputType inputType;
  Function? onFieldSubmitted;
  String labelInput;
  FocusNode? focusNode;
  TextEditingController ? controller;





  TextFieldOfPasswordClassWidget({Key? key,
    required this.inputType,
    required this.labelInput,
     this.onFieldSubmitted,
     this.focusNode,
    this.controller
  }) : super(key: key);

  @override
  State<TextFieldOfPasswordClassWidget> createState() => _TextFieldOfPasswordClassWidgetState();
}


class _TextFieldOfPasswordClassWidgetState extends State<TextFieldOfPasswordClassWidget> {
  @override
  Widget build(BuildContext context) {
    IconData invisible_ic = Icons.visibility_off;
    IconData visible_ic = Icons.visibility;
    IconData currentIcon = Icons.visibility_off;

    var labelInput = widget.labelInput;
    var inputType = widget.inputType;
    bool visible = false;
    var focusNode = FocusNode();
    return Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 12),
        child: TextFormField(
controller: widget.controller,
          obscureText: visible,
          style: TextStyle(fontFamily: 'IBM'),
          focusNode: focusNode,
          keyboardType: inputType,
          decoration: InputDecoration(
              labelText: labelInput,

              labelStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontFamily: 'IBM',
                  fontSize: 16),
              suffixIcon: IconButton(
                icon: Icon(
                    currentIcon = Icons.visibility_off
                ),
                onPressed: () {
                  if (currentIcon ==  Icons.visibility_off){
                    setState(() {
                      visible = true;
                      currentIcon = Icons.visibility;
                    });
                  }else{
                    setState(() {
                      visible = false;
                      currentIcon = Icons.visibility_off;
                    });
                  }
                },
              ),
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
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
        ));

  }
}
