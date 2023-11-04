import 'package:flutter/material.dart';

class OpacityHome extends StatefulWidget {
  const OpacityHome({super.key});

  @override
  State<OpacityHome> createState() => _OpacityHomeState();
}

class _OpacityHomeState extends State<OpacityHome> {
  // var myOpacity = 0.9;
  @override
  void initState() {
    super.initState();
    // setState(() => myOpacity = 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          // alwaysIncludeSemantics: true,
          duration: const Duration(seconds: 1),
          opacity: .9,
          child: Container(
            // transform: Matrix4.rotationZ(.2),
            // transform: Matrix4.fromList(List<doul),

            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(7)),
            width: 100.0 * 2,
            height: 200.0 * 2,

            child: const FlutterLogo(size: 75),
          ),
        ),
      ),
    );
  }
}
