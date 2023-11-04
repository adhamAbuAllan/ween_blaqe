import 'package:flutter/material.dart';

main(){
runApp(const MaterialApp(home: _Home(),));
}
class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
        children: [
          
          myListTile(),
          myListTile(),
          myListTile(),
          myListTile(),
        ],
      ),),
    );
  }
  Widget myListTile(){
    return  ListTile(

      leading : Icon(Icons.person),
      title: Text("Widget of the week"),
      subtitle: Text("#40"),
      isThreeLine : true,

      onTap: (){},
      dense: true,
      trailing: Icon(Icons.tag_outlined),
    );
  }
}
