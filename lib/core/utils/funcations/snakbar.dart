import 'package:flutter/material.dart';

void showSnakBar(@required BuildContext context, @required String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  
      content: Text(
    message,
    style: const TextStyle(fontSize: 16, fontFamily: "IBM"),
  )));
}
