import 'package:flutter/material.dart';
/*
placehoder lines color mean
red = image
blue = button
black = text
orange = icon


 */

class  PlaceholderHome extends StatelessWidget {
  const PlaceholderHome({super.key});
  @override
  Widget build(BuildContext context) {
    return
        const Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [

            Placeholder(fallbackHeight: 200,strokeWidth: 2,color: Colors.red,),
            Placeholder(fallbackHeight: 200,strokeWidth: 2,color: Colors.red,),
            Placeholder(fallbackHeight: 200,strokeWidth: 2,color: Colors.red,),
            Placeholder(fallbackHeight: 200,strokeWidth: 2,color: Colors.red,),
          ],
        );
  }
}
