import 'package:flutter/material.dart';

extension ColorToHex on Color {
  String toHex() {
    return '#${this.value.toRadixString(16).substring(2).toUpperCase()}';
  }
}
