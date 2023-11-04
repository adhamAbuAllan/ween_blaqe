import 'package:flutter/material.dart';

import '../theme/dark_theme.dart';

main() {
  runApp(MaterialApp(
      theme: darkTheme(),
      home: const _Home()));
}


class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                "my locatoin is :Column>Text, and up of the blue container , And I can expanded according of width of Column Widget",),
            container(),
            const Text("be careful first statment is not a child of Column Widget , is child of blue text",style: TextStyle(color: Colors.red,height: 1.5,fontSize: 18),),

          ],
        ),
      ),
    );
  }

  Container container() {
    return Container(
      
      width: 100 * 3,
      height: 100 * 3,
      color: Colors.blueAccent.withOpacity(.5),
      child: const Baseline(
        
          baseline: -20 * 8,
          baselineType: TextBaseline.alphabetic,
          child: Text(
              "my location is : blue Container>Baseline>Text , and I expanded according of width of blue container ")),
    );
  }
}
