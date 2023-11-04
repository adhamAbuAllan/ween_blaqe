import 'package:flutter/material.dart';
import 'package:ween_blaqe/constants/nums.dart';
class StartSimpleWidget extends StatefulWidget {
  const StartSimpleWidget({super.key, required this.child});
final  Widget child;
  @override
  State<StartSimpleWidget> createState() => _StartSimpleWidgetState();
}

class _StartSimpleWidgetState extends State<StartSimpleWidget> {
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(home: Scaffold(
      backgroundColor: kBackgroundAppColor,
      body: Center(child:widget.child),),);
  }
}
