import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class HomeFutterRatingBar extends StatelessWidget {
  const HomeFutterRatingBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: RatingBar(
        minRating: 1,
        maxRating: 5,
        initialRating: 3,
         ratingWidget: RatingWidget(
          full: const Icon(Icons.star,color: Colors.amber,),
          // half: HalfFilledIcon(),
          empty: const Icon(Icons.star,color: Colors.grey,), half: SizedBox(width: 10,)
         ),
         allowHalfRating: false,
        onRatingUpdate: (double value) {
          print(value);
        },
        itemPadding: EdgeInsets.symmetric(horizontal: 3),
        tapOnlyMode: true,
        // ignoreGestures: true,
        glowColor: Colors.orange,
        // glow: true,
         glowRadius: 7,
        itemSize: 24,
         )),);
  }
}
