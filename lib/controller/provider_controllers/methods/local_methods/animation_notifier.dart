import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ween_blaqe/controller/provider_controllers/statuses/animation_state.dart';
import 'package:flutter/material.dart';
class AnimationNotifier extends StateNotifier<AnimationState> {
  AnimationNotifier() : super(AnimationState());

  late AnimationController controller;

  Animate buildAnimationWidget({
    required Widget child,
    required TickerProvider vsync,
  }) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 3000), // total animation span
    );

    return child
        .animate(controller: controller, autoPlay: false) // disable auto start
        .effect(duration: 2000.ms) // pads total time
        .effect(delay: 750.ms, duration: 1500.ms)
        .scaleXY(end: 1.15, curve: Curves.easeOutBack)
        .moveY(end: -10)
        .elevation(end: 24);
  }
  void replay() {
    controller.forward(from: 0);
  }
}