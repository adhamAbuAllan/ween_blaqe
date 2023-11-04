import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:_Home()));
}

// Step 1: Create a shared ValueNotifier to hold the common value.
final ValueNotifier<int> sharedValueNotifier = ValueNotifier<int>(0);

class _Home extends StatefulWidget {
  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Center(
          child: ValueListenableBuilder(
            //valueListenable attribute make the vlaue changeable
            valueListenable: sharedValueNotifier,
            builder: (context, value, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Value in Widget 1: $value',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Value in Widget 2: $value',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Update the shared value when the FloatingActionButton is pressed.
            sharedValueNotifier.value++;
          },
          child: Icon(Icons.add),
        ),
      );

  }
}
