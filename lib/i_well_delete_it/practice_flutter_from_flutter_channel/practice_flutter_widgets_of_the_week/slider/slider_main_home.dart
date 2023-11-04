import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(
    home: _Home(),
  ));
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  // get selectedRange => const RangeValues(.2, .8);
  // double _currentValue = 0;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoSliderHome(),
          RangeSliderHome()
        ],
      ),
    );
  }
}

class CupertinoSliderHome extends StatefulWidget {
  const CupertinoSliderHome({super.key});

  @override
  State<CupertinoSliderHome> createState() => _CupertinoSliderHomeState();
}

class _CupertinoSliderHomeState extends State<CupertinoSliderHome> {
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlider(
      value: _currentValue,
      min: 0,
      max: 10,
      divisions: 10,
      onChanged: (selectedValue) {
        setState(() {
          _currentValue = selectedValue;
        });
      },
    );
  }
}

class RangeSliderHome extends StatefulWidget {
  const RangeSliderHome({super.key});

  @override
  State<RangeSliderHome> createState() => _RangeSliderHomeState();
}

class _RangeSliderHomeState extends State<RangeSliderHome> {
  RangeValues values = const RangeValues(.1, .5);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels =
        RangeLabels(values.start.toString(), values.start.toString());

    return RangeSlider(
      divisions: 8,
        labels: labels,
        values: values,
        onChanged: (newValues) {
          setState(() {
            values = newValues;
          });
        });
  }
}
