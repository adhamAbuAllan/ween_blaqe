import 'package:flutter/material.dart';

import '../../api/cities.dart';
import '../../styles/button.dart';

Widget city(City city,Function onClick){
  return  Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
      width: 80,
      height: 40,
      child: OutlinedButton(
          onPressed: () {
            onClick.call(
              // print(city)
            );
          },
          child: Text(city.name),
          style: outlineButton),
    ),
  );
}
