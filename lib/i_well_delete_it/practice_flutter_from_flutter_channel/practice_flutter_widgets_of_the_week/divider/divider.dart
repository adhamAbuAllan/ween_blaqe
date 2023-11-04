import 'package:flutter/material.dart';

main(){
  runApp(const MaterialApp(home: _Home(),));

}
class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacer()
,      _CustomBox(color: Colors.green),
      Divider(height: 100,thickness: 10,color: Colors.redAccent,indent: 30,endIndent: 30,),
      _CustomBox(color: Colors.blue),
          Spacer()

        ]),);
  }
}
class _CustomBox extends StatelessWidget {
  const _CustomBox({ required this.color});
final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120*2,
      height: 100*2,
       decoration: BoxDecoration(
           color: color
           ,borderRadius: BorderRadiusDirectional.circular(17)),
    );
  }
}
