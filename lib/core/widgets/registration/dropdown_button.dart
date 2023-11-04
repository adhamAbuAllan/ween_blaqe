import 'package:flutter/material.dart';

import 'package:ween_blaqe/constants/nums.dart';

 


class DropdownButtonClassWidget extends StatefulWidget {
  final String? firstItem;
  final List<String>? items;
  // FocusNode? focusNode;
  // Function? onFieldSubmitted;
  final double fontSize;
  final bool? visible;
  // double lift;
  // double ? right;
  final TextEditingController? controller;
  final Function(String)? onSelected;
  // String name ;
  // String ? myKey;
  // dynamic myValue;
  // Map<String ,dynamic>? response;

  // Session.get(myKey, myValue);

  // Session.get("profile", ""),

  // Function onTab;

  const DropdownButtonClassWidget({
    Key? key,
    required this.items,
    // this.right,
    // required this.lift,
    required this.firstItem,
    // this.focusNode,
    required this.fontSize,
    // this.onFieldSubmitted,
    this.visible,
    this.controller,
    this.onSelected,
    // required this.name,
    //    this.myKey,
    //    this.myValue,
    // this.response

    // this.onTab,
  }) : super(key: key);

  @override
  State<DropdownButtonClassWidget> createState() =>
      _DropdownButtonClassWidget();
}

class _DropdownButtonClassWidget extends State<DropdownButtonClassWidget> {
  @override
  Widget build(BuildContext context) {
    var items = widget.items;
    var currentValue = widget.firstItem;
    // var focusNode = widget.focusNode;
    var fonstSize = widget.fontSize;
    // var visible = widget.visible;
    // var name = widget.name;
    // var myKey = widget.myKey!;
    // var myValue = widget.myValue!;
    //
    // Map<String , dynamic> response = widget.response!;
    // response = NewSession.get(myKey, myValue);
    // items.forEach((element) {
    //   // myKey = element;
    //   element = myKey;
    // });
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: DropdownButtonFormField<dynamic>(
          // focusNode: focusNode,
          style: TextStyle(fontSize: fonstSize),
          // autofocus: true,
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              //<-- SEE HERE
              borderSide: BorderSide(color: kPrimaryColor300, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              //<-- SEE HERE
              borderSide: BorderSide(color: kPrimaryColor, width: 1),
            ),
          ),
          value: currentValue,

          items: items
              ?.map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: TextStyle(
                        fontSize: fonstSize,
                        color: Colors.grey.shade800,
                        fontFamily: 'IBM'),
                  ),
                ),
              )
              .toList(),
          onChanged: (i) {
            setState(() {
              currentValue = i;
              setState(() {
                widget.onSelected!(currentValue!);
              });
            });
          },

          //   DropdownMenuItem(
          //
          //         (String value) {
          //   return DropdownMenuItem(
          //     value: value,
          //     onTap: (){
          //       // response[widget.myKey!] = value;
          //     },
          //     child: Text(
          //       value,
          //       style: TextStyle(fontSize: fonstSize,
          //           color: Colors.grey.shade800,
          //           fontFamily: 'IBM'
          //       ),
          //     ),
          //   );
          //
          // }).toList(),
        ));
  }
}
////////////////////////////////--------------------------//////////////////////////////




