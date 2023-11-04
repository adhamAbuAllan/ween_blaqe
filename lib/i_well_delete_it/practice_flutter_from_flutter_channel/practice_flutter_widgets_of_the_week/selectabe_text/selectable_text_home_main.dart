import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(
    home: _Home(),
  ));
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Align(
          alignment: Alignment.center,
          child: SelectableText(
            "my selectable text",

            enableInteractiveSelection: true,

            // dragStartBehavior:DragStartBehavior.start,
            // showCursor: false,
            autofocus: false,

            onSelectionChanged: ((selection, cause) {

            print("selection.isDirectoinal is :  ${selection.isDirectional}");
             print("slelectoin affinty.name is : ${selection.affinity.name}");
             // selection.isDirectional = false;
             print("cause is : ${cause}");

            }),
          )),
     );
  }
}
