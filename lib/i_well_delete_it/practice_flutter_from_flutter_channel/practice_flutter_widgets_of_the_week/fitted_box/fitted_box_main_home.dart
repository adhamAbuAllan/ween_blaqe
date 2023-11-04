import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: _Home()));
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          color: Colors.orange,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FittedBox(
              clipBehavior: Clip.hardEdge,
              fit: BoxFit.fill,
              child: Text("this is a pretty long text ",style: TextStyle(color: Colors.white),),
            ),
          ),
        ),
      ),
    );
  }
}
