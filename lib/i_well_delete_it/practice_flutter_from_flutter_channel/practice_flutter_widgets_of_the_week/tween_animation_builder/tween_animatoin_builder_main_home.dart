import 'package:flutter/material.dart';
main() {
  runApp( const MaterialApp(
    home: TweenAnimationExample()));
}
class TweenAnimationExample extends StatelessWidget {
  const TweenAnimationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body   : Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(seconds: 3),
          builder: (BuildContext context, double size, Widget? child) {
            return Transform.scale(
              scale: size,
              child: child,
            );
          },
          child: const FlutterLogo(size: 200),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// main() {
//   runApp(const MaterialApp(
//     home: _Home(),
//   ));
// }
//
// class _Home extends StatefulWidget {
//   const _Home();
//
//   @override
//   State<_Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<_Home> {
//   Color _colorValue = Colors.white10;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Center(
//           child: TweenAnimationBuilder(
//             tween: ColorTween(begin: Colors.white,end: Colors.orange),
//             duration: Duration(seconds: 2),
//             builder: (_,Color color,__){
//               return ColorFiltered(
//                 child: Image.asset('assets/I_will_delete_it/images/sun.jpg'),
//                 colorFilter: ColorFilter.mode(color, BlendMode.modulate),);
//             },
//           ),
//         )
//       ],
//     );
//   }
// }
// //create TweenAnimationBluider widget ?
