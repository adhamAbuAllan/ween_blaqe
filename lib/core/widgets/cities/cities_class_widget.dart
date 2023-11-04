import 'package:flutter/material.dart';
import 'package:ween_blaqe/core/utils/styles/button.dart';

import '../../../api/cities.dart';



Widget city(City city, Function onClick) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
      width: 80,
      height: 40,
      child: OutlinedButton(
          onPressed: () {
            onClick.call();
          },
          style: outlineButton,
          child: Text(city.name)),
    ),
  );
}
