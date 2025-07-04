//animations
//  Animate get a => box
//       .animate(onPlay: (controller) => controller.repeat())
//       .effect(duration: 3000.ms) // this "pads out" the total duration
//       .effect(delay: 750.ms, duration: 1500.ms); // set defaults


import 'package:flutter_riverpod/flutter_riverpod.dart';



final bottomNavProvider = StateProvider<int>((ref) => 0);
final animationTriggerProvider = StateProvider<int?>((ref) => null);