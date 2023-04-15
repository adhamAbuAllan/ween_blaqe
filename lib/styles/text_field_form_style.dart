import 'package:flutter/material.dart';
final orangeTextFormField  = TextFormField (
  decoration: InputDecoration(
    enabledBorder:OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,color: Colors.orange.shade500,
      ),
      borderRadius: BorderRadius.circular(7)
    )
  ),
);