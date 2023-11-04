import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: _Home()));
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  double width = 100;
  bool isClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width/1.5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Delicious Candy",
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () {
                if(isClick == false){
                  width = 100;
                  isClick = true;
                }else {
                  width = 200;
                  isClick = false;
                }
                setState(() {
                  isClick != isClick;
                  setState(() {
                    width = width;

                    print(isClick );
                  });
                });
              },
              child: Container(
                width: width,
                color: Colors.blue,
                height: width,
                child: const Text("Tap Me!"),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
