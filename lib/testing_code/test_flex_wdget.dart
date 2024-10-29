import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //
      home: Scaffold(
        backgroundColor: Colors.black26,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 48.0),
            child: OverflowBar(
              spacing: 10.0,
              overflowSpacing: 5.0,
              overflowAlignment: OverflowBarAlignment.end,
              // Remove or set alignment: MainAxisAlignment.start, // This is not needed for horizontal alignment

              // Wrap children in a Row for horizontal arrangement
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Button 1'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Button 2'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Button 3'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Button 4'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Button 5'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
