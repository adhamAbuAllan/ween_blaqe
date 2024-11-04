import 'package:flutter/material.dart';
List<String> getAllTextValues(Widget widget) {
  List<String> textValues = [];

  void _extractTextValues(Widget widget) {
    if (widget is Text) {
      textValues.add(widget.data ?? ''); // Add text content to the list
    } else if (widget is MultiChildRenderObjectWidget) {
      // Recursively traverse children ofMultiChildRenderObjectWidget
      widget.children.forEach(_extractTextValues);
    } else if (widget is SingleChildRenderObjectWidget) {
      // Recursively traverse child of SingleChildRenderObjectWidget
      if (widget.child != null) {
        _extractTextValues(widget.child!);
      }
    }
  }

  _extractTextValues(widget);
  return textValues;
}
