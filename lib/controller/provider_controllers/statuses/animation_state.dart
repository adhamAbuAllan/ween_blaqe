import 'package:flutter_animate/flutter_animate.dart';

class AnimationState {
  final Animate? animate;

  AnimationState({
    this.animate,
  });

  AnimationState copyWith({
    Animate? animate,
  }) {
    return AnimationState(
      animate: animate ?? this.animate,
    );
  }
}
