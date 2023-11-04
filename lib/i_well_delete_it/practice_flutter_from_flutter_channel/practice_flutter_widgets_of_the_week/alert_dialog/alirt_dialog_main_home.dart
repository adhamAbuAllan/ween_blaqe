import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
main(){
  runApp(MaterialApp(home: _Home(),));

}
class _Home extends StatefulWidget {
  const _Home({super.key});

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Center(child: CupertinoAlertDialog(
        title: const Text("Accept?"),
      content: const Text("do you want to accept?"),
      actions: [
        CupertinoDialogAction(child: TextButton(onPressed: (){Navigator.pop(context);},child: const Text("yes"),),),
        CupertinoDialogAction(child: TextButton(onPressed: (){Navigator.pop(context);},child: const Text("no"),),),
         // CupertinoDialogAction(child: Text("no"),),
      ],
    ),),);
  }
}
