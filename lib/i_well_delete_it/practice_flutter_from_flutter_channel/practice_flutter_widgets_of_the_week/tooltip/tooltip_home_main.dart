import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: _Home(),));

}
class _Home extends StatefulWidget {
  const _Home({super.key,  this.Icons});
final IconData? Icons;
  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Column(
      children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.ondemand_video),tooltip: "ondemand video",),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Tooltip(
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(7*2)),

            enableFeedback: false,
          excludeFromSemantics: true,
            preferBelow: false,
            textStyle: TextStyle(fontFamily: 'IBM',color: Colors.white.withOpacity(.8)),
            // verticalOffset:.01,
            waitDuration: Duration(milliseconds: 300),
            showDuration: Duration(milliseconds: 300*2),
            // height: 10*2,
            // triggerMode:
            
            child:Icon(Icons.add),message: "Add someting",),
          Tooltip(child:Icon(Icons.search,),message: "search anything",),
          Icon(Icons.home,),
            
        ],),
      ],
    ),),);
  }
}
