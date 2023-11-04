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
    return Scaffold(body: DraggableScrollableSheet(
      initialChildSize: .7,
      minChildSize: .1,
      maxChildSize: 1,
      builder: (context,scrollController){
        return const SingleChildScrollView(
          child: Column(
            children: [
              Text("drag me",style: TextStyle(fontSize: 24),),
              Image(image: AssetImage("assets/images/apartment_get_started.png"),),
              Image(image: AssetImage("assets/images/apartment_get_started.png"),),
            ]
          ),
        );
      },
    ),);
  }
}
