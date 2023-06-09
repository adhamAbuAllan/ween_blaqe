import 'package:flutter/material.dart';
import 'package:ween_blaqe/api/advantages.dart';

Widget showAllAdvantages(Advantage advantages) {
  var advantageName = advantages.advName;
  var icon = advantages.icon;
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(200, 0, 10, 0),
            child: Text(
            advantageName,
              style: TextStyle(
                fontFamily: 'IBM',
              ),
            ),
          ),
          Image(
            image: AssetImage(icon),
            width: 32,
            height: 32,
          ),
        ]),
      )
    ],
  );
}
