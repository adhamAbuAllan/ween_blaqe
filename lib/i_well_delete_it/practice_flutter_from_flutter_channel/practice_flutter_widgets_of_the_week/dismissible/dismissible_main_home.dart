// import 'dart:js_interop';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(home: _Home()));
}

class _Home extends StatefulWidget {
  const _Home({super.key});

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  List<int> itmes = List<int>.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: itmes.length,
          itemBuilder: (ctx, index) {
            return Dismissible(
              // dismissThresholds: {},
              // direction: DismissDirection.values.first,
              // crossAxisEndOffset: .1,

              // direction: DismissDirection.none,

              //   confirmDismiss: (direction) {
              //
              //     print("confirmDismiss: $direction" );
              //     ;
              //   },
                behavior:HitTestBehavior.deferToChild,
                resizeDuration: Duration(milliseconds: 500),
                dragStartBehavior:DragStartBehavior.down,
                movementDuration:  Duration(milliseconds: 300),
              secondaryBackground: const GreenContainer(),
                background:const RedContainer() ,
                key: ValueKey<int>(itmes[index]),
                onDismissed: (directoin) {
                  setState(() {
                    itmes.removeAt(index);
                  });
                  print("directoin is $directoin");
                  if(directoin == DismissDirection.endToStart){
                    print("directoin is end to start ! ");
                    itmes.length++;
                  }else if(directoin == DismissDirection.startToEnd){
                    print("directoin is start to end ! ");

                  }
                },
                child: ListTile(
                  title: Text("Item ${itmes[index]}"),
                ));
          }),
    );
  }
}
class RedContainer extends StatelessWidget {
  const RedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: const Icon(
          Icons.delete,
        ));
  }
}
class GreenContainer extends StatelessWidget {
  const GreenContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        child: const Icon(
          Icons.check,
        ));
  }
}
