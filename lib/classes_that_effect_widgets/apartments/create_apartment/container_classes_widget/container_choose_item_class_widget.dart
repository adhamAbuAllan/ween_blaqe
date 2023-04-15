import 'package:flutter/material.dart';
import 'package:ween_blaqe/styles/text_field_form_style.dart';
class ContainerChooseItemClassWidget extends StatefulWidget {
  String title;
  String firstItem;
  List<String> items;
   ContainerChooseItemClassWidget({Key? key,
     required this.title,
     required this.items,
     required this.firstItem,
}) : super(key: key);
  @override
  State<ContainerChooseItemClassWidget> createState() => _ContainerChooseItemClassWidgetState();
}
class _ContainerChooseItemClassWidgetState extends State<ContainerChooseItemClassWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
          margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.white70,
          ),
          child: Column(
              children: [
                //
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10,10),
                      child: Text(widget.title,
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
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: DropdownButtonFormField(
                    style: TextStyle(fontSize: 22),
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
                    value: widget.firstItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        widget.firstItem = newValue!;
                      });
                    },
                    items: widget.items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 16,
                              color: Colors.grey.shade800,
                              fontFamily: 'IBM'
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

              ])
      );
  }
}
