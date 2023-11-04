import 'package:flutter/material.dart';
class FadeInImageHome extends StatelessWidget {
  const FadeInImageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: FadeInImage.assetNetwork(
        // width: 100*2*2,
        height: 100,
        fadeInCurve: Curves.bounceIn,
        fadeInDuration: const Duration(seconds:11),

        placeholder:'assets/I_will_delete_it/images/weather_images/clear.png',
        image: 'https://res.cloudinary.com/practicaldev/image/fetch/s--Qx8OfWOd'
            '--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_775/https://dev-'
            'to-uploads.s3.amazonaws.com/uploads/articles/3nop8mk1tlwp654mhj4b'
            '.png',
          ),
    ),);
  }
}
