//build a ui that have an image , this image make an animation when click on the button
// that also , have many of functions every function have diffrent animations type
// that could to use any of them on the animation widget to effect on the image
// the animation type like fade in , blur , scale , move , rotate , etc
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: _HomePage());
  }
}
class _HomePage extends StatefulWidget {
  const _HomePage({super.key});

  @override
  State<_HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<_HomePage> {
  // to store the selected animation type
  int _selectedAnimationType = 0;

  // to store the animated widget
  late Widget _animationWidget;

  @override
  void initState() {
    super.initState();
    // initialize the animation widget with default animation type
    _animationWidget = choseAnimationList(_selectedAnimationType,
        child: imageOfSplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen Animation'),
      ),
      drawer: drawerToChooseAnimationType(), // Drawer to choose animation type
      body: Center(
        child: _animationWidget, // Display the animated widget
      ),
    );
  }

// a Drawer to choose animation type UI
  // that have a Button that every button have diffrent animation type
  //without the slider
 Widget drawerToChooseAnimationType() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Choose Animation Type',
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          for (int i = 0; i <= 8; i++)
            ListTile(
              title: Text('Animation Type $i'),
              onTap: () {
                setState(() {
                  _selectedAnimationType = i;
                  _animationWidget = choseAnimationList(_selectedAnimationType,
                      child: imageOfSplashScreen());
                });
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }


  // Function to choose animation type
  Widget choseAnimationList(int type, {required Widget child}) {
    return choseAnimationType(type, child: child);
  }

  // many pages every page have diffrent animation type
  Widget choseAnimationType(int type, {required Widget child}) {
    switch (type) {
      case 1:
        return _buildRotateAnimation(child: child);
      case 2:
        return buildMoveAnimation(child: child);
      case 3:
        return _buildScaleAnimation(child: child);
      case 4:
        return _buildCombinedAnimation(child: child);
      case 5:
        return _buildStaggeredAnimation(child: child);
      case 6:
        return _buildLoopingAnimation(child: child);
      case 7:
        return _buildDelayedAnimation(child: child);
      case 8:
        return _buildCustomCurveAnimation(child: child);
      case 0:
      default:
        return _buildAnimatedWidget(child: child);
    }
  }

  // and the same image
//expanded to fit the screen
  Widget imageOfSplashScreen() {

    return Image.asset(
      'assets/images/splash screen heigh qulity with large size.png',
      width: double.infinity,
      height: double.infinity,
    );
  }

  // Function to build animated widget
  Widget _buildAnimatedWidget({required Widget child}) {
    return child
        .animate()
        .fadeIn()
        .blurXY(begin: 64.0, end: 0.0)
        .scaleXY(begin: 3.6, end: 1.0);
  }

  // You can add more functions for different animation types here
  Widget _buildRotateAnimation({required Widget child}) {
    return child.animate().rotate(begin: -1.0, end: 0.0).fadeIn();
  }

  Widget buildMoveAnimation({required Widget child}) {
    return child
        .animate()
        .move(begin: const Offset(0, -100), end: Offset.zero)
        .fadeIn();
  }

  Widget _buildScaleAnimation({required Widget child}) {
    return child.animate().scaleXY(begin: 0.0, end: 1.0).fadeIn();
  }

  Widget _buildCombinedAnimation({required Widget child}) {
    return child
        .animate()
        .fadeIn()
        .scaleXY(begin: 0.5, end: 1.0)
        .blurXY(begin: 32.0, end: 0.0);
  }

  Widget _buildStaggeredAnimation({required Widget child}) {
    return child
        .animate()
        .fadeIn()
        .then()
        .scaleXY(begin: 0.5, end: 1.0)
        .then()
        .blurXY(begin: 32.0, end: 0.0);
  }

  Widget _buildLoopingAnimation({required Widget child}) {
    return child
        .animate()
        .fadeIn()
        .then()
        .scaleXY(begin: 0.5, end: 1.0)
        .then()
        .blurXY(begin: 32.0, end: 0.0);
  }

  Widget _buildDelayedAnimation({required Widget child}) {
    return child
        .animate()
        .fadeIn(delay: 500.ms) 
        .then()
        .scaleXY(begin: 0.5, end: 1.0)
        .then()
        .blurXY(begin: 32.0, end: 0.0);
  }

  Widget _buildCustomCurveAnimation({required Widget child}) {
    return child
        .animate()
        .fadeIn(curve: Curves.bounceOut)
        .then()
        .scaleXY(begin: 0.5, end: 1.0, curve: Curves.elasticOut)
        .then()
    h
}
