import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: _Home(),
  ));
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                "the image will still work even if your divice is not connect wifi , because chached it "),
          ),
          SizedBox(
            height: 10,
          ),
          Image(
              image: CachedNetworkImageProvider(
                  "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif")),
        ],
      ),
    );
  }
}
