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
  bool shouldWelcomeUser = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: AnimatedCrossFade(
            // layoutBuilder: (topChild, topChildKey, bottomchild, bottomChildkey) {
            //   return Stack(
            //     alignment: Alignment.center,
            //
            //     children: [
            //       Positioned(
            //
            //         key: bottomChildkey,
            //         top: 0,
            //         child: bottomchild,
            //       )     ,
            //       Positioned(
            //         key: topChildKey,
            //
            //         child: topChild,
            //       ),
            //
            //     ],
            //   );
            // },
            firstChild: TextButton(onPressed: (){
              setState(() {
                shouldWelcomeUser = false;
              });
              },child:Text("hello,click me")),




            secondChild: TextButton(onPressed: (){
              setState(() {
                shouldWelcomeUser = true;

              });
                },
                child: Text("goodbye,click me")),
            crossFadeState: shouldWelcomeUser
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 700)),
      ),
    );
  }
}
