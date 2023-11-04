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
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
// I don't knew what this widget mean 

      alignment: Alignment.center,
      child: Semantics(
        label: 'Counter button',
        hint: 'Press to increase',
        value: '$_counter',
        onTap: () {
          setState(() {
            _counter++;
          });
          debugPrint("you click me");
        },
        child: Text(
          '$_counter',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    )
        // Column(
        //   children: [

        //     Semantics(
        //       enabled: false,
        //       readOnly: true,
        //       button: true,
        //       checked: true,
        //       container: true,
        //       label: "this is the flutte logo",
        //       child: const FlutterLogo(
        //         size: 200,
        //       ),
        //     ),

        //   ],
        // ),
        );
  }
}
