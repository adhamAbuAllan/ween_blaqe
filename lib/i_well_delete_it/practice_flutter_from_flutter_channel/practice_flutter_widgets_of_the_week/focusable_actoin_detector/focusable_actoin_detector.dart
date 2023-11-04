import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FocusableActionDetector Mobile Example'),
        ),
        body: Center(
          child: FocusableActionDetectorMobileExample(),
        ),
      ),
    );
  }
}

class FocusableActionDetectorMobileExample extends StatefulWidget {
  @override
  _FocusableActionDetectorMobileExampleState createState() =>
      _FocusableActionDetectorMobileExampleState();
}

class _FocusableActionDetectorMobileExampleState
    extends State<FocusableActionDetectorMobileExample> {
  final textController = TextEditingController();
  final FocusNode textFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    textFocusNode.addListener(() {
      if (textFocusNode.hasFocus) {
        // Register the action with the focus manager
        FocusableActionDetector;
      } else {
        // Unregister the action when the text field loses focus
        FocusableActionDetector;
      }
    });
  }

  @override
  void dispose() {
    textController.dispose();
    textFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Press the Enter key after typing in the text field:'),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: textController,
            focusNode: textFocusNode,
            decoration: InputDecoration(
              labelText: 'Type Here',
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // This button is also clickable with touch input.
            print('Button Pressed');
            // Add your action when the button is pressed here.
          },
          child: Text('Click Me!'),
        ),
      ],
    );
  }
}
// Autocomplete<String> autocomplete(){
//   return Autocomplete(optionsBuilder: (textEditValue){
//     return
//   });
// }