import 'package:flutter/material.dart';

class DateAsText extends StatefulWidget {
  final DateTime date;
  const DateAsText({Key? key, required this.date}) : super(key: key);

  @override
  State<DateAsText> createState() => _DateAsTextState();
}

class _DateAsTextState extends State<DateAsText> {
  @override
  Widget build(BuildContext context) {
    var date = widget.date;
    return Scaffold(
      body: Text("$date"),
    );
  }
}
