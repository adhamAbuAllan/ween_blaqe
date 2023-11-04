import 'package:flutter/material.dart';

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
    return Scaffold(body: Center(
      child: Image.network(
        width: 200,
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/The_Sun_in_white_light.jpg/290px-The_Sun_in_white_light.jpg',
        loadingBuilder: (context,child,progress){

        return  progress == null ? child : const LinearProgressIndicator(color: Colors.blue,);
      },),
    ),);
  }
}
