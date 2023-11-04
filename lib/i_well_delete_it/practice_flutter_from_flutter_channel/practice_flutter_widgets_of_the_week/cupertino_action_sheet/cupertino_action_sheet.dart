import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/utils/funcations/snakbar.dart';

main(){
  runApp(const MaterialApp(home: _Home(),));
}
class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: ElevatedButton(child: const Text("click me"),onPressed: (){
          showCupertinoModalPopup(context: context, builder: (context){
            return myCupertinoActionSheet(context);
          });
        },),
      ),);


  }
  Widget myCupertinoActionSheet(BuildContext context) {
    return CupertinoActionSheet(
      title: const Text("Things",style: TextStyle(fontSize: 24),),
      message: const Text("A short list of thigns to do",style: TextStyle(fontSize: 20)),
      actions: [
        CupertinoActionSheetAction(onPressed: (){Navigator.pop(context);showSnakBar(context, "you click good");}, child: const Text("Good Thing")),
        CupertinoActionSheetAction(onPressed: (){Navigator.pop(context);showSnakBar(context, "you click bad");}, child: const Text("Bad Thing",style: TextStyle(color: Colors.redAccent),)),
      ],
      cancelButton: CupertinoActionSheetAction(

        child: const Text('Cancel'),
        onPressed: (){
          Navigator.pop(context);showSnakBar(context, "you click cancel");
        },),
    );
  }
}
